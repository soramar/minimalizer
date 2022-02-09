<template>
  <div :id="'item-detail-modal-' + item.id">
    <div class="modal" @click.self="handleCloseModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <div class="form-group">
              <label for="name">名前</label>
              <h5>{{ item.name }}</h5>
            </div>
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
            <button type="button" class="btn btn-secondary" @click="handleDeleteItem">削除</button>
            <button type="button" class="btn btn-secondary" @click="handleCloseModal">閉じる</button>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show"></div>
  </div>
</template>

<script>
export default {
  name: "ItemDetailModal",
  props: {
    item: {
      id: {
        id: Number,
        required: true
      },
      name: {
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
        type: String
      }
    }
  },
  methods: {
    handleCloseModal() {
      this.$emit('close-modal')
    },

    handleDeleteItem() {
      this.$emit('delete-item', this.item.id);
    }
  }
}
</script>

<style scoped>
.modal {
  display: block;
}
</style>