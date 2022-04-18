<template>
  <div>
    <user-form :user="user" @create-user="handleCreateUser"></user-form>
    <div>
      <router-view></router-view>
    </div>
  </div>
  
</template>

<script>
import UserForm from "./components/UserForm"

export default {
  name: "UserNew",
  components: {
    UserForm
  },
  data() {
    return {
      user: []
    }
  },
  methods: {
    handleCreateUser(user) {
      this.$axios.post(`/api/users`, user)
        .then(res => this.user = res.data,
        　this.$router.push(`/login`))
        .catch(err => console.log(err.status));
    }
  },
}
</script>

<style scoped>
</style>