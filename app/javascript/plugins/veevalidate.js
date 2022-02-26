import Vue from 'vue';
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate';
import { required, numeric, max} from 'vee-validate/dist/rules';

Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);

extend('required', {
  ...required,
  message: '{_field_}は必須項目です'
});

extend('numeric', {
  ...numeric,
  message: '{_field_}は数字のみ使用できます'
});

extend('max', {
  ...max,
  message: '{_field_}は{length}文字以下で入力してください'
});