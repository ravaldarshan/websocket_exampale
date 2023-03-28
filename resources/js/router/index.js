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
router.beforeEach((to, from, next) => {
  const isAuthenticated = !!sessionStorage.getItem('token');

  if (to.meta.requiresAuth && !isAuthenticated) {
    next('/login')
  } else if (to.name === 'Login' && isAuthenticated) {
    next('/')
  } else {
    next()
  }
})

// router.beforeEach((to, from, next) => {
//   // if(to.matched.some(record => record.meta.requiresAuth)) {
//     if (sessionStorage.getItem('token')) {
//       next()
//       return
//     }
//     next('/login')
//   // } else {
//   //   next()
//   // }
// });

export default router;