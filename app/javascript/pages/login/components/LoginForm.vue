<template>
  <div class="container">
    <div class="row">
      <div class="col-md-4 offset-md-4 col-6 offset-3 py-5">
        <ValidationObserver v-slot="{ invalid }">
        <div class="form-group">
          <ValidationProvider rules="required|email" v-slot="{ errors }" name="メールアドレス">
            <label>メールアドレス</label>
            <input class="form-control" v-model="user.email" type="email">
            <span class="text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>

        <div class="form-group">
          <ValidationProvider rules="required|min:6|alpha_num" v-slot="{ errors }" name="パスワード">
            <label>パスワード</label>
            <input class="form-control" v-model="user.password" type="password">
          <span class="text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>

        <button class="btn btn-success" @click="handleLogin" :disabled="invalid">登録</button>
      </ValidationObserver>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "LoginForm",
    data() {
      return {
        user: {
          email: '',
          password: ''
        },
      }
    },
  
    methods: {
      handleLogin() {
        this.$emit('clicl-login', this.user)
      }
    }
  }
  </script>
  
  <style>
  </style>