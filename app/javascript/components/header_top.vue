<template>
    <div class="header">
        <div class="navbar">
            <div class="logo">
                <img src="/assets/レコンシェルジュロゴ白.png" alt="">
            </div>
            <div class="setting">
                <img src="/assets/歯車.gif" alt="" v-on:click="$emit('toggle')">
            </div>
        </div>
    </div> 
</template>

<script>
export default {
}
</script>

<style lang="scss" scoped>
.header{
    background-color:#666666 ;
}
.navbar {
    width: calc(100% - 30px);
    height: 60px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items:center;
}
.setting{
    img{
        width: 30px;
        height: 30px;
    }
}
.logo{
    img{
        width:129px;
        height:20px;    
    }
}
</style>