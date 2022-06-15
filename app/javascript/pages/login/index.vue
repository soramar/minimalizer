<template>
  <div>
    <h1>ログイン</h1>
    <div>
     <login-form @clicl-login="handleLogin"></login-form>
   </div>
   <div class="user-new">
    <router-link to="/users">新規登録</router-link>
   </div>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions } from 'vuex'
import LoginForm from "./components/LoginForm"

export default {
  name: 'Login',
  components: {
      LoginForm
  },

  computed:{
    ...mapState('login', ['userId']),
    ...mapGetters('login', ['loggedIn'])
  },

  mounted(){
    console.log(this.loggedIn)
  },

  methods: {
    ...mapActions('login', ['createUserId']),

   async handleLogin(user){
     try{
       await this.createUserId(user)
       this.$router.push({ path: `/items/${this.userId}`})
     } catch (error) {
        console.log(error)
        alert('email又はパスワードに誤りがあります')
      }
    }
  }
}
</script>

<style>
  .user-new{
    margin-left: 700px;
  }
</style>