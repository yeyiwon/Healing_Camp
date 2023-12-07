$(document).ready(function(){
    /* 카테 메뉴 클릭 시 색상 변경 */
    $(document).on('click', '.s_cate_menu', function(){
        $('.s_cate_menu').removeClass('s_cate_menu_active').removeClass('s_cate_menu_hover')
        $('.s_cate_menu').eq($(this).index()).addClass('s_cate_menu_active')
    });

    /* 카테 메뉴 클릭 된 index만 빼고 호버시 색상 약간 어둡게 */
    $('.s_cate_menu').mouseenter(function(){
        if($('.s_cate_menu').eq($(this).index()).hasClass('s_cate_menu_active')==false){
            $('.s_cate_menu').eq($(this).index()).addClass('s_cate_menu_hover')
        }
    })
    $('.s_cate_menu').mouseleave(function(){
        if($('.s_cate_menu').eq($(this).index()).hasClass('s_cate_menu_active')==false){
            $('.s_cate_menu').eq($(this).index()).removeClass('s_cate_menu_hover')
        }
    })
    /* 정렬버튼 클릭 시 글씨 두껍게 */
    $(document).on('click', '.s_sort_btn', function(){
        $('.s_sort_btn').removeClass('s_sort_btn_selected').removeClass('s_sort_btn_hover')
        $('.s_sort_btn').eq($(this).index()).addClass('s_sort_btn_selected')
    })

    /* 정렬버튼 호버시 글씨 색 변하게 */
    $('.s_sort_btn').mouseenter(function(){
        if($('.s_sort_btn').eq($(this).index()).hasClass('s_sort_btn_selected')==false){
            $('.s_sort_btn').eq($(this).index()).addClass('s_sort_btn_hover')
        }
    })
    $('.s_sort_btn').mouseleave(function(){
        if($('.s_sort_btn').eq($(this).index()).hasClass('s_sort_btn_selected')==false){
            $('.s_sort_btn').eq($(this).index()).removeClass('s_sort_btn_hover')
        }
    })
})