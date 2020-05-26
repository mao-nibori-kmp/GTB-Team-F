<template>
    <div class="tmp">
        <div class="concierge">
            <div class="con_img">
                <img src="https://icon-pit.com/wp-content/uploads/2018/10/person_user_icon_408-300x300.png" alt="">
            </div>
            <div class="con_text">
                <div class="req_html">
                    <slot></slot>
                </div>
            </div>
            <div class="triangle"></div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
.tmp {
    width: 100%;
    display: flex;
    justify-content: center;
    .concierge {
        width: calc(100% - 40px);
        max-width: 600px;
        margin: 0 20px 0 20px;
        display: flex;
        position: relative;
        .con_img {
            width: 50px;
            height: 50px;
            margin-top: 10px;
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
            padding: 10px;
            width: calc(100% - 90px);
            min-height: 45px;
            background-color: #fff;
            display: flex;
            align-items: center;
            font-size: 1.6rem;
        }
        .triangle {
            border-top: 5px solid transparent;
            border-right: 10px solid #fff;
            border-bottom: 5px solid transparent;
            position: absolute;
            top: 20px;
            left: 60px;
        }
    }
}
</style>


