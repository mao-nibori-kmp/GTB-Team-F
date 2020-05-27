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
import GenreButton from '../components/genre_button.vue'

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
        "genre-button-c": GenreButton
    },
    data: {
      toggle: true,
      user: {
        age: "10",
        sex: "0",
        genres: [
          {id:100371, name:"レディースファッション", flag:false},
          {id:551177, name:"メンズファッション", flag:false},
          {id:100433, name:"インナー・下着・ナイトウェア", flag:false},
          {id:216131, name:"バッグ・小物・ブランド雑貨", flag:false},
          {id:558885, name:"靴", flag:false},
          {id:558929, name:"腕時計", flag:false},
          {id:216129, name:"ジュエリー・アクセサリー", flag:false},
          {id:100533, name:"キッズ・ベビー・マタニティ", flag:false},
          {id:566382, name:"おもちゃ", flag:false},
          {id:101070, name:"スポーツ・アウトドア", flag:false},
          {id:562637, name:"家電", flag:false},
          {id:211742, name:"TV・オーディオ・カメラ", flag:false},
          {id:100026, name:"パソコン・周辺機器", flag:false},
          {id:564500, name:"スマートフォン・タブレット", flag:false},
          {id:565004, name:"光回線・モバイル通信", flag:false},
          {id:100227, name:"食品", flag:false},
          {id:551167, name:"スイーツ・お菓子", flag:false},
          {id:100316, name:"水・ソフトドリンク", flag:false},
          {id:510915, name:"ビール・洋酒", flag:false},
          {id:510901, name:"日本酒・焼酎", flag:false},
          {id:100804, name:"インテリア・家具・収納", flag:false},
          {id:215783, name:"日用品雑貨・文房具・手芸", flag:false},
          {id:558944, name:"キッチン用品・食器・調理器具", flag:false},
          {id:200162, name:"本・雑誌・コミック", flag:false},
          {id:101240, name:"CD・DVD", flag:false},
          {id:101205, name:"テレビゲーム", flag:false},
          {id:101164, name:"ホビー", flag:false},
          {id:112493, name:"楽器・音響機器", flag:false},
          {id:101114, name:"車・バイク", flag:false},
          {id:503190, name:"車用品・バイク用品", flag:false},
          {id:100939, name:"美容・コスメ・香水", flag:false},
          {id:100938, name:"ダイエット・健康", flag:false},
          {id:551169, name:"医薬品・コンタクト・介護", flag:false},
          {id:101213, name:"ベット・ベットグッズ", flag:false},
          {id:100005, name:"花・ガーデン・DIY", flag:false},
          {id:101438, name:"サービス・リフォーム", flag:false},
          {id:111427, name:"住宅・不動産", flag:false},
          {id:101381, name:"カタログギフト・チケット", flag:false},
          {id:100000, name:"百貨店・総合通販・ギフト", flag:false},
        ]
      },
      slide: "0"
    },
    computed: {
      genreText: function () {
        return JSON.stringify(this.user.genres)
      }
    }
  })
})