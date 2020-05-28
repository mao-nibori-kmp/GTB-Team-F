<template>
    <div class="tmp">
        <div class="header">
            <div class="navbar">
                <div class="setting">
                    <img src="/assets/設定矢印2.png" alt="" v-on:click="$emit('toggle')">
                </div>      
                <div class="logo">
                    <ul>
                        <li>設定</li>  
                    </ul>       
                </div>          
            </div> 
        </div> 
        <div class="hero">
            <div class="listbar">
                <ul>
                    <li><a href="https://www.youtube.com/" class="listbar">プロフィール設定</a></li>
                    <li><a href="https://www.youtube.com/" class="listbar">興味のあるジャンル設定</a></li>
                    <li><a href="https://www.youtube.com/" class="listbar">銀行設定</a></li>
                    <li><a href="https://www.youtube.com/" class="listbar">毎月の貯金額設定</a></li>
                    <li><a href="https://www.youtube.com/" class="listbar">ログイン設定</a></li>
                    <li><a data-method="delete" href="/logout" class="listbar">ログアウト</a></li>
                </ul>
            </div>  
        </div>
    </div>
</template>

<script>
export default {
  
}
</script>

<style lang="scss" scoped>

.tmp {
    width: 300px;
    height: 100%;
    position: absolute;
    top: 0;
    right: 0;
    background-color: #fff;
    box-shadow: -8px 0px 8px -1px rgba(0,0,0,0.31);
}

 .header{
    background-color:#F5F5F6;
     width: 300px;
    height: 60px;
    margin: 0 auto;
    display: flex;
    align-items:center;
     border-bottom: 1px solid #E1E2E1
 }
 .navbar{
    width: 300px;
    height: 60px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items:center;
}
.logo{
    padding-right: 136px;
    font-size: 14px;
    color:#666666;
  ul{
    list-style-type:none;
    align-items: center;
    }
   }
.setting{
     padding-left: 15px;
     img{
        width:13px;
        height:25px;
    }  
}
.hero{
    background-color: #fff;
    width:300px;
    display:flex;
    align-items: center;
    justify-content:center;
}
.listbar{
    text-align: left;
    font-size:14px;
    display:block;
    ul{
    width: 300px;
    list-style-type:none;
    align-items: center;
    } 
    li{
    padding-top:10px;
    padding-bottom:10px;
    padding-left: 30px;
    border-bottom: 1px solid#E1E2E1;
    color:#666666
　　 }
    li{
        a{
            color:#666666;
            text-decoration: none;
        }
    }
}
</style>