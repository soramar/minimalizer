import axios from 'axios'

  const state = {
    users: []
  }

  const getters = {
    users: state => state.users
  }

  const mutations = {
    addUser: (state, user) => {
      state.users = user
    }
  }

  const actions = {
    createUser({commit}, user){
      return axios.post('/api/users', user)
      .then(res => {
        commit('addUser', res.data)
      })
    }
  }

const user = {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
};

export default user;