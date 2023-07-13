<template>
  <div class="container py-12">
    <div class="w-full lg:w-1/3 mx-auto pt-10">
      <div class="border rounded-lg bg-white">
        <div class="py-4 px-4 font-semibold border-b border-gray-200">
          Register
        </div>
        <div class="p-4">
          <form @submit.prevent="register">
            <div class="mb-5">
              <label for="name" class="text-xs uppercase font-medium mb-2">
                Name
              </label>
              <input type="text" v-model="form.name" class="w-full border rounded-lg focus:outline-none focus:ring focus:border-blue-400 h-10 px-4 transition duration-150">
              <div class="text-red-500 mt-2 text-sm" v-if="errors['name']">{{ errors['name'][0] }}</div>
            </div>
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

            <div class="mb-5">
              <label for="password_confirmation" class="text-xs uppercase font-medium mb-2">
                Password Confirmation
              </label>
              <input type="password" v-model="form.password_confirmation" class="w-full border rounded-lg focus:outline-none focus:ring focus:border-blue-400 h-10 px-4 transition duration-150">
            </div>

            <button class="py-2 px-3 bg-blue-600 rounded-lg w-full text-center text-white focus:outline-none">Register</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
  
<script>
import axios from 'axios'
import { reactive, ref } from 'vue'
import router from "@/router"
import store from "@/store"

export default {
  setup () {
    // errors untuk menampung data object error validation dari backend
    const errors = ref([])

    // variable form berguna menampung data inputan dari setiap form
    const form = reactive({
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
    })
    
    // melakukan register dengan cara trigger dispatch ke actions yang ada pada store/auth.js
    const register = async () => {
      try {
        await axios.post('register', form)

        // trigger dispatch auth/me pada actions store/auth.js
        await store.dispatch("auth/me")

        // jika login berhasil redirect ke home atau "/"
        router.replace("/")
      } catch (error) {
        // jika login gagal, maka input response error ke variable errors
        errors.value = error.response.data.errors
      }
      
    }

    return { form, register, errors }
  }
}
</script>  