<template>
    <div class="button" v-on:click="$emit('set')" v-bind:class="[userdata === data ? 'selected' : '']">
        <slot></slot>
    </div>
</template>

<script>
export default {
  props: ['userdata', 'data']
}
</script>

<style lang="scss" scoped>
.button {
    height: 32px;
    width: 70px;
    text-align: center;
    line-height: 32px;
    background-color: #acacac;
    color: #fff;
    font-size: 1.4rem;
    border-radius: 5px;
    margin: 5px;
}
.selected {
    background-color: #666666;
}
</style>
