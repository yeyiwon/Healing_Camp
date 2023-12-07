$(document).ready(function(){

    /* 헤더 스크롤 색상 변경*/
    let inner_size = window.innerHeight;
    $(window).scroll(function(){
        if(inner_size < $(window).scrollTop()){
            $('.header').css({
                background : '#fff'
            })
            $('.s_nav').css({
                background : '#fff'
            })
        }
        else{
            $('.header').css({
                background: 'rgba(255, 255, 255, 0.5)'
            })
            $('.s_nav').css({
                background : 'rgba(255, 255, 255, 0.5)'
            })
        }
    })
})