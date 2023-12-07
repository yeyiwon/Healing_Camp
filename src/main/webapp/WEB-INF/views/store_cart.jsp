<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- 모두 공통 css -->
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <!-- 상점 nav css -->
    <link rel="stylesheet" href="<c:url value='/css/store_common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/s_cart.css'/>">
</head>
<body>
<div id="wrap">
    <!-- 헤더 -->
    <div class="header">
        <div class="logo">
            <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
            <span>Store</span>
            <a href="<c:url value='/store/s_index/'/>" class="logo_a">힐링캠프</a>
        </div>
        <div class="member">
            <div class="mb_menu login">
                <a href="<c:url value='/login/login/'/>" class="mb_menu_a">로그인</a>
            </div>
            <div class="mb_menu join">
                <a href="<c:url value='/join/join/'/>" class="mb_menu_a">회원가입</a>
            </div>
            <div class="mb_menu cart">
                <a href="<c:url value='/store/s_cart/'/>" class="mb_menu_a">장바구니</a>
            </div>
            <div class="mb_menu to_camp_index">
                <a href="<c:url value='/'/>" class="mb_menu_a">캠핑페이지로</a>
            </div>
        </div>
    </div>
    <!-- 네비 -->
    <div class="s_nav">
        <div class="s_nav_menu_box">
            <div class="s_nav_menu s_nav_menu1">
                <a href="<c:url value='/store/s_list?menu=I_ID'/>" class="s_nav_menu_a">전체</a>
            </div>
            <div class="s_nav_menu s_nav_menu2">
                <a  href="<c:url value='/store/s_list?menu=I_sell_cnt'/>" class="s_nav_menu_a">BEST</a>
            </div>
            <div class="s_nav_menu s_nav_menu3">
                <a  href="<c:url value='/store/s_brand'/>" class="s_nav_menu_a">BRAND</a>
            </div>
            <div class="s_nav_menu s_nav_menu4">
                <a  href="<c:url value='/'/>" class="s_nav_menu_a">ABOUTUS</a>
            </div>
        </div>
        <div class="s_search">
            <select id="sel_filter">
                <option value='N' ${param.option == 'N'? "selected":""}>상품명</option>
                <option value='B' ${param.option == 'B'? "selected":""}>브랜드명</option>
            </select>
            <input type="text" id="s_search_text" class="s_search_text" placeholder="검색어를 입력하세요" value="${param.keyword}">
            <img src="<c:url value='/img/search_icon.png/'/>" alt="서치아이콘" id="s_search_icon" class="s_search_icon">
        </div>
    </div>
    <!-- 메인 -->
    <main class="main">
        <section class="cart">
            <div class="w_1300">
                <div class="sec_title">
                    <h1>장바구니</h1>
                </div>
                <div class="cart_container">
                    <article class="cart_item_list">
                        <div class="cart_item_list_header">
                            <div class="L">
                                <div class="all_checkmark chkActive">✓</div>
                                <span>전체선택</span>
                            </div>
                            <div class="check_delete_btn">선택삭제</div>
                        </div>
                        <div class="cart_item_list_container">
                            <c:choose>
                                <c:when test="${itemlist.isEmpty()}">
                                    <h3>장바구니가 비어 있습니다.</h3>
                                </c:when>
                                <c:when test="${itemlist != null}">
                                    <c:forEach var="ItemDto" items="${itemlist}">
                                        <div class="item_box">
                                            <input type="hidden" value="${ItemDto.i_ID}" id="chk_id">
                                            <div class="checkmark chkActive">✓</div>
                                            <div class="box1">
                                                <div class="box1_img">
                                                    <img src="<c:url value='/img/item_img/${ItemDto.i_img_URL}/'/>" alt="">
                                                </div>
                                                <div class="box1_info">
                                                    <div class="item_name">${ItemDto.i_name}</div>
                                                    <div class="item_price">
                                                        <span>가격 : </span>
                                                        <div class="o_price" id="o_price${ItemDto.i_ID}">${ItemDto.i_O_price}</div>
                                                        <div class="s_price" id="s_price${ItemDto.i_ID}">${ItemDto.i_S_Price}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="box2">
                                                <div class="count_box">
                                                    <div class="item_count_btn btn_minus">-</div>
                                                    <input type="number" min="1" value="${ItemDto.item_cart_cnt}" class="item_count">
                                                    <div class="item_count_btn btn_plus">+</div>
                                                    <input type="hidden" value="${ItemDto.i_ID}" class="chk_id">
                                                </div>
                                                <div class="item_total_price" id="f_price${ItemDto.i_ID}"></div>
                                            </div>
                                            <div class="box3">
                                                <div class="box3_order_btn">주문하기</div>
                                                <div class="box3_delete_btn">✖ 삭제</div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="delete_all_btn">장바구니 비우기</div>
                                </c:when>
                                <c:otherwise>
                                    <h3>장바구니가 비어 있습니다.</h3>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </article>
                    <article class="total_info_box">
                        <div class="total_info_header">최종결제</div>
                        <div class="total_info">
                            <div class="item_total_price">
                                <div>총 상품금액</div>
                                <div class="price_num">35000원</div>
                            </div>
                            <div class="delivery_charge">
                                <div>
                                    배송비
                                    <span>(10만원 이상 구매시 배송비 무료)</span>
                                </div>
                                <div class="price_num">5,000원</div>
                            </div>
                        </div>
                        <div class="final_price">
                            <div>총 결제금액</div>
                            <div class="price_num">40,000원</div>
                        </div>
                        <div class="pay_btn">주문하기</div>
                    </article>
                </div>
                <div class="cart_operation_guide">
                    <div class="OG_header">이용안내</div>
                    <h5>장바구니 이용안내</h5>
                    <ol>
                        <li>
                            [쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.
                        </li>
                        <li>
                            장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.
                        </li>
                        <li>
                            파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.
                        </li>
                        <li>
                            해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.
                        </li>
                        <li>
                            해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.
                        </li>
                    </ol>
                    <h5>무이자할부 이용안내</h5>
                    <ol>
                        <li>
                            상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.
                        </li>
                        <li>
                            [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.
                        </li>
                        <li>
                            단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.
                        </li>
                        <li>
                            무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.
                            <br>
                            실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.
                        </li>
                    </ol>
                </div>
            </div>
        </section>
    </main>
    <div class="Camptop_btn"></div>
    <!-- 푸터 -->
    <div class="footer">
        <div class="w_1300 f_content_area">
            <div class="footer_top">
                <ul>
                    <li>
                        <a href="#" class="f_t_li">회사소개</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">개인정보 처리방침</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">청소년 보호 정책</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">서비스이용약관</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">위치정보이용약관</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">전자금융거래 이용약관</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">전자금융거래 이용자 유의사항</a>
                    </li>
                </ul>
            </div>
            <div class="footer_bottom">
                <div class="f_b_L">
                    <div class="logo">
                        <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
                        <a href="<c:url value='/'/>" class="logo_a">힐링캠프</a>
                    </div>
                    <div class="f_b_L_phone">
                        <h3>고객센터</h3>
                        <h1>1644-0000</h1>
                        평일 09:00~18:00 / 점심시간 12:00~13:00
                    </div>
                </div>
                <div class="f_b_R">
                    <h2>힐링캠프</h2>
                    <div class="f_b_R_txt">
                        대표 : OOO | 사업자 등록번호 : OOO-OO-OOOOOO |
                        통신판매업 신고 : OO-OOOOO호 | 메일 : healing_camp@heling.com |
                        관광사업자 등록번호 : 제 OOOO-OO호 | 주소 : 서울시 서울구 서울동 123-12 |
                    </div>
                    <div class="f_b_R_txt2">
                        호스팅서비스 제공자 : 힐링캠프
                        COPYRIGHT ⓒ HEALINGCAMP ALL RIGHTS RESERVED.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="top_btn">Top</div>
</div>
<script src="<c:url value='/js/header,footer.js'/>"></script>
<script src="<c:url value='/js/s_cart.js'/>"></script>
<script src="<c:url value='/js/top_btn.js'/> "></script>
<script>
    $(document).ready(function() {
        $('#s_search_icon').on("click", function (){
            location.href = "<c:url value='/store/s_list'/>?page=0&option="+$('#sel_filter').val()+"&keyword="+$('#s_search_text').val().trim();
        })
        $('#s_search_text').on("keydown", function(e){
            if(e.keyCode === 13){
                $('#s_search_icon').trigger('click');
            }
        })
        $(document).on('click', '.item_count_btn', function () {
            $.ajax({
                type: 'POST',
                url: '/app/store/s_cart_update?I_ID='+$(this).parent('.count_box').children('.chk_id').val()+'&Item_cart_cnt='+$(this).parent('.count_box').children('.item_count').val(),
                headers : { "content-type": "application/json"},
                success : function(result){
                    // console.log(result)
                },
                error : function (){
                    alert("error!")
                }
            })
        })

        let itemlist = {};

        $(document).on('click', '.box3_delete_btn', function () {
            $.ajax({
                type: 'POST',
                url: '/app/store/s_cart_delete_one?I_ID='+$(this).parent('.box3').parent('.item_box').children('#chk_id').val(),
                headers : { "content-type": "application/json"},
                success : function(result){
                    // itemlist = result;

                    let list = "";
                    for(let i=0; i<result.length; i++) {
                        let tmp="";
                        if(result[i].i_S_Price==null) {
                            tmp="display:none";

                        }

                        list +=  `<div class="item_box">
                                    <input type="hidden" value="${'${result[i].i_ID}'}" id="chk_id">
                                    <div class="checkmark chkActive">✓</div>
                                    <div class="box1">
                                        <div class="box1_img">
                                            <img src="/app/img/item_img/${'${result[i].i_img_URL}'}" alt="">
                                        </div>
                                        <div class="box1_info">
                                            <div class="item_name">${'${result[i].i_name}'}</div>
                                            <div class="item_price">
                                                <span>가격 : </span>
                                                <div class="o_price" id="o_price${'${result[i].i_ID}'}">${'${result[i].i_O_price}'}</div>
                                                    <div class="s_price" id="s_price${'${result[i].i_ID}'}" style="${'${tmp}'}">${'${result[i].i_S_Price}'}</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box2">
                                        <div class="count_box">
                                            <div class="item_count_btn btn_minus">-</div>
                                            <input type="number" min="1" value="${'${result[i].item_cart_cnt}'}" class="item_count">
                                            <div class="item_count_btn btn_plus">+</div>
                                            <input type="hidden" value="${'${result[i].i_ID}'}" class="chk_id">
                                        </div>
                                        <div class="item_total_price" id="f_price${'${result[i].i_ID}'}"></div>
                                    </div>
                                    <div class="box3">
                                        <div class="box3_order_btn">주문하기</div>
                                        <div class="box3_delete_btn">✖ 삭제</div>
                                    </div>
                                </div>`;
                    }
                    $('.cart_item_list_container').html(list+`<div class="delete_all_btn">장바구니 비우기</div>`)

                    // console.log("s_price : " + $('.s_price').text())

                    for(let i=0; i<$('.s_price').length; i++) {
                        if($('.s_price').eq(i).text()=="null") {
                            $('.s_price').eq(i).css({
                                display: 'none'
                            })
                        }
                    }
                    price_info();
                },
                error : function (){
                    alert("error!")
                }
            })
        });

        $(document).on('click', '.delete_all_btn', function (){
        // $('.delete_all_btn').click(function (){
            $.ajax({
                type: 'POST',
                url: '/app/store/s_cart_delete_all',
                headers : { "content-type": "application/json"},
                success : function(result){
                    console.log(result)
                    if(result == 1){
                        $('.cart_item_list_container').html(`
                        <h3>장바구니가 비어 있습니다.</h3>
                        `)
                    }
                    price_info();
                },
                error : function (){
                    alert("error!")
                }
            })
        })

        $(document).on('click', '.check_delete_btn', function (){
            let chklist = new Array();
            for (i=0; i<$('.item_box').length; i++){
                if($('.checkmark').eq(i).hasClass('chkActive')){
                    chklist.push($('.checkmark').eq(i).prev('#chk_id').val())
                }
            }

            $.ajax({
                type: 'POST',
                url: '/app/store/s_cart_delete_chk_list?chklist='+chklist,
                headers : { "content-type": "application/json"},
                // data : {
                //     chklist : chklist
                // },
                success : function (result){
                    // itemlist = result;
                    let list = "";

                    for(let i=0; i<result.length; i++) {
                        list +=  `<div class="item_box">
                                    <input type="hidden" value="${'${result[i].i_ID}'}" id="chk_id">
                                    <div class="checkmark">✓</div>
                                    <div class="box1">
                                        <div class="box1_img">
                                            <img src="/app/img/item_img/${'${result[i].i_img_URL}'}" alt="">
                                        </div>
                                        <div class="box1_info">
                                            <div class="item_name">${'${result[i].i_name}'}</div>
                                            <div class="item_price">
                                                <span>가격 : </span>
                                                <div class="o_price" id="o_price${'${result[i].i_ID}'}">${'${result[i].i_O_price}'}</div>`;

                        list +=  `<div class="s_price" id="s_price${'${result[i].i_ID}'}" style="${'${result[i].i_S_Price}'==null?'display:none':''}">${'${result[i].i_S_Price}'}</div>`;

                        list +=              `</div>
                                        </div>
                                    </div>
                                    <div class="box2">
                                        <div class="count_box">
                                            <div class="item_count_btn btn_minus">-</div>
                                            <input type="number" min="1" value="${'${result[i].item_cart_cnt}'}" class="item_count">
                                            <div class="item_count_btn btn_plus">+</div>
                                            <input type="hidden" value="${'${result[i].i_ID}'}" class="chk_id">
                                        </div>
                                        <div class="item_total_price" id="f_price${'${result[i].i_ID}'}"></div>
                                    </div>
                                    <div class="box3">
                                        <div class="box3_order_btn">주문하기</div>
                                        <div class="box3_delete_btn">✖ 삭제</div>
                                    </div>
                                </div>`;
                    }
                    $('.cart_item_list_container').html(list+`<div class="delete_all_btn">장바구니 비우기</div>`)

                    // console.log("s_price : " + $('.s_price').text())

                    // for(let i=0; i<$('.s_price').length; i++) {
                    //     if($('.s_price').eq(i).text()=="null") {
                    //         $('.s_price').eq(i).css({
                    //             display: 'none'
                    //         })
                    //     }
                    // }
                    price_info();
                },
                error : function (){
                    alert("error!")
                }
            })
        })

        $('.box3_order_btn').click(function (){
            window.location.href = "/app/store/s_buy?I_ID="+$(this).parent('.box3').parent('.item_box').children('#chk_id').val();
        })

        $('.pay_btn').click(function (){
            let chklist = new Array();
            for (i=0; i<$('.item_box').length; i++){
                if($('.checkmark').eq(i).hasClass('chkActive')){
                    chklist.push($('.checkmark').eq(i).prev('#chk_id').val())
                }
            }

            console.log(chklist)
            window.location.href = "/app/store/s_buy?I_ID="+chklist;
        })



    })
</script>

</body>
</html>