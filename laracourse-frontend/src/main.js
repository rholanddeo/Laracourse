import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";
import router from "./router";

import axios from "axios";

axios.interceptors.request.use(config => {
  config.baseURL = "http://localhost:8000";
  config.withCredentials = true;

  return config;
});

import store from "./store";
store.dispatch("auth/me").then(() => {
  createApp(App).use(router).mount("#app");
});
