<template>
  <div id="item-create-modal">
    <div class="modal" @click.self="handleCloseModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <div class="form-group">
              <label for="name">タイトル</label>
              <input v-model="item.name" type="text" class="form-control"
               id="name">
            </div>

            <div class="form-group">
              <label for="category">カテゴリー</label>
              <div class="category-nav">
                <select class="select-category" v-model="item.category" >
                  <option value="clothes">服</option>
                  <option value="furniture">家具</option>
                  <option value="valuables">貴重品</option>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label for="purchase_date">購入日</label>
              <input v-model="item.purchase_date" type="date"
              class="form-control" id="name">
            </div>
            <div class="form-group">
              <label for="price">金額</label>
              <input v-model="item.price" type="number" class="form-control" id="price">
            </div>
            <div class="form-group">
              <label for="description">備考</label>
              <textarea v-model="item.description" type="string" class="form-control" id="description">
              </textarea>
            </div>
            <div class="d-flex justify-content-between">
              <button class="btn btn-success" 
              @click="handleCreateItem">追加</button>
              <button class="btn btn-secondary" @click="handleCloseModal">
                閉じる</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show"></div>
  </div>
</template>

<script>
export default {
  name: "ItemCreateModal",
  data() {
    return {
      item: {
        name: '',
        category: '',
        purchase_date: '',
        price: '',
        description: ''
     }
   }
  },

  
  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    },
    handleCreateItem() {
      this.$emit('create-item', this.item)
    }
  }
}
</script>

<style scoped>
.modal {
  display: block;
}
</style>