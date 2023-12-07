$(document).ready(function(){
    /* 헤더 스크롤 색상 변경*/
    $(window).scroll(function(){
        if(100 < $(window).scrollTop()){
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