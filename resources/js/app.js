/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;
import common from './common'
Vue.mixin(common)
Vue.component('search', require('./components/search.vue').default);
Vue.component('comment', require('./components/comment.vue').default);

const app = new Vue({
    el: '#app',
});
