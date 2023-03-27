
import './bootstrap';
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import app from './layouts/app.vue'
import router from './router/index.js'
import axios from 'axios'
import Notifications from '@kyvg/vue3-notification'
const pinia = createPinia()
// import 'flowbite';
// import store from "./store/index.js";
// ExampleComponent

if(sessionStorage.getItem('token')){
  axios.defaults.headers.common['Authorization'] = 'Bearer '+sessionStorage.getItem('token');
}

createApp(app)
// .use(store)
.use(pinia)
.use(router)
.use(Notifications)
.mount('#app')
