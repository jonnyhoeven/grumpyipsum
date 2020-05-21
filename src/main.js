import Vue from 'vue'
import App from './App.vue'

import router from './router'
import store from './store'
import './registerServiceWorker'


import VueAxios from 'vue-axios'
import axios from 'axios'

import moment from "moment";
import VueMomentJS from "vue-momentjs";


axios.defaults.timeout = 5000;
axios.defaults.baseURL = '/rest/';
axios.defaults.method = 'post';

Vue.use(VueAxios, axios);

Vue.use(VueMomentJS, moment);


Vue.config.productionTip = false;
new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app');
