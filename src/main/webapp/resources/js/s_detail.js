$(document).ready(function() {

/* ======================= 스크롤 이벤트 ======================= */
    let DP_bot_top = $('.DP_bot_nav').offset().top;
    $(window).scroll(function(){
        let s_top = $(window).scrollTop();
        let sg_o_top = $('#shopping_guide').offset().top - 550;
        if(DP_bot_top <= s_top && s_top <= sg_o_top) {
            $('.side_order_box').css({
                top:  $(window).scrollTop() - DP_bot_top + 50,
                display: "block",
            })
        }

        if(s_top >= DP_bot_top - 130) {
            $('.DP_bot_nav').css({
                top: $(window).scrollTop() - DP_bot_top ,
            })

            $('.top_btn').css({
                display: "flex",
            })
        }
        else{
            $('.DP_bot_nav').css({
                top: 0 ,
            })
            $('.side_order_box').css({
                display: "none",
            })
            $('.top_btn').css({
                display: "none",
            })
        }

    })
/* ======================= 가격정보 ======================= */
    let price = $('.DP_item_o_price').text();
    let o_price = +$('.DP_item_o_price').text();
    let s_price = +$('.DP_item_s_price').text();

    if($('.DP_item_s_price').text()==""){
        price = $('.DP_item_o_price').text();
        $('.DP_item_s_price').css({
            display: "none"
        })
    }
    else if($('.DP_item_s_price').text()!=""){
        price = $('.DP_item_s_price').text();
        $('.DP_item_o_price').css({
            textDecoration: "line-through",
            color: "#888",
            fontSize: "20px"
        })
    }

    $('.order_count_btn_minus').click(function(){
        if(+$('.order_count').val()  - 1  >= 1) {
            let tmp_qty = +$('.order_count').val()  - 1;
            $('.order_count').val(tmp_qty)

            price_info();
        }
    })
    $('.order_count_btn_plus').click(function(){
        let tmp_qty = +$('.order_count').val()  + 1;
        $('.order_count').val(tmp_qty)

        price_info();
    })
    $('.side_order_count_btn_minus').click(function(){
        if(+$(this).next('.side_order_count').val()  - 1  >= 1) {
            let tmp_qty = +$(this).next('.side_order_count').val()  - 1;
            $(this).next('.side_order_count').val(tmp_qty)

            price_info();
        }
    })
    $('.side_order_count_btn_plus').click(function(){
        let tmp_qty = +$(this).prev('.side_order_count').val()  + 1;
        $(this).prev('.side_order_count').val(tmp_qty)

        price_info();
    })
    function price_info(){
        let cnt = +$('.order_count').val()
        // let o_price = +$('.DP_item_o_price').text();
        // let s_price = +$('.DP_item_s_price').text();
        $('.DP_item_o_price').text(o_price.toLocaleString("ko")+"원")
        $('.DP_item_s_price').text(s_price.toLocaleString("ko")+"원")
        $('.order_price').text((Number(price)*cnt).toLocaleString("ko")+"원")
        $('.DP_total_price .span1').text((Number(price)*cnt).toLocaleString("ko")+"원")
        $('.DP_total_price .span2').text("("+cnt+"개)")
        $('.side_order_box_article3 .span2').text((Number(price)*cnt).toLocaleString("ko")+"원")
    }
    price_info();

    $('.top_btn').click(function(){
        $('html, body').animate({
            scrollTop: 0
        }, 800)
    })
})