<template>
    <div class="container pt-20 pb-10">
        <div class="grid gap-8 grid-cols-12">
            <div class="lg:col-start-1 lg:col-end-9 col-span-12 order-2 lg:order-1">
                <!-- Section: Show materi -->
                <div class="border rounded-lg bg-white overflow-hidden mb-7">
                    <div class="border-b p-4">
                        <p class="text-lg font-semibold">Data materi:</p>
                    </div>
                    <div class="p-4">
                        <form @submit.prevent="getMateris">
                            <div class="grid lg:grid-cols-12 gap-3 lg:gap-4">
                                <div class="lg:col-span-auto">
                                    <select v-model="filter.ordering"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                        <option value="10">10</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                </div>
                                <div class="lg:col-span-3">
                                    <select v-model="filter.course"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                        <option value="">All Course</option>
                                        <template v-for="course in state.courses" :key="course.id">
                                            <option :value="course.slug">{{ course.name }}</option>
                                        </template>
                                    </select>
                                </div>
                                <div class="lg:col-end-13 lg:col-span-4">
                                    <div class="relative">
                                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                            <svg aria-hidden="true" class="w-4 h-4 text-gray-500" fill="none"
                                                stroke="currentColor" viewBox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                            </svg>
                                        </div>
                                        <input v-model="filter.search"
                                            class="block w-full p-2.5 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                            placeholder="Search Materi..." required>
                                    </div>
                                </div>
                            </div>
                        </form>
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
                                        Courses
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
                                    <td class="px-6 py-4">
                                        {{ materi.subject }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ materi.content }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ materi.link }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ materi.course.name }}
                                    </td>
                                    <td class="px-6 py-4 flex gap-3">
                                        <router-link :to="`/materi/${materi.id}/edit`"
                                            class="font-medium text-green-600 hover:underline">
                                            Edit
                                        </router-link>
                                        <a href="#!" @click.prevent="deleteMateri(materi.id)"
                                            class="font-medium text-red-600 hover:underline">Delete</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="lg:flex grid gap-5 lg:gap-0 justify-center lg:justify-between lg:items-center text-center">
                    <div class="text-sm text-gray-700">
                        Showing <span class="font-semibold">{{ state.materis.current_page }}</span> to <span
                            class="font-semibold">{{ state.materis.per_page }}</span> of <span class="font-semibold">{{
                                state.materis.total }}</span> Entries
                    </div>

                    <nav aria-label="Page navigation example">
                        <ul class="inline-flex -space-x-px text-sm gap-2">
                            <template v-for="link in state.materis.links" :key="link.label">
                                <li>
                                    <a href="#" @click="pagination(link.url)"
                                        class="px-3 py-2 ml-0 leading-tight border rounded-lg"
                                        :class="link.active ? 'bg-blue-600 border-blue-600 text-white' : 'text-gray-500 bg-white hover:bg-gray-100 hover:text-gray-700'">
                                        {{ link.label }}
                                    </a>
                                </li>
                            </template>
                        </ul>
                    </nav>
                </div>

            </div>

            <div class="lg:col-start-9 lg:col-end-13 col-span-12 order-1 lg:order-2">
                <!-- Section: Input materi -->
                <div class="border rounded-lg bg-white">
                    <div class="border-b p-4">
                        <p class="text-lg font-semibold">Form Input Materi:</p>
                    </div>
                    <div class="p-4">
                        <form @submit.prevent="createMateri">
                        
                            <div class="mb-4">
                                <label class="block mb-2 text-sm font-medium text-gray-900">Subject</label>
                                <input type="text" v-model="form.subject"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <p class="mt-2 text-sm text-red-600" v-if="state.errors['subject']">{{ state.errors['subject'][0]
                                }}</p>
                            </div>
                            

                            <div class="mb-4">
                                <label class="block mb-2 text-sm font-medium text-gray-900">Content</label>
                                <textarea v-model="form.content"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                                    rows="4"></textarea>
                                <p class="mt-2 text-sm text-red-600" v-if="state.errors['content']">{{
                                    state.errors['content'][0] }}</p>
                            </div>

                            <div class="mb-4">
                                <label class="block mb-2 text-sm font-medium text-gray-900">Link</label>
                                <input type="url" v-model="form.link"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <p class="mt-2 text-sm text-red-600" v-if="state.errors['link']">{{ state.errors['link'][0]
                                }}</p>
                            </div>
                            
                            <div class="mb-6">
                                <label class="block mb-2 text-sm font-medium text-gray-900">Course</label>
                                <select v-model="form.course_id"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:outline-none focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                    <option value="">-Choose a course-</option>
                                    <template v-for="course in state.courses" :key="course.id">
                                        <option :value="course.id">{{ course.name }}</option>
                                    </template>
                                </select>
                                <p class="mt-2 text-sm text-red-600" v-if="state.errors['course_id']">{{
                                    state.errors['course_id'][0] }}</p>
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
import axios from 'axios'
import { onMounted, ref, reactive, watch } from 'vue';

export default {

    setup() {

        // define state
        const state = ref({
            courses: [],
            materis: [],
            errors: [],
        })

        // panggil data courses dari api
        const getCourses = async () => {
            let { data } = await axios.get('/api/kursus')

            // data response dikirim ke state courses
            state.value.courses = data
        }

        // panggil data materis dari api
        const getMateris = async () => {
            let { data } = await axios.get('/api/materis', {
                params: filter
            })

            // data response dikirim ke state materis
            state.value.materis = data

        }

        onMounted(() => {
            // load course
            getCourses()

            // load materi
            getMateris()
        })

        // define variable form untuk menampung value dari setiap inputan
        const form = reactive({ // jangan lupa import reactive pada vue
            subject: "",
            content: "",
            link: "",
            course_id: "",
        })

        // fungsi create materi
        const createMateri = async () => {
            try {
                // panggil api untuk input materi dan sertakan variabel form di dalam nya
                await axios.post('/api/materis', form)

                // Jika proses berhasil maka panggil getMateris() untuk mendapatkan data terbaru
                getMateris()
            } catch (error) {
                // jika gagal, masukan response error pada state errors
                state.value.errors = error.response.data.errors;
            }
        }

        // fungsi delete materi
        const deleteMateri = async (id) => {

            // panggil api untuk input materi dan sertakan variabel id
            await axios.delete(`/api/materis/${id}`)

            // Jika proses berhasil maka panggil getMateris() untuk mendapatkan data terbaru
            getMateris()
        }

        const filter = reactive({
            ordering: 10,
            course: "",
            search: "",
            page: 1,
        })

        watch(filter, () => {
            getMateris()
        })

        // fungsi pagination
        const pagination = async (url) => {

            // kita set default lastChar = 1
            var lastChar = 1;

            // jika parameter url memiliki value
            if (url) {

                // ambil 1 string paling ujung dari value url
                lastChar = url.substr(url.length - 1)
            }

            // set reactive filter property page dengan value dari lastchar
            filter.page = lastChar

            // panggil get materi
            getMateris()
        }

        return {
            state, getCourses, getMateris, createMateri, form, deleteMateri, filter, pagination
        }


    }
}

</script>