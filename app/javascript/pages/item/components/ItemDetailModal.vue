<template>
  <div :id="'item-detail-modal-' + item.id">
    <div class="modal" @click.self="handleCloseModal">
      <div class="modal-dialog">
        <transition name="fade">
        <div class="modal-content" v-if="isVisibleItemDetailOnModal">
          <div class="modal-header">
            <div class="form-group">
              <label for="name">名前</label>
              <h5>{{ item.name }}</h5>
            </div>
          </div>
          <div class="modal-body" v-if="item.category">
            <label for="category">カテゴリー</label>
            <h5>{{ item.category }}</h5>
          </div>
          <div class="modal-body" v-if="item.purchase_date">
            <label for="purchase_date">購入日</label>
            <h5>{{ item.purchase_date | moment("YYYY年MM月DD日") }}</h5>
          </div>
          <div class="modal-body" v-if="item.price">
            <label for="price">金額</label>
            <h5>{{ item.price }}円</h5>
          </div>
          <div class="modal-body" v-if="item.description">
            <label for="description">備考</label>
            <h5>{{ item.description }}</h5>
          </div>   

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" @click="handleShowUpdateModal">編集</button>
            <button type="button" class="btn btn-secondary" @click="handleDeleteItem">削除</button>
            <button type="button" class="btn btn-secondary" @click="handleCloseModal">閉じる</button>
          </div>
        </div>
      </transition>

      <transition name="fade">
        <div class="modal-content" v-if="isVisibleItemUpdateModal">
          <div class="modal-body">
            <ValidationObserver v-slot="{ invalid }">
            <div class="form-group">
              <ValidationProvider rules="required|max:30" v-slot="{ errors }" name="名前">
              <label for="name">タイトル
                <span class="text-secondary">（必須）</span>
              </label>
              <input v-model="item.name" type="text" class="form-control" id="name">
              <span class="text-danger">{{ errors[0] }}</span>
           </ValidationProvider>
            </div>
          
            <div class="form-group">
              <ValidationProvider rules="required" :skip-if-empty="false" v-slot="{ errors }" name="カテゴリー">
              <label for="category">カテゴリー
                <span class="text-secondary">（必須）</span>
              </label>
              <div class="category-nav">
                <select class="select-category" v-model="item.category" >
                  <option id=category.id>服</option>
                  <option id=category.id>家具</option>
                  <option id=category.id>貴重品</option>
                </select>
              </div>
              <span class="text-danger">{{ errors[0] }}</span>
            </ValidationProvider>
            </div>

            <div class="form-group">
              <label for="purchase_date">購入日</label>
              <input v-model="item.purchase_date" 
               type="date" class="form-control" id="purchase_date">
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
                <textarea v-model="item.description" type="string" class="form-control" id="description"></textarea>
                <span class="text-danger">{{ errors[0] }}</span>
              </ValidationProvider>
            </div>

            <div class="d-flex justify-content-between">
              <button class="btn btn-success" 
              @click="handleUpdateItem" :disabled="invalid">更新</button>
              <button class="btn btn-secondary" @click="handleCloseModal">
                閉じる</button>
            </div>
          </ValidationObserver>
          </div>
        </div>
      </transition>
      </div>
    </div>
    <div class="modal-backdrop show"></div>
  </div>
</template>

<script>
export default {
  name: "ItemDetailModal",
  data() {
    return {
      isVisibleItemDetailOnModal: true,
      isVisibleItemUpdateModal: false
    }
  },

  props: {
    item: {
      name: {
        type: String,
        required: true
      },
      category: {
        type: String,
        required: true
      },
      purchase_date: {
        type: Date,
        required: true
      },
      price: {
        type: Number,
        required: true
      },
      description: {
        type: String,
        required: true
      }
    }
  },
  
  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    },
    handleShowUpdateModal() {
      this.isVisibleItemDetailOnModal = false;
      this.isVisibleItemUpdateModal = true;
    },
    handleDeleteItem() {
      this.$emit('delete-item', this.item.id, this.item)
    },

    handleUpdateItem() {
      this.$emit('update-item', this.item.id, this.item)
    }
  }
}
</script>

<style scoped>
  .fade-enter-active, .fade-leave-active {
  transition: opacity .0s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
.modal {
  display: block;
}
</style>

