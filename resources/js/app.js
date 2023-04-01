
import './bootstrap';
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import app from '@/app.vue'
import router from '@/router'
import { createHead } from "@unhead/vue"
import axios from 'axios'
import Toast from "vue-toastification";
import "vue-toastification/dist/index.css";
const pinia = createPinia()

if(sessionStorage.getItem('token')){
  axios.defaults.headers.common['Authorization'] = 'Bearer '+sessionStorage.getItem('token');
}

createApp(app)
.use(pinia)
.use(router)
.use(createHead())
.use(Toast)
.mount('#app')
