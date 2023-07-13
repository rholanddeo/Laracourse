<template>
    <div class="fixed w-full z-20 py-3 bg-blue-700">
      <div class="flex flex-col lg:flex-row justify-between">
        <div class="flex items-center px-6 lg:pr-0 justify-between">
          <router-link exact-active-class="bg-transparent" class="text-yellow-500 font-extrabold uppercase whitespace-nowrap" to="/">
            L A R A C O U R S E
          </router-link>
  
          <button @click="openNavbar = !openNavbar" class="block lg:hidden focus:outline-none">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
              <path :class="!openNavbar ? 'block' : 'hidden'" stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5M12 17.25h8.25" />
              <path :class="openNavbar ? 'block' : 'hidden'" stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
        <div :class="openNavbar ? 'block' : 'hidden'" class="lg:flex flex-col lg:flex-row lg:items-center justify-between w-full px-6 py-3 lg:py-0">
          <div class="flex flex-col lg:flex-row items-center lg:ms-20">
            <router-link to="/course" :class="className">Course</router-link>
            <router-link to="/materi" :class="className">Materi</router-link>
          </div>
          
          <div class="flex flex-col lg:flex-row lg:items-center whitespace-nowrap" v-if="authenticated">
            <router-link to="/user" :class="className">{{ user.name }}</router-link>
            <button @click="logout" class="focus:outline-none">Logout</button>
          </div>
          <div class="flex flex-col lg:flex-row lg:items-center" v-else>
            <router-link to="/login" :class="className">Login</router-link>
            <router-link to="/register" :class="className">Register</router-link>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
import { computed, ref } from 'vue';
import store from '@/store'

export default {
  setup() {
    const className = "px-4 py-2 rounded w-full text-slate-300 hover:text-white";
    const openNavbar = ref(false);

	// Panggil auth state dari getters menggunakan computed
    const authenticated = computed(() => store.getters['auth/authenticated'])
    const user = computed(() => store.getters['auth/user'])

    // fungsi logout dengan trigger dispatch ke store/auth
    const logout = async () => {
        store.dispatch("auth/logout");
    }

    return {
      className, openNavbar, authenticated, user, logout
    }
  }
}
</script>