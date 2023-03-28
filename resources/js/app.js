
import './bootstrap';
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import app from './layouts/app.vue'
import router from '@/router'

import axios from 'axios'
import Toast from "vue-toastification";
import "vue-toastification/dist/index.css";
// import Notifications from '@kyvg/vue3-notification'
const pinia = createPinia()
// import {useRouter} from 'vue-router'
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
// .use(useRouter)
.use(Toast)
.mount('#app')
