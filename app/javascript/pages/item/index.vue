<template>
 <div>
    <div class="d-flex">
      <div class="col-4 bg-light rounded shadow m-3 p-3">
        <div class="h4">TODO</div>
        <div v-for="item in items"
         :key="item.id"
         class="bg-white border shadow-sm rounded my-2 p-4">
          <span>{{ item.name }}</span>
        </div>
      </div>
    </div>
    <div class="text-center">
      <router-link :to="{ name: 'TopIndex' }" class="btn btn-dark mt-5">戻る</router-link>
  </div>
 </div>
</template>

<script>
export default {
  name: "ItemIndex",
  data() {
    return {
      items: []
    }
  },

  created() {
    this.fetchItems();
  },

  methods: {
    fetchItems() {
      this.$axios.get("items")
        .then(res => this.items = res.data)
        .catch(err => console.log(err.status));
    }
  }
}
</script>

<style scoped>
</style>