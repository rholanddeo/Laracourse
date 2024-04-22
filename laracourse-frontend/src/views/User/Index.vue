<template>
  <div class="container pt-20 pb-10">
    <div class="grid gap-8 grid-cols-12">
      <div class="lg:col-start-1 lg:col-end-9 col-span-12 order-2 lg:order-1">
        <!-- Section: Show User -->
        <div class="border rounded-lg bg-white overflow-hidden mb-7">
          <div class="border-b p-4">
            <p class="text-lg font-semibold">Data User:</p>
          </div>
          <div class="p-4">
            <form @submit.prevent="getUsers">
              <div class="grid lg:grid-cols-12 gap-3 lg:gap-4">
                <div class="lg:col-span-auto">
                  <select
                    v-model="filter.ordering"
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                  >
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                  </select>
                </div>
                <div class="lg:col-end-13 lg:col-span-4">
                  <div class="relative">
                    <div
                      class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none"
                    >
                      <svg
                        aria-hidden="true"
                        class="w-4 h-4 text-gray-500"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                        ></path>
                      </svg>
                    </div>
                    <input
                      v-model="filter.search"
                      class="block w-full p-2.5 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                      placeholder="Search User..."
                      required
                    />
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="relative overflow-x-auto">
            <table class="w-full text-sm text-left text-gray-700">
              <thead
                class="text-xs text-gray-700 uppercase bg-gray-50 border-b border-t"
              >
                <tr>
                  <th scope="col" class="px-6 py-3 w-2">No</th>
                  <th scope="col" class="px-6 py-3">Name</th>
                  <th scope="col" class="px-6 py-3">Email</th>
                  <th scope="col" class="px-6 py-3">Action</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  class="bg-white border-t"
                  v-for="(user, index) in state.users.data"
                  :key="user.id"
                >
                  <td class="px-6 py-4">{{ index + 1 }}.</td>
                  <td class="px-6 py-4">
                    {{ user.name }}
                  </td>
                  <td class="px-6 py-4">
                    {{ user.email }}
                  </td>
                  <td class="px-6 py-4 flex gap-3">
                    <router-link
                      :to="`/user/${user.id}/edit`"
                      class="font-medium text-green-600 hover:underline"
                      >Edit</router-link
                    >
                    <a
                      href="#!"
                      @click.prevent="deleteUser(user.id)"
                      class="font-medium text-red-600 hover:underline"
                      >Delete</a
                    >
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <div
          class="lg:flex grid gap-5 lg:gap-0 justify-center lg:justify-between lg:items-center text-center"
        >
          <div class="text-sm text-gray-700">
            Showing
            <span class="font-semibold">{{ state.users.current_page }}</span> to
            <span class="font-semibold">{{ state.users.per_page }}</span> of
            <span class="font-semibold">{{ state.users.total }}</span> Entries
          </div>

          <nav aria-label="">
            <ul class="inline-flex -space-x-px text-sm gap-2">
              <template v-for="link in state.users.links" :key="link.label">
                <li>
                  <a
                    href="javascript:;"
                    @click="pagination(link.url)"
                    class="px-3 py-2 ml-0 leading-tight border rounded-lg"
                    :class="
                      link.active
                        ? 'bg-blue-600 border-blue-600 text-white'
                        : 'text-gray-500 bg-white hover:bg-gray-100 hover:text-gray-700'
                    "
                  >
                    {{ link.label }}
                  </a>
                </li>
              </template>
            </ul>
          </nav>
        </div>
      </div>

      <div class="lg:col-start-9 lg:col-end-13 col-span-12 order-1 lg:order-2">
        <!-- Section: Input user -->
        <div class="border rounded-lg bg-white">
          <div class="border-b p-4">
            <p class="text-lg font-semibold">Form Input User:</p>
          </div>
          <div class="p-4">
            <form @submit.prevent="createUser">
              <div class="mb-4">
                <label class="block mb-2 text-sm font-medium text-gray-900"
                  >User Name</label
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
                  type="email"
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
              <div class="mb-4">
                <label class="block mb-2 text-sm font-medium text-gray-900"
                  >Password</label
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
                  {{ state.errors["password"][0] }}
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
                  {{ state.errors["password_confirmation"][0] }}
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
import { onMounted, ref, reactive, watch } from "vue";
import { useToast } from "vue-toastification";

export default {
  setup() {
    // define state
    const state = ref({
      users: [],
      errors: [],
      toastMessage: "",
    });
    const toast = useToast();

    // panggil data users dari api
    const getUsers = async () => {
      let { data } = await axios.get("/api/users", {
        params: filter,
      });

      // data response dikirim ke state users
      state.value.users = data;
    };

    onMounted(() => {
      // load user
      getUsers();
    });

    // define variable form untuk menampung value dari setiap inputan
    const form = reactive({
      // jangan lupa import reactive pada vue
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
    });

    // fungsi create user
    const createUser = async () => {
      try {
        // panggil api untuk input user dan sertakan variabel form di dalam nya
        await axios.post("/api/users", form);

        // Jika proses berhasil maka panggil getUsers() untuk mendapatkan data terbaru
        getUsers();
        // Use it!
        toast.success("User Added Succesfully");
      } catch (error) {
        // jika gagal, masukan response error pada state errors
        state.value.errors = error.response.data.errors;
        toast.error("User Added Failed");
      }
    };

    // fungsi delete user
    const deleteUser = async (id) => {
      // panggil api untuk input user dan sertakan variabel id
      await axios.delete(`/api/users/${id}`);

      // Jika proses berhasil maka panggil getUsers() untuk mendapatkan data terbaru
      getUsers();
      toast.success("User Deleted Succesfully");
    };

    const filter = reactive({
      ordering: 5,
      category: "",
      search: "",
      page: 1,
    });

    watch(filter, () => {
      getUsers();
    });

    // fungsi pagination
    const pagination = async (url) => {
      // kita set default lastChar = 1
      var lastChar = 1;

      // jika parameter url memiliki value
      if (url) {
        // ambil 1 string paling ujung dari value url
        lastChar = url.substr(url.length - 1);
      }

      // set reactive filter property page dengan value dari lastchar
      filter.page = lastChar;

      // panggil get user
      getUsers();
    };

    return {
      state,
      getUsers,
      createUser,
      form,
      deleteUser,
      filter,
      pagination,
    };
  },
};
</script>
