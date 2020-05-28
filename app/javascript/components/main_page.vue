<template>
    <div class="tmp">
        <transition name="slide-left">
            <div class="toggle_area money_area" v-if="toggle">
                <div class="navigate">
                    <concierge-c height="90px" icon="/assets/レコ美_アイコン_入出金.png" type="center">
                        <p>只今の銀行残高は<br><span>円<span>です！</p>
                    </concierge-c>
                </div>
                <div class="border blue"></div>
                <div class="main">
                    <div class="log_title">過去３ヶ月の履歴</div>
                    <template v-for="hash in hashs">
                        <div class="log" v-bind:key="hash.amount">
                            <div class="texts">
                                <div class="date text">{{ hash.valueDate }}</div>
                                <div class="t-type text" v-bind:class="[hash.transactionType === '出金' ? 'red' : '']">{{ hash.transactionType}}</div>
                                <div class="amount text">
                                    <div class="num">{{ hash.amount }}</div>
                                    <div class="yen">円</div>
                                </div>
                            </div>
                        </div>
                    </template>
                </div>
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
                <div class="main">
                    
                </div>
            </div>
        </transition>
    </div>
</template>

<script>
import Concierge from '../components/concierge.vue'
import DepoHistory from '../components/depo_history.vue'

export default {
    props: ['toggle', 'hashs'],
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
            .log_title {
                width: calc(100% - 30px);
                height: 60px;
                padding-left: 30px;
                background-color: #fff;
                text-align: left;
                line-height: 90px;
                font-size: 1.6rem;
            }
            .log {
                width: 100%;
                height: 60px;
                background-color: #fff;
                display: flex;
                justify-content: center;
                .texts {
                    width: calc(100% - 100px);
                    height: 100%;
                    display: flex;
                    .text {
                        height: 60px;
                        line-height: 60px;
                        font-size: 1.6rem;
                    }
                    .date {
                        width: 25%;
                    }
                    .t-type {
                        width: 25%;
                        text-align: center;
                        color: #138f50;
                    }
                    .red {
                        color: #c00202;
                    }
                    .amount {
                        width: 50%;
                        height: 100%;
                        display: flex;
                        text-align: right;
                        .num {
                            width: calc(100% - 35px);
                            height: 60px;
                            line-height: 60px;
                            font-size: 1.8rem;
                        }
                        .yen {
                            width: 34px;
                            height: 60px;
                            line-height: 60px;
                        }
                    }
                }
                &:nth-child(2n) {
                    background-color: #eaf1f3;
                }
            }
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
