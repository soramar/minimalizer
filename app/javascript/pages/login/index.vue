<template>
  <div>
    <h1>ログイン</h1>
    <div>
     <login-form :session="session" @create-session="handleLogin"></login-form>
   </div>
   <div class="user-new">
     <router-link to="/users">新規登録</router-link>
   </div>
  </div>
</template>

<script>
import LoginForm from "./components/LoginForm"

export default {
  name: 'Login',
  components: {
      LoginForm
  },
  data() {
    return {
      session: []
    }
  },

  methods: {
    handleLogin(session) {
      this.$axios.post('/api/login', session)
        .then(res => { 
          this.session = res.data,
          this.$router.push({ path: `/items/${this.session.id}`})})
        .catch(err => console.log(err.status));
    }
  }
}
</script>

<style>
  .user-new{
    margin-left: 700px;
  }
</style>