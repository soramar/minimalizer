<template>
  <div :id="'item-detail-modal-' + item.id">
    <div class="modal" @click.self="handleCloseModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">{{ item.name }}</h5>
          </div>

          <div class="modal-body" v-if="item.purchase_date">
            <h5>{{ item.purchase_date | moment("YYYY年MM月DD日") }}</h5>
          </div>

          <div class="modal-body" v-if="item.price">
            <h5>{{ item.price }}円</h5>
          </div>

          <div class="modal-body" v-if="item.description">
            <h5>{{ item.description }}</h5>
          </div>

          <div class="modal-footer">
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
    }
  }
}
</script>

<style scoped>
.modal {
  display: block;
}
</style>