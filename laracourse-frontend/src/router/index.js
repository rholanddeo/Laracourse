import { createRouter, createWebHistory } from "vue-router";
import store from "@/store";

const routes = [
    {
      path: "/",
      name: "home",
      component: () => import("../views/HomeView.vue"),
    },
    {
      path: "/course",
      name: "course",
      component: () => import("../views/Course/Index.vue"),
      meta: {
        auth: true,
      },
    },
    {
        path: "/materi",
        name: "materi",
        component: () => import("../views/Materi/Index.vue"),
        meta: {
          auth: true,
        },
      },
    {
      path: "/login",
      name: "login",
      component: () => import("../views/Auth/Login.vue"),
      meta: {
        guest: true,
      },
    },
    {
      path: "/register",
      name: "register",
      component: () => import("../views/Auth/Register.vue"),
      meta: {
        guest: true,
      },
    },
    {
        path: "/course/:id/edit",
        name: "course.edit",
        component: () => import("../views/course/Edit.vue"),
        meta: {
          auth: true,
        },
      },
  ];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  linkExactActiveClass: "!text-white",
});

router.beforeEach((to, from, next) => {
    // Jika meta dengan property auth kita set true namun store.getters.authenticated is false maka redirect ke login
    if (to.meta.auth && !store.getters["auth/authenticated"]) {
      router.push("/login");
    }
  
    // jika meta dengan property guest kita set true dan store.getters.authenticated juga true maka redirect ke home
    if (to.meta.guest && store.getters["auth/authenticated"]) {
      router.push("/");
    }
  
    // jika 2 kondisi di atas tidak terpenuhi maka biarkan user masuk
    next();
  });

export default router;