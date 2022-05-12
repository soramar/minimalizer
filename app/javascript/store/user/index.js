import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    users: []
  },

  getters: {
    users: state => state.users
  },

  mutations: {
    addUser: (state, user) => {
      state.users = user
    }
  },

  actions: {
    createUser({commit}, user){
      return axios.post('/api/users', user)
      .then(res => {
        commit('addUser', res.data)
      })
    }
  },
})
export default store;