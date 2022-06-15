import Vue from "vue"
import Router from "vue-router"

import TopIndex from "../pages/top/index"
import ItemIndex from "../pages/item/index"
import UserNew from "../pages/user/index"
import Login from "../pages/login/index"

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: '/',
      component: TopIndex,
      name: 'TopIndex'
    },
    {
      path: '/login',
      component: Login,
      name: 'Login'
    },
    {
      path: `/items/:userId`,
      component: ItemIndex,
      name: 'ItemIndex',
    },
    {
      path: '/users',
      component: UserNew,
      name: 'UserNew'
    }
  ]
})

export default router;