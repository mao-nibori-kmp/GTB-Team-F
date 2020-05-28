<template>
    <div class="button" v-on:click="$emit('slide')" v-bind:style="{width: width,height: height}">
        <slot></slot>
    </div>
</template>

<script>
export default {
  props: ['width', 'height']
}
</script>

<style lang="scss" scoped>
.button {
    text-align: center;
    height: 32px;
    width: 120px;
    line-height: 32px;
    background-color: #3c8baa;
    color: #fff;
    font-size: 1.4rem;
    border-radius: 5px;
    margin: 0 10px;
}

.selected {
    background-color: #666666;
}
</style>
