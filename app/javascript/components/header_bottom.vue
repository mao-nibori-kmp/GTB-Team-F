<template>
    <div class="toggle_area">
        <div class="toggle_button toggle_a toggled" v-on:click="$emit('toggle')">
            <div class="toggle_text">{{ toggle }}</div>
        </div>
        <div class="toggle_button toggle_b">
            <div class="toggle_text">おすすめ商品</div>
        </div>
    </div>
</template>

<script>
export default {
  props: ['toggle']
}
</script>

<style lang="scss" scoped>
.toggle_area {
    width: 100%;
    height: 50px;
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
    }
    .toggled {
        color: #000;
    }
}
</style>
