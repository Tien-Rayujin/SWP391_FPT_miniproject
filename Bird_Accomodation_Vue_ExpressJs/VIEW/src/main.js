import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./components/store";
import Antd from "ant-design-vue";
import "ant-design-vue/dist/antd.css";


const app = createApp(App);

app.use(router);

app.use(store);

app.use(Antd);

router.isReady().then(() => {
    app.mount("#app");
})
