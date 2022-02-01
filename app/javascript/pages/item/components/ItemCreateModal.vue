<template>
  <div id="item-create-modal">
    <div class="modal" @click.self="$emit('close-modal')">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <div class="form-group">
              <label for="name">タイトル</label>
              <input
                v-model="name"
                type="text"
                class="form-control"
                id="name">
            </div>
            <div class="d-flex justify-content-between">
              <button class="btn btn-success" 
              @click="$emit('crete-item', name)">追加</button>
              <button class="btn btn-secondary" @click="handleCloseModal">閉じる</button>
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
        name: ''
      }
    }
  },
  methods: {
    
  }
}
</script>

<style scoped>

</style>