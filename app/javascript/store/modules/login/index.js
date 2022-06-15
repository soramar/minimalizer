import axios from 'axios'

  const state = {
    userId: ''
  }

  const getters = {
    loggedIn(state){
      return !!state.userId
    }
  }

  const mutations = {
    setUserId(state, user) {
      state.userId = user.id
    }
  }

  const actions = {
    createUserId({commit}, user){
      return axios.post('/api/login', user)
      .then(res => {
        commit('setUserId', res.data)
        console.log(res.data)
      })
    }
  }

  const login = {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
  };
  
  export default login;