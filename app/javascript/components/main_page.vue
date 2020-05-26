<template>
    <div class="tmp">
        <transition name="slide-left">
            <div class="toggle_area money_area" v-if="toggle">
                <div class="navigate">
                    <concierge-c>
                        <p>入出金</p>
                    </concierge-c>
                </div>
                <div class="border blue"></div>
                <div class="main"></div>
            </div>
        </transition>
        <transition name="slide-right">
            <div class="toggle_area product_area" v-if="!toggle">
                <div class="navigate">
                    <concierge-c>
                        <p>おすすめ商品！!！</p>
                    </concierge-c>
                </div>
                <div class="border yellow"></div>
                <div class="main"></div>
            </div>
        </transition>
    </div>
</template>

<script>
import Concierge from '../components/concierge.vue'

export default {
    props: {
        toggle: Boolean
    },
    components: { 
        "concierge-c": Concierge,
    },
    data: function () {
    return {
    }
  }
}
</script>

<style lang="scss" scoped>
.tmp {
    width: 100%;
    position: relative;
    .toggle_area {
        width: 100%;
        position: absolute;
        top: 0;
        left: 0;
        .navigate {
            width: 100%;
            height: 145px;
            background-color: #f5f5f5;
            display: flex;
            align-items: center;
        }
        .border {
            width: 100%;
            height: 2px;
        }
        .blue {
            background-color: #3c8baa;
        }
        .yellow {
            background-color: #f2d33b;;
        }
        .main {
            width: 100%;
            height: 500px;
            background-color: #fff;
        }
    }
    
    .slide-left-enter-active, .slide-left-leave-active {
    transition: transform .2s;
    }
    .slide-left-enter, .slide-left-leave-to /* .fade-leave-active below version 2.1.8 */ {
        transform: translateY(0px) translateX(-100%);
    }
    .slide-right-enter-active, .slide-right-leave-active {
    transition: transform .2s;
    }
    .slide-right-enter, .slide-right-leave-to /* .fade-leave-active below version 2.1.8 */ {
        transform: translateY(0px) translateX(100%);
    }
}
</style>
