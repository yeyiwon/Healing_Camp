$(document).ready(function(){

    $(".DP_bot_nav li").click(function () {
        var target1 = $(this).attr("href");
        var targetOffset1 = $(target1).offset().top - $(".DP_bot_nav").height() + 1;

        $("html, body").animate({ scrollTop: targetOffset1 }, 600);
        // 애니
        return false;

    });

    let it_1= $('#item_detail').offset().top;

    let it_2= $('#shopping_guide').offset().top;

    let it_3= $('#DP_QA').offset().top;

    let it_4= $('#DP_review').offset().top;

    $(window).scroll(function () {
        var scrollPos1 = $(window).scrollTop() + 160;

        if (scrollPos1 > it_4) {
            $(".CD_nav_ul li a").removeClass("active1");
            $(".CD_nav_ul li").eq(3).children('a').addClass("active1");
        } else if (scrollPos1 > it_3) {
            console.log("3번이 닿음");
            $(".CD_nav_ul li a").removeClass("active1");
            $(".CD_nav_ul li").eq(2).children('a').addClass("active1");
        } else if (scrollPos1 > it_2) {
            console.log("2번이 닿음");
            $(".CD_nav_ul li a").removeClass("active1");
            $(".CD_nav_ul li").eq(1).children('a').addClass("active1");
        } else if (scrollPos1 > it_1) {
            $(".CD_nav_ul li a").removeClass("active1");
            $(".CD_nav_ul li").eq(0).children('a').addClass("active1");
        }
    })

});
