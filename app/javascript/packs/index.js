import Vue from 'vue'

// 作成したコンポーネントファイルをimportします
import TestConponent from '../components/test.vue'
import Concierge from '../components/concierge.vue'
import CheckButton from '../components/checkbutton.vue'
import Header from '../components/header.vue'
import HeaderTop from '../components/header_top.vue'
import HeaderBottom from '../components/header_bottom.vue'
import MainPage from '../components/main_page.vue'
import UserButton from '../components/user_button.vue'
import UserSetting from '../components/user_setting.vue'
import FormButton from '../components/form_button.vue'

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
        "main-page-c": MainPage,
        "user-button-c": UserButton,
        "user-setting-c": UserSetting,
        "form-button-c": FormButton,
    },
    data: {
      toggle: true,
      user: {
        age: "10",
        sex: "0",
        array: [
          {id:0, text:"aaa"},
          {id:2, text:"bbb"}
        ]
      }
    },
    computed: {
      genreText: function () {
        return JSON.stringify(this.user.array)
      }
    }
  })
})