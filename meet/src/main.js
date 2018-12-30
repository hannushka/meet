// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import router from './router'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faUserFriends, faComments, faCalendar, faPlus } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import App from './App'
import Navbar from '@/components/Navbar'

library.add(faUserFriends)
library.add(faComments)
library.add(faCalendar)
library.add(faPlus)

Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.component('navbar', Navbar)

Vue.config.productionTip = false
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
