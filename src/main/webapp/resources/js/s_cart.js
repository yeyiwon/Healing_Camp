$(document).ready(function() {
    // let price = 0;

    $(document).on('click', '.btn_minus', function () {
        if(+$(this).next('.item_count').val()  - 1  >= 1) {
            for (i=0; i<$('.item_box').length; i++){
                $('.o_price').eq(i).text($('.o_price').eq(i).text().split("원")[0].replaceAll(",",""));
                $('.s_price').eq(i).text($('.s_price').eq(i).text().split("원")[0].replaceAll(",",""));
                $('.box2 .item_total_price').eq(i).text($('.box2 .item_total_price').eq(i).text().split("원")[0].replaceAll(",",""));
            }
            let o_price = $(this).parent('.count_box').parent('.box2').prev('.box1').children('.box1_info').children('.item_price').children('.o_price').text()
            let s_price = $(this).parent('.count_box').parent('.box2').prev('.box1').children('.box1_info').children('.item_price').children('.s_price').text()
            let f_price = 0;
            console.log("o_price="+o_price)
            console.log("s_price="+s_price)

            if(s_price===""){
                f_price = o_price
            }
            else if(s_price!==""){
                f_price = s_price
            }

            let tmp_qty = +$(this).next('.item_count').val()  - 1;
            $(this).next('.item_count').val(tmp_qty)

            let total_price = $(this).parent('.count_box').next('.item_total_price')
            total_price.text($(this).next('.item_count').val()*f_price)

            o_price.split("원")[0].replace(/,/gi,"")
            s_price.split("원")[0].replace(/,/gi,"")
            price_info()
        }
    })
    $(document).on('click', '.btn_plus', function () {
        for (i=0; i<$('.item_box').length; i++){
            $('.o_price').eq(i).text($('.o_price').eq(i).text().split("원")[0].replaceAll(",",""));
            $('.s_price').eq(i).text($('.s_price').eq(i).text().split("원")[0].replaceAll(",",""));
            $('.box2 .item_total_price').eq(i).text($('.box2 .item_total_price').eq(i).text().split("원")[0].replaceAll(",",""));
        }
        let o_price = $(this).parent('.count_box').parent('.box2').prev('.box1').children('.box1_info').children('.item_price').children('.o_price').text();
        let s_price = $(this).parent('.count_box').parent('.box2').prev('.box1').children('.box1_info').children('.item_price').children('.s_price').text();
        console.log($(this).parent('.count_box').parent('.box2').prev('.box1').children('.box1_info').children('.item_price').children('.o_price').text())
        console.log($(this).parent('.count_box').parent('.box2').prev('.box1').children('.box1_info').children('.item_price').children('.s_price').text())
        console.log("o_price="+o_price)
        console.log("s_price="+s_price)
        // o_price = Number(o_price.text());
        // s_price = Number(s_price.text());
        if(s_price===""){
            f_price = +o_price
        }
        else if(s_price!==""){
            f_price = +s_price
        }
        console.log("f_price="+f_price)

        let tmp_qty = +$(this).prev('.item_count').val()  + 1
        $(this).prev('.item_count').val(tmp_qty)

        let total_price = $(this).parent('.count_box').next('.item_total_price')
        total_price.text($(this).prev('.item_count').val()*f_price)

        // if(isNaN(s_price)){
        //     s_price = 0
        // }
        // if(isNaN(total_price)){
        //     total_price = f_price
        // }

        // o_price.split("원")[0].replace(/,/gi,"")
        // s_price.split("원")[0].replace(/,/gi,"")
        price_info()

    })
    // $('.checkmark, .all_checkmark').click(function(){

    $(document).on('click', '.checkmark, .all_checkmark', function () {
        $(this).toggleClass('chkActive');
        price_info()
    })
    // $('.all_checkmark').click(function(){
    $(document).on('click', '.all_checkmark', function () {
        if($(this).hasClass('chkActive')){
            $('.checkmark').addClass('chkActive')
        }
        else if($(this).hasClass('chkActive') == false){
            $('.checkmark').removeClass('chkActive')
        }
        price_info()
    })


    price_info();


    let cc_o_top = $('.cart_container').offset().top;
    $(window).resize(function(){
        if (window.innerWidth > 600) {
            $(window).scroll(function(){
                let s_top = $(window).scrollTop() + 130;
                if(s_top >= cc_o_top) {
                    $('.total_info_box').css({
                        top: $(window).scrollTop() - cc_o_top + 130,
                    })
                }
            })
        }
    }).resize();
})

function price_info(){
    let all_price_total = 0;

    for(i=0; i<$('.item_box').length; i++){
        let item_cnt = +$('.item_count').eq(i).val()

        if($('.s_price').eq(i).text()== "" || $('.s_price').eq(i).text()== "null" || $('.s_price').eq(i).text()== 0 || isNaN($('.s_price').eq(i).text())){         /* 세일가 없을때 */
            // price = +$('.o_price').eq(i).text();
            $('.s_price').eq(i).css({               /* 세일가 없으면 s_price의 display:none */
                display: "none"
            })
            $('.item_total_price').eq(i).text(Number($('.o_price').eq(i).text())*item_cnt)
        }
        else if($('.s_price').eq(i).text()!= ""){    /* 세일가 있을때 */
            // price = +$('.s_price').eq(i).text();
            $('.o_price').eq(i).css({               /* 세일가 있으면 o_price 줄긑기,숫자연하게 */
                textDecoration: "line-through",
                color: "#888",
                fontSize: "21px"
            })
            $('.item_total_price').eq(i).text(Number($('.s_price').eq(i).text())*item_cnt)
        }
        else if($('.s_price').eq(i).text()!= "null"){
            $('.o_price').eq(i).css({
                textDecoration: "line-through",
                color: "#888",
                fontSize: "21px"
            })
            $('.item_total_price').eq(i).text(Number($('.s_price').eq(i).text())*item_cnt)
        }
        else if($('.s_price').eq(i).text()!= 0){
            $('.o_price').eq(i).css({
                textDecoration: "line-through",
                color: "#888",
                fontSize: "21px"
            })
            $('.item_total_price').eq(i).text(Number($('.s_price').eq(i).text())*item_cnt)
        }
        else if(isNaN($('.s_price').eq(i).text())){
            $('.o_price').eq(i).css({
                textDecoration: "line-through",
                color: "#888",
                fontSize: "21px"
            })
            $('.item_total_price').eq(i).text(Number($('.s_price').eq(i).text())*item_cnt)
        }

        if($('.item_box').eq(i).find('.checkmark').hasClass('chkActive')) {
            let each_price = Number($('.item_total_price').eq(i).text())
            all_price_total +=  each_price
        }

        let o_price = $('.o_price').eq(i).text()             /* 기본가 */
        let s_price = $('.s_price').eq(i).text()             /* 세일가 */
        let f_price = $('.item_total_price').eq(i).text()
        //
        // console.log(typeof o_price);
        // if(typeof o_price == "number"){
        //     $('.o_price').eq(i).text(Number(o_price).toLocaleString("ko")+"원")
        //     $('.s_price').eq(i).text(Number(s_price).toLocaleString("ko")+"원")
        //     $('.item_total_price').eq(i).text(Number(f_price).toLocaleString("ko")+"원")
        // }
        $('.o_price').eq(i).text(Number(o_price).toLocaleString("ko")+"원")
        $('.s_price').eq(i).text(Number(s_price).toLocaleString("ko")+"원")
        $('.item_total_price').eq(i).text(Number(f_price).toLocaleString("ko")+"원")
    }
    $('.item_total_price .price_num').text(all_price_total.toLocaleString("ko")+"원")
    $('.item_total_price .price_num').text(all_price_total.toLocaleString("ko")+"원")
    if(all_price_total >= 100000){                               /* 최종가격 50000이상 일때 */
        $('.delivery_charge .price_num').text('0원')
    }
    else if(all_price_total == 0){                              /* 최종가격 0원 일때 */
        $('.delivery_charge .price_num').text('0원')
    }
    else{                                                       /* 그외 */
        $('.delivery_charge .price_num').text('5,000원')
    }

    let delivery_charge = Number($('.delivery_charge .price_num').text().split('원')[0].replace(',',""));
    $('.final_price .price_num').text((all_price_total + delivery_charge).toLocaleString("ko")+"원")
}