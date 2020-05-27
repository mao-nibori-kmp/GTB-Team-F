<template>
    <div class="button" v-on:click="$emit('toggle')" v-bind:class="[flag === true ? 'selected' : '']">
        <slot></slot>
    </div>
</template>

<script>
export default {
  props: ['flag']
}
</script>

<style lang="scss" scoped>
.button {
    height: 32px;
    width: 100%;
    text-align: center;
    line-height: 32px;
    background-color: #acacac;
    color: #fff;
    font-size: 1.4rem;
    border-radius: 5px;
    margin-top: 15px;
}
.selected {
    background-color: #666666;
}
</style>
