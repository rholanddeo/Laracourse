<template>
  <div class="container pb-10 pt-20">
    <div class="mb-4">
      <router-link to="/user" class="text-blue-500 underline"
        >Kembali</router-link
      >
    </div>

    <div class="grid gap-5 grid-cols-12">
      <!-- <div class="lg:col-start-1 lg:col-end-5 col-span-12 mb-4"> -->

      <div class="lg:col-start-1 lg:col-end-9 col-span-12 order-2 lg:order-1">
        <div class="border rounded-lg bg-white">
          <div class="border-b p-4">
            <p class="text-lg font-semibold">User Data</p>
          </div>
          <div class="p-4">
            <form @submit.prevent="updateUser">
              <div class="mb-4">
                <label class="block mb-2 text-sm font-medium text-gray-900"
                  >Nama</label
                >
                <input
                  type="text"
                  v-model="form.name"
                  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                />
                <p
                  class="mt-2 text-sm text-red-600"
                  v-if="state.errors['name']"
                >
                  {{ state.errors["name"][0] }}
                </p>
              </div>
              <div class="mb-4">
                <label class="block mb-2 text-sm font-medium text-gray-900"
                  >Email</label
                >
                <input
                  type="text"
                  v-model="form.email"
                  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                />
                <p
                  class="mt-2 text-sm text-red-600"
                  v-if="state.errors['email']"
                >
                  {{ state.errors["email"][0] }}
                </p>
              </div>
              <div class="flex justify-end">
                <button
                  type="submit"
                  class="text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2"
                >
                  Save
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <div class="lg:col-start-9 lg:col-end-13 col-span-12 order-1 lg:order-2">
        <div class="border rounded-lg bg-white">
          <div class="border-b p-4">
            <p class="text-lg font-semibold">Edit Password</p>
          </div>
          <div class="p-4">
            <form @submit.prevent="updatePassword">
              <div class="mb-4">
                <label class="block mb-2 text-sm font-medium text-gray-900"
                  >New Password</label
                >
                <input
                  type="text"
                  v-model="form.password"
                  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                />
                <p
                  class="mt-2 text-sm text-red-600"
                  v-if="state.errors['password']"
                >
                  {{ state.errors["code"][0] }}
                </p>
              </div>
              <div class="mb-4">
                <label class="block mb-2 text-sm font-medium text-gray-900"
                  >Password Confirmation</label
                >
                <input
                  type="text"
                  v-model="form.password_confirmation"
                  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                />
                <p
                  class="mt-2 text-sm text-red-600"
                  v-if="state.errors['password_confirmation']"
                >
                  {{ state.errors["name"][0] }}
                </p>
              </div>
              <button
                type="submit"
                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 w-full"
              >
                Save
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { ref, onMounted, reactive } from "vue";
import { useRoute } from "vue-router";
import { useToast } from "vue-toastification";

export default {
  setup() {
    // define route dari useRoute
    const route = useRoute();
    const toast = useToast();

    // define state
    const state = ref({
      user: [],
      errors: [],
    });

    // define variable form untuk menampung value dari setiap inputan
    const form = reactive({
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
    });

    // get id dari parameter melalui useRoute
    let id = route.params.id;

    // get data user berdasarkan id
    const getUser = async () => {
      let { data } = await axios.get(`/api/users/${id}`);

      // masukan setiap value user ke dalam form input
      form.name = data.name;
      form.email = data.email;
      form.password = data.password;
      form.password_confirmation = data.password;
    };

    // fungsi update user
    const updateUser = async () => {
      try {
        await axios.put(`/api/users/${id}`, form);
        getUser();
        // router.push('/user')
        toast.success("User Updated Succesfully");
      } catch (error) {
        state.value.errors = error.response.data.errors;
        toast.error("User Updated Failed");
      }
    };

    // fungsi update user
    const updatePassword = async () => {
      try {
        await axios.put(`/api/user/password/${id}`, form);
        getUser();
        // router.push('/user')
        toast.success("Password Updated Succesfully");
      } catch (error) {
        state.value.errors = error.response.data.errors;
        toast.error("Password Updated Failed");
      }
    };

    onMounted(() => {
      getUser();
    });

    return {
      state,
      getUser,
      updateUser,
      updatePassword,
      form,
    };
  },
};
</script>
