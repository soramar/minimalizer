<template>
  <div id="item-create-modal">
    <div class="modal" @click.self="handleCloseModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <ValidationObserver v-slot="{ invalid }">
            <div class="form-group">
              <ValidationProvider rules="required|max:30" v-slot="{ errors }" name="名前">
              <label for="name">名前
                <span class="text-secondary">（必須）</span>
              </label>
              <input v-model="item.name" type="text" class="form-control"
               id="name">
               <span class="text-danger">{{ errors[0] }}</span>
              </ValidationProvider>
            </div>

            <div class="form-group">
              <ValidationProvider rules="required" :skip-if-empty="false" v-slot="{ errors }" name="カテゴリー">
              <label for="category">カテゴリー
                <span class="text-secondary">（必須）</span></label>
              <div class="category-nav">
                <select class="select-category" v-model="item.category">
                  <option value="" disabled>選択してください</option>
                  <option>服</option>
                  <option>家具</option>
                  <option>貴重品</option>
                </select>
              </div>
              <span class="text-danger">{{ errors[0] }}</span>
            </ValidationProvider>
            </div>

            <div class="form-group">
              <label for="purchase_date">購入日</label>
              <input v-model="item.purchase_date" type="date"
              class="form-control" id="name">
            </div>

            <div class="form-group">
              <ValidationProvider rules="numeric" v-slot="{ errors }" name="金額">
              <label for="price">金額</label>
              <input v-model="item.price" type="text" class="form-control" id="price">
              <span class="text-danger">{{ errors[0] }}</span>
            </ValidationProvider>
            </div>

            <div class="form-group">
              <ValidationProvider rules="max:300" v-slot="{ errors }" name="備考">
              <label for="description">備考</label>
              <textarea v-model="item.description" type="string" class="form-control" id="description">
              </textarea>
              <span class="text-danger">{{ errors[0] }}</span>
            </ValidationProvider>
            </div>

            <div class="d-flex justify-content-between">
              <button class="btn btn-success" 
              @click="handleCreateItem" :disabled="invalid">追加</button>
              <button class="btn btn-secondary" @click="handleCloseModal">
                閉じる</button>
            </div>
          </ValidationObserver>
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
        description: '',
        user_id: this.$route.params.userId
     },
   }
  },

  methods: {
  
    handleCloseModal() {
      this.$emit('close-modal')
    },
    handleCreateItem() {
      this.$emit('create-item', this.item)
    },
  }
}
</script>

<style scoped>
.modal {
  display: block;
}
</style>