<template>
  <div>
    <div class="container">
      <div class="d-inline-flex mt-4 ml-5">
       <button class="btn btn-secondary" @click="handleShowItemCreateModal">
       追加</button>
       <h4>{{this.$route.params.userId}}</h4>
      </div>
    </div>

    <div class="row">
        <div class="col-md-3 col-sm-3 bg-light rounded shadow m-5 p-3">
          <div class="h5">服</div>
          <div class="item-content">
            <div v-for="item in filterClothesItem" :key="item.id" :id="'item-' + item.id" class="bg-white border shadow-sm rounded my-2 p-4"
              @click="handleShowItemDetailModal(item)">
              <span>{{ item.name }}</span>
            </div>
          </div>
        </div>

        <div class="col-md-3 col-sm-3 bg-light rounded shadow  m-5 p-3">
          <div class="h5">家具</div>
          <div class="item-content" >
            <div v-for="item in filterFurnitureItem" :key="item.id"  :id="'item-' + item.id"
              class="bg-white border shadow-sm rounded my-2 p-4"
              @click="handleShowItemDetailModal(item)">
              <span>{{item.name}}</span>
            </div>
          </div>
        </div>

        <div class="col-md-3 col-sm-3 bg-light rounded shadow m-5 p-3">
          <div class="h4">貴重品</div>
          <div class="item-content" >
            <div v-for="item in filterValuablesItem" :key="item.id"  :id="'item-' + item.id"
              class="bg-white border shadow-sm rounded my-2 p-4"
              @click="handleShowItemDetailModal(item)">
              <span>{{item.name}}</span>
            </div>
          </div>
        </div>
    </div>
  
  <transition name="fade">
    <ItemDetailModal 
      v-if="isVisibleItemDetailModal"
      :item="itemDetail"
      @delete-item="handleDeleteItem"
      @update-item="handleUpdateItem"
      @close-modal="handleCloseItemDetailModal"/>
  </transition>
  
  <transition name="fade">
    <ItemCreateModal
        v-if="isVisibleItemCreateModal"
        @close-modal="handleCloseItemCreateModal"
        @create-item="handleCreateItem"/>
  </transition>
 </div>
</template>

<script>
import ItemDetailModal from "./components/ItemDetailModal"
import ItemCreateModal from "./components/ItemCreateModal"

export default {
  name: "ItemIndex",
  components: {
    ItemDetailModal,
    ItemCreateModal
  },
  
  data() {
    return {
      itemDetail: {},
      isVisibleItemDetailModal: false,
      isVisibleItemCreateModal: false,
      items: []
    }
  },
  
  computed: {
    changeDataUserId(){
      return this.$route.params.userId - 0
    },

    filterClothesItem() {
      return this.items.filter(item => {
       return  item.category === "服" && item.user_id === this.changeDataUserId
      }) 
    },

    filterFurnitureItem() {
      return this.items.filter(item => {
       return  item.category === "家具" && item.user_id === this.changeDataUserId
      }) 
    },

    filterValuablesItem() {
      return this.items.filter(item => {
       return  item.category === "貴重品" && item.user_id === this.changeDataUserId
      })
    }
  }, 

  created() {
    this.fetchItems()
  },

  methods: {
    fetchItems() {
      this.$axios.get(`/api/items`)
      .then(res => this.items = res.data)
      .catch(err => console.log(err.status));
    },
    
    handleCreateItem(item) {
      this.$axios.post(`/api/items`, item)
        .then(res => this.fetchItems(res.data),
        this.handleCloseItemCreateModal())
      .catch(error => console.log(error))     
    },

    handleUpdateItem(id, item) {
      this.$axios.patch(`/api/items/` + id, item)
      .then(res => this.fetchItems(res.data),
        this.handleCloseItemDetailModal())
      .catch(error => console.log(error)) 
    },

    handleDeleteItem(id, item) {
      this.$axios.delete(`/api/items/` + id, item)
      .then(res => this.fetchItems(res.data),
        this.handleCloseItemDetailModal())
      .catch(err => console.log(err.status));
    },

    handleShowItemDetailModal(item) {
      this.isVisibleItemDetailModal = true;
      this.itemDetail = item;
    },
    handleCloseItemDetailModal() {
      this.isVisibleItemDetailModal = false;
      this.itemDetail = {};
      },

    handleShowItemCreateModal() {
      this.isVisibleItemCreateModal = true;
    },
    handleCloseItemCreateModal() {
      this.isVisibleItemCreateModal = false;
    }
  }
}
</script>

<style scoped>
 .fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
.modal {
  display: block;
}
</style>