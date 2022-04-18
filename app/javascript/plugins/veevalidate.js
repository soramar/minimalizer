import Vue from 'vue';
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate';
import { required, email, confirmed, alpha_num, numeric, max, min } from 'vee-validate/dist/rules';

Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);

extend('required', {
  ...required,
  message: '{_field_}は必須項目です'
});

extend('email', {
  ...email,
  message: '{_field_}の形式で入力してください'
});

extend('confirmed', {
  ...confirmed,
  message: 'パスワードが一致しません'
});

extend('alpha_num', {
  ...alpha_num,
  message: '{_field_}は英数字のみ使用できます'
});

extend('numeric', {
  ...numeric,
  message: '{_field_}は数字のみ使用できます'
});

extend('max', {
  ...max,
  message: '{_field_}は{length}文字以下で入力してください'
});

extend('min', {
  ...min,
  message: '{_field_}は{length}文字以上で入力してください'
});