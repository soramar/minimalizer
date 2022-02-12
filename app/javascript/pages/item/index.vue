<template>
 <div>
    <div class="d-flex">
      <div class="col-4 bg-light rounded shadow m-3 p-3">
        <div class="h4">TODO</div>
        <div class="item-content">
          <div
            v-for="item in items" :key="item.id" :id="'item-' + item.id"
            class="bg-white border shadow-sm rounded my-2 p-4"
            @click="handleShowItemDetailModal(item)">
            <span>{{ item.name }}</span>
            
          </div>
        </div>
        <button class="btn btn-secondary" @click="handleShowItemCreateModal">タスクを追加</button>
      </div>
    </div>
    <div class="text-center">
      <router-link :to="{ name: 'TopIndex' }" class="btn btn-dark mt-5">戻る</router-link>
  </div>

<!--詳細・更新モーダル-->
  <transition name="fade">
    <ItemDetailModal 
      v-if="isVisibleItemDetailModal"
      :item="itemDetail"
      @delete-item="handleDeleteItem"
      @update-item="handleUpdateItem"
      @close-modal="handleCloseItemDetailModal"/>
  </transition>

<!--登録モーダル-->
  <transition name="fade">
    <div id="item-create-modal" v-if="isVisibleItemCreateModal">
    <div class="modal" @click.self="handleCloseItemCreateModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <div class="form-group">
              <label for="name">名前</label>
              <input v-model="name" type="text" class="form-control" id="name">
            </div>
            <div class="form-group">
              <label for="purchase_date">購入日</label>
              <input v-model="purchase_date" type="date" id="purchase_date" class="form-control" >
            </div>
            <div class="form-group">
              <label for="price">金額</label>
              <input v-model="price" type="number" id="price" class="form-control">
            </div>
            <div class="form-group">
              <label for="description">備考</label>
              <input v-model="description" type="textarea" id="description" class="form-control">
            </div>
            <div class="d-flex justify-content-between">
              <button class="btn btn-success" 
              @click="handleCreateItem">追加</button>
              <button class="btn btn-secondary" @click="handleCloseItemCreateModal">閉じる</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show"></div>
  </div>
  </transition>
 </div>
</template>

<script>
import ItemDetailModal from "./components/ItemDetailModal"

export default {
  name: "ItemIndex",
  components: {
    ItemDetailModal
  },
  data() {
    return {
      items: [],
      itemDetail: {},
      isVisibleItemDetailModal: false,
      isVisibleItemCreateModal: false,
    }
  },

  created () {
    this.fetchItems();
  },

  methods: {
    fetchItems() {
      this.$axios.get("items")
        .then(res => this.items = res.data)
        .catch(err => console.log(err.status));
    },

    handleUpdateItem() {
      this.$axios.post('items', {
        name: this.name,
        purchase_date: this.purchase_date,
        price: this.price,
        description: this.description})
      .then(res => this.items.push(res.data),
        this.handleCloseItemCreateModal())
      .catch(error => console.log(error))     
    },

    handleUpdateItem(id, item) {
      this.$axios.patch('items/' + id, {
        item
      })
      .then(res => this.items(res.data),
        this.handleCloseItemDetailModal())
      .catch(error => console.log(error)) 
    },

    handleDeleteItem(id) {
      this.$axios.delete('items/' + id, {
        name: this.name,
        purchase_date: this.purchase_date,
        price: this.price,
        description: this.description})
      .then(res => this.items(res.data),
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