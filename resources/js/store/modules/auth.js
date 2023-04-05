import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    token: null,
    isAuthenticated: false,
  }),

  actions: {
    setToken(token) {
      this.token = token
    },

    setIsAuthenticated(value) {
      this.isAuthenticated = value
    },
  },

  getters: {
    getToken() {
      return this.token
    },

    isAuthenticated() {
      return this.isAuthenticated
    },
  },
})