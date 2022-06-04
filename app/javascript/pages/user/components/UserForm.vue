<template>
  <div class="container">
    <div class="row">
      <div class="col-md-4 offset-md-4 col-6 offset-3 py-5">
        <ValidationObserver v-slot="{ invalid }">
        <div class="form-group">
          <ValidationProvider rules="required|max:30" v-slot="{ errors }" name="ニックネーム">
            <label>ニックネーム</label>
            <input class="form-control" v-model="user.name" type="text">
            <span class="text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>

        <div class="form-group">
          <ValidationProvider rules="required|email" v-slot="{ errors }" name="メールアドレス">
            <label>メールアドレス</label>
            <input class="form-control" v-model="user.email" type="email">
            <span class="text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>

        <div class="form-group">
          <ValidationProvider rules="required|min:6|alpha_num" vid="password" v-slot="{ errors }" name="パスワード">
            <label>パスワード</label>
            <input class="form-control" v-model="user.password" type="password">
          <span class="text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>

        <div class="form-group">
          <ValidationProvider rules="required|confirmed:password" v-slot="{ errors }" name="パスワード確認">
            <label>パスワード確認</label>
            <input class="form-control" v-model="user.password_confirmation" type="password">
          <span class="text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>

        <button class="btn btn-success" @click="handleCreateUser" :disabled="invalid">登録</button>
      </ValidationObserver>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      },
    }
  },

  methods: {
    handleCreateUser() {
      this.$emit('click-user', this.user)
    }
  }
}
</script>

<style>
</style>