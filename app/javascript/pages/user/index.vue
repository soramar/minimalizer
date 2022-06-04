<template>
  <div>
    <user-form @click-user="handleCreateUser"></user-form>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import UserForm from "./components/UserForm"

export default {
  name: "UserNew",
  components: {
    UserForm
  },
  
  methods: {
   ...mapActions('user', ['createUser']),

   async handleCreateUser(user) {
    try {
      await this.createUser(user)
      this.$router.push({ path: '/login'})
    } catch (error) {
       console.log(error)
      }
    }
  }
}
</script>

<style scoped>
</style>