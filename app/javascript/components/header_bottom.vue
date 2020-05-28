<template>
    <div class="toggles">
        <div class="toggle_area">
            <div class="toggle_button" v-on:click="$emit('toggle_zero')" v-bind:class="[toggle === true ? 'toggled_zero' : '']">
                <div class="toggle_text">入出金</div>
            </div>
            <div class="toggle_button" v-on:click="$emit('toggle_one')" v-bind:class="[toggle === false ? 'toggled_one' : '']">
                <div class="toggle_text">おすすめ商品</div>
            </div>
        </div>
        <div class="toggle_bar">
            <div class="actived_bar" v-bind:class="[toggle === true ? 'actived_zero' : 'actived_one']"></div>
        </div>
    </div>
</template>

<script>
export default {
  props: ['toggle']
}
</script>

<style lang="scss" scoped>
.toggles {
    width: 100%;
    .toggle_area {
        width: 100%;
        height: 40px;
        display: flex;
        .toggle_button {
            width: 50%;
            height: 100%;
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ccc;
            font-size: 1.4rem;
            transition: 0.2s;
        }
        .toggled_zero {
            color: #295e73;
            background-color: #eaf1f3;
        }
        .toggled_one {
            color: #c2a200;
            background-color: #fbf5e7;
        }
    }
    .toggle_bar {
        width: 100%;
        height: 5px;
        background-color: #e1e2e1;
        position: relative;
        .actived_bar {
            width: 50%;
            height: 100%;
            position: absolute; 
            top: 0;
            transition: 0.4s;
        }
        .actived_zero {
            left: 0;
            background-color: #3c8baa;
        }
        .actived_one {
            left: 50%;
            background-color: #f2d33b;
        }
    }
}
</style>
