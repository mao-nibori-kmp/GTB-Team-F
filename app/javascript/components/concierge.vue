<template>
    <div class="tmp">
        <div class="concierge">
            <div class="con_img">
                <img v-bind:src="icon" alt="">
            </div>
            <div class="con_text" v-bind:style="{height: height}">
                <div class="req_html">
                    <slot></slot>
                </div>
            </div>
            <div class="triangle"></div>
        </div>
    </div>
</template>

<script>
export default {
  props: ['height', 'icon']
}
</script>

<style lang="scss" scoped>
.tmp {
    width: 100%;
    display: flex;
    justify-content: center;
    .concierge {
        width: calc(100% - 40px);
        max-width: 600px;
        display: flex;
        position: relative;
        .con_img {
            width: 45px;
            height: 45px;
            border-radius: 50px;
            background-color: #fff;
            overflow: hidden;
            img {
                width: 100%;
                height: 100%;
            }
        }
        .con_text {
            margin-left: 20px;
            padding: 0 10px 0 10px;
            width: calc(100% - 90px);
            min-height: 45px;
            background-color: #fff;
            display: flex;
            align-items: center;
            font-size: 1.4rem;
        }
        .triangle {
            border-top: 5px solid transparent;
            border-right: 10px solid #fff;
            border-bottom: 5px solid transparent;
            position: absolute;
            top: 15px;
            left: 55px;
        }
    }
}
</style>


