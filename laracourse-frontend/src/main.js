import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";
import router from "./router";
import Toast from "vue-toastification";
// Import the CSS or use your own!
import "vue-toastification/dist/index.css";
import axios from "axios";

axios.interceptors.request.use(config => {
  config.baseURL = "http://localhost:8000";
  config.withCredentials = true;

  return config;
});

import store from "./store";
store.dispatch("auth/me").then(() => {
  createApp(App).use(router).use(Toast).mount("#app");
});
