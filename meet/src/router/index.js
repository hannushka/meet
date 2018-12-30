import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/pages/Login'
import Main from '@/pages/Main'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/main',
      name: 'Main',
      component: Main
    }
  ]
})
