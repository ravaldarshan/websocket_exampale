import { createWebHistory, createRouter } from "vue-router";
import Login from "@/views/auth/Login.vue";
import Home from "@/views/Home.vue";

const routes = [
  //home routs
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/login",
    name: "login",
    component: Login,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;