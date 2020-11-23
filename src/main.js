import 'primevue/resources/primevue.min.css';
import 'primeicons/primeicons.css';
import 'primevue/resources/themes/saga-blue/theme.css';
import 'primeflex/primeflex.css';
import Button from 'primevue/button';
import createServer from '@/mirage/server';
import Vue from 'vue';
import App from './App.vue';
import './registerServiceWorker';
import router from './router';

Vue.config.productionTip = false;

Vue.component('Button', Button);

createServer();

new Vue({
  router,
  render: (h) => h(App),
}).$mount('#app');
