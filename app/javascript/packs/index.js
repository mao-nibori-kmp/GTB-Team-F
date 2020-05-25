import Vue from 'vue'

// 作成したコンポーネントファイルをimportします
import TestConponent from '../components/test.vue'
import Concierge from '../components/concierge.vue'
import CheckButton from '../components/checkbutton.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    components: { 
        "test-component": TestConponent,
        "concierge-c": Concierge,
        "checkbutton-c": CheckButton
    }
  })
})