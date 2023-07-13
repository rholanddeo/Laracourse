<template>
    
    <div class="container pb-10  pt-20">
        <div class="mb-4">
            <router-link to="/course" class="text-blue-500 underline">Kembali</router-link>
          </div>

          
          
          <div class="border rounded-lg bg-white mb-5">
            <div class="border-b p-4">
              <p class="text-lg font-semibold">Course Materi</p>
            </div>
            <div class="relative overflow-x-auto">
                        <table class="w-full text-sm text-left text-gray-700">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50 border-b border-t">
                                <tr>
                                    <th scope="col" class="px-6 py-3 w-2">
                                        No
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Subject
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Content
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Link
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="bg-white border-t" v-for="(materi, index) in state.materis.data"
                                    :key="materi.id">
                                    <td class="px-6 py-4">
                                        {{ index + 1 }}.
                                    </td>
                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                                        {{ materi.subject }}
                                    </th>
                                    <td class="px-6 py-4">
                                        {{ materi.content }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ materi.link }}
                                    </td>
                                    <td class="px-6 py-4 flex gap-3">
                                        <!-- <router-link :to="`/materi/${materi.id}/edit`"
                                            class="font-medium text-green-600 hover:underline">Edit</router-link> -->
                                        <a href="#!" @click.prevent="deleteMateri(materi.id)"
                                            class="font-medium text-red-600 hover:underline">Delete</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
          </div>
            
      <div class="grid gap-5 grid-cols-12">
        <!-- <div class="lg:col-start-1 lg:col-end-5 col-span-12 mb-4"> -->
            
            <div class="lg:col-start-1 lg:col-end-9 col-span-12 order-2 lg:order-1">
          
          <div class="border rounded-lg bg-white">

            <div class="border-b p-4">
              <p class="text-lg font-semibold">Add Materi</p>
            </div>
            <div class="p-4">
              <form @submit.prevent="createMateri">
                
                <div class="mb-4">
                  <label class="block mb-2 text-sm font-medium text-gray-900">Subject</label>
                  <input type="text" v-model="form.subject" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                  <p class="mt-2 text-sm text-red-600" v-if="state.errors['subject']">{{ state.errors['subject'][0] }}</p>
                </div>
                
                <div class="mb-4">
                  <label class="block mb-2 text-sm font-medium text-gray-900">Content</label>
                  <textarea v-model="form.content" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" rows="4"></textarea>
                    <p class="mt-2 text-sm text-red-600" v-if="state.errors['content']">{{ state.errors['content'][0] }}</p>
                </div>

                <div class="mb-4">
                  <label class="block mb-2 text-sm font-medium text-gray-900">Link</label>
                  <input type="url" v-model="form.link" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                  <p class="mt-2 text-sm text-red-600" v-if="state.errors['link']">{{ state.errors['link'][0] }}</p>
                </div>
  
                
                <div class="flex justify-end">
                <button type="submit" class="text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2">Input</button>
                </div>
              </form>
            </div>
          </div>
        </div>

        <div class="lg:col-start-9 lg:col-end-13 col-span-12 order-1 lg:order-2">
                <!-- Section: Input course -->
                <div class="border rounded-lg bg-white">
                    <div class="border-b p-4">
                        <p class="text-lg font-semibold">Course Data</p>
                    </div>
                    <div class="p-4">
                        <form @submit.prevent="updateCourse">
                            <div class="mb-4">
                                <label class="block mb-2 text-sm font-medium text-gray-900">Code</label>
                                <input type="text" v-model="form.code"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <p class="mt-2 text-sm text-red-600" v-if="state.errors['code']">{{ state.errors['code'][0]
                                }}</p>
                            </div>
                            <div class="mb-4">
                                <label class="block mb-2 text-sm font-medium text-gray-900">Name</label>
                                <input type="text" v-model="form.name"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <p class="mt-2 text-sm text-red-600" v-if="state.errors['name']">{{ state.errors['name'][0]
                                }}</p>
                            </div>
                            <div class="mb-4">
                                <label class="block mb-2 text-sm font-medium text-gray-900">Duration (Hour)</label>
                                <input type="number" v-model="form.duration"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <p class="mt-2 text-sm text-red-600" v-if="state.errors['duration']">{{
                                    state.errors['duration'][0] }}</p>
                            </div>

                            <div class="mb-4">
                                <label class="block mb-2 text-sm font-medium text-gray-900">Description</label>
                                <textarea v-model="form.description"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                                    rows="4"></textarea>
                                <p class="mt-2 text-sm text-red-600" v-if="state.errors['description']">{{
                                    state.errors['description'][0] }}</p>
                            </div>


                            <div class="mb-6">
                                <label class="block mb-2 text-sm font-medium text-gray-900">Category</label>
                                <select v-model="form.category_id"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                    <option value="">-Choose a category-</option>
                                    <template v-for="category in state.categories" :key="category.id">
                                        <option :value="category.id">{{ category.name }}</option>
                                    </template>
                                </select>
                                <p class="mt-2 text-sm text-red-600" v-if="state.errors['category_id']">{{
                                    state.errors['category_id'][0] }}</p>
                            </div>
                            <button type="submit"
                                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 w-full">Save</button>
                        </form>
                    </div>
                </div>
            </div>
            
      </div>
    </div>
  </template>

<script>
import axios from 'axios';
import { ref, onMounted, reactive } from 'vue';
import { useRoute } from 'vue-router';
import router from '../../router';

export default {
  setup () {
    // define route dari useRoute
    const route = useRoute()

    // define state
    const state = ref({
      errors: [],
      categories: [],
      materis:[]
    })

    // define variable form untuk menampung value dari setiap inputan
    const form = reactive({
      code: "",
      name: "",
      duration: "",
      description: "",
      category_id: "",
      subject: "",
      content: "",
      link: "",
      course_id: "",
    })

    // get id dari parameter melalui useRoute
    let id = route.params.id

    // get data course berdasarkan id
    const getCourse = async () => {
      let { data } = await axios.get(`/api/courses/${id}`)

      // masukan setiap value course ke dalam form input
      form.code = data.code
      form.name = data.name
      form.duration = data.duration
      form.description = data.description
      form.category_id = data.category_id
    }

    // get data category
    const getCategories = async () => {
      let { data } = await axios.get('/api/categories')
      state.value.categories = data;
    }

    // fungsi update course
    const updateCourse = async () => {
      try {
        await axios.put(`/api/courses/${id}`, form)
        router.push('/course')
      } catch (error) {
        state.value.errors = error.response.data.errors;
      }
    }

    // panggil data materis dari api
    const getMateris = async () => {
            let { data } = await axios.get('/api/materis')

            // data response dikirim ke state courses
            state.value.materis = data
        }

    // fungsi create course
    const createMateri = async () => {
            try {
                // panggil api untuk input course dan sertakan variabel form di dalam nya
                await axios.post('/api/materis', form)

                // Jika proses berhasil maka panggil getMateris() untuk mendapatkan data terbaru
                getMateris()
            } catch (error) {
                // jika gagal, masukan response error pada state errors
                state.value.errors = error.response.data.errors;
            }
        }

    onMounted(() => {
      getCourse(),
      getCategories(),
      getMateris()
    });

    // fungsi delete course
    const deleteMateri = async (id) => {

        // panggil api untuk input course dan sertakan variabel id
        await axios.delete(`/api/materis/${id}`)

        // Jika proses berhasil maka panggil getCourses() untuk mendapatkan data terbaru
        getMateris()
        }

    return {
      state, getCourse, updateCourse, form, getCategories, getMateris, deleteMateri, createMateri
    }
  }
}
</script>