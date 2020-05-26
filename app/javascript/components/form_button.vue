<template>
    <div class="button_area">
        <div class="button" v-on:click="$emit('set')" v-bind:style="{width: width,height: height}">
            <slot></slot>
        </div>
    </div> 
</template>

<script>
export default {
  props: ['width', 'height']
}
</script>

<style lang="scss" scoped>
.button_area {
    width: 100vw;
    display: flex;
    justify-content: center;
    .button {
        text-align: center;
        line-height: 32px;
        background-color: #3c8baa;
        color: #fff;
        font-size: 1.4rem;
        border-radius: 5px;
    }
}

.selected {
    background-color: #666666;
}
</style>
