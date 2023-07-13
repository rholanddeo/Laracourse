<template>
    <div class="container py-12">
      <div class="w-full lg:w-1/3 mx-auto pt-10">
        <div class="border rounded-lg bg-white">
          <div class="text-center py-4 px-4 font-semibold border-b border-gray-200">
            Login 
          </div>
          <div class="p-4">
            <form @submit.prevent="login">
              <div class="mb-5">
                <label for="email" class="text-xs uppercase font-medium mb-2">
                  Email
                </label>
                <input type="email" v-model="form.email" class="w-full border rounded-lg focus:outline-none focus:ring focus:border-blue-400 h-10 px-4 transition duration-150">
                <div class="text-red-500 mt-2 text-sm" v-if="errors['email']">{{ errors['email'][0] }}</div>
              </div>
              <div class="mb-5">
                <label for="password" class="text-xs uppercase font-medium mb-2">
                  Password
                </label>
                <input type="password" v-model="form.password" class="w-full border rounded-lg focus:outline-none focus:ring focus:border-blue-400 h-10 px-4 transition duration-150">
                <div class="text-red-500 mt-2 text-sm" v-if="errors['password']">{{ errors['password'][0] }}</div>
              </div>
  
              <button class="py-2 px-3 bg-blue-600 rounded-lg w-full text-center text-white focus:outline-none">Login</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
import store from '@/store'
import router from '@/router'
import { reactive, ref } from 'vue'

export default {
  setup() {

    // errors untuk menampung data object error validation dari backend
    const errors = ref([])

    // variable form berguna menampung data inputan dari form email dan password
    const form = reactive({
      'email' : '',
      'password' : ''
    })

    // melakukan login dengan cara trigger dispatch ke actions yang ada pada store/auth.js
    const login = async () => {
      try {
        await store.dispatch("auth/login", form)

        // jika login berhasil redirect ke home atau "/"
        router.replace("/")
      } catch (e) {
        // jika login gagal, maka input response error ke variable errors
        errors.value = e.response.data.errors;
      }
    }

    return { login, form, errors }
  }
}
</script>