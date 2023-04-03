import { createWebHistory, createRouter } from "vue-router";
import Login from "@/views/auth/Login.vue";
import Home from "@/views/Home.vue";
import About from "@/views/About.vue";
import UserPanelLayout from "@/layouts/UserPanel.vue";
import DefaultLayout from "@/layouts/DefaultLayout.vue";

import Deshboard from "@/views/userpanel/Home.vue";


const routes = [
  //home page and static routs
  {
    path: "/",
    component: DefaultLayout,
    children: [
      {
        path: "",
        name: "Home",
        component: Home,
      },
      {
        path: "/login",
        name: "Login",
        component: Login,
      },
      {
        path: "/about",
        name: "About",
        component: About,
        meta: {
          title: 'About Us',
          metaTags: [
            {
              name: 'description',
              content: 'Learn more about our company and what we do.'
            }
          ]
        }
      },
    ],
  },
 
  //user panel nested routev
  {
    path: "/userpanel",
    component: UserPanelLayout,
    children: [
      {
        path: "/dashboard",
        name: "Dashboard",
        component: Deshboard,
      },
    ],
  },
];


const router = createRouter({
  history: createWebHistory(),
  routes,
});

//prevent auth user for login page 
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

export default router;