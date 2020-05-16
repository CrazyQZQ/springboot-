// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import * as api from './utils/api';

import {initMenu} from "./utils/menus";
import 'font-awesome/css/font-awesome.min.css';

Vue.config.productionTip = false
Vue.use(ElementUI);

Vue.prototype.api = api

router.beforeEach((to, from, next) => {
  if (to.path == '/') {
      next();
  }else {
      if (window.sessionStorage.getItem("user")) {
          initMenu(router, store);
          next();
      }else{
          next('/?redirect='+to.path);
      }
  }
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
