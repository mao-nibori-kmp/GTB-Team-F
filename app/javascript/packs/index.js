import Vue from 'vue'

// 作成したコンポーネントファイルをimportします
import TestConponent from '../components/test.vue'
import Concierge from '../components/concierge.vue'
import CheckButton from '../components/checkbutton.vue'
import Header from '../components/header.vue'
import HeaderTop from '../components/header_top.vue'
import HeaderBottom from '../components/header_bottom.vue'
import MainPage from '../components/main_page.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    components: { 
        "test-component": TestConponent,
        "concierge-c": Concierge,
        "checkbutton-c": CheckButton,
        "header-c": Header,
        "header-top-c": HeaderTop,
        "header-buttom-c": HeaderBottom,
        "main-page-c": MainPage
    },
    data: {
      toggle: true,
    }
  })
})