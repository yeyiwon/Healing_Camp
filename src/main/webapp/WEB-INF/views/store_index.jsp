<%@ page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'':pageContext.request.getSession(true).getAttribute('U_id')}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프 상점</title>

    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/store_common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/store_index.css'/> ">

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
    <div class="header">
        <div class="logo">
            <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
            <span>Store</span>
            <a href="<c:url value='/store/s_index'/>" class="logo_a">힐링캠프</a>
        </div>
        <div class="member">
            <div class="mb_menu login">
                <a href="<c:url value='${ logInOutLink }' />" class="mb_menu_a">${ logInOutTxt }</a>
            </div>
            <div class="mb_menu join">
                <c:if test="${empty userId }">
                    <a href="<c:url value='/join'/>" class="mb_menu_a">회원가입</a>
                </c:if>
                <c:if test="${not empty userId }">
                    <a href="<c:url value='/mypage/mypage'/>" class="mb_menu_a">마이페이지</a>
                </c:if>
            </div>
            <div class="mb_menu cart">
                <a href="<c:url value='/store/s_cart/'/>" class="mb_menu_a">장바구니</a>
            </div>
            <div class="mb_menu to_camp_index">
                <a href="<c:url value='/'/>" class="mb_menu_a">캠핑페이지로</a>
            </div>
        </div>
    </div>
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
    <div class="container">
        <div class="s_main_banner">
            <img src="<c:url value='/img/camp_main1.jpg/'/>" alt="" class="s_main_banner_img">
            <div class="s_b_pan"></div>
            <div class="s_main_ban_txt">
                자연 속에서 느끼는 평온과 휴식의 시간을 함께하세요.
                힐링은 당신의 공간에 찾아옵니다.
            </div>
            <img src="<c:url value='/img/scroll_icon.gif/'/>" alt="" class="s_main_scroll_icon">
        </div>
        <div class="s_sec s_sec_cate_bg">
            <div class="s_sec_cate w_1300">
                <div class="s_cate_menu">
<%--                    <a href="<c:url value='/store/s_list?menu=I_ID&cate=1'/>">--%>
                        <div class="s_cate_img">
                            <img src="<c:url value='/img/cate_menu/cate_tent.png'/>" alt="">
                        </div>
                        <span>텐트</span>
<%--                    </a>--%>
                </div>
                <div class="s_cate_menu">
<%--                    <a href="<c:url value='/store/s_list?menu=I_ID&cate=2'/>">--%>
                        <div class="s_cate_img">
                            <img src="<c:url value='/img/cate_menu/cate_taff.png'/>" alt="">
                        </div>
                        <span>타프</span>
<%--                    </a>--%>
                </div>
                <div class="s_cate_menu">
<%--                    <a href="<c:url value='/store/s_list?menu=I_ID&cate=3'/>">--%>
                        <div class="s_cate_img">
                            <img src="<c:url value='/img/cate_menu/cate_chair.png'/>" alt="">
                        </div>
                        <span>의자</span>
<%--                    </a>--%>
                </div>
                <div class="s_cate_menu">
<%--                    <a href="<c:url value='/store/s_list?menu=I_ID&cate=4'/>">--%>
                        <div class="s_cate_img">
                            <img src="<c:url value='/img/cate_menu/cate_table.png'/>" alt="">
                        </div>
                        <span>테이블</span>
<%--                    </a>--%>
                </div>
                <div class="s_cate_menu">
<%--                    <a href="<c:url value='/store/s_list?menu=I_ID&cate=5'/>">--%>
                        <div class="s_cate_img">
                            <img src="<c:url value='/img/cate_menu/cate_bag.png'/>" alt="">
                        </div>
                        <span>가방/수납</span>
<%--                    </a>--%>
                </div>
                <div class="s_cate_menu">
<%--                    <a href="<c:url value='/store/s_list?menu=I_ID&cate=6'/>">--%>
                        <div class="s_cate_img">
                            <img src="<c:url value='/img/cate_menu/cate_kitchen.png'/>" alt="">
                        </div>
                        <span>키친/쿨러</span>
<%--                    </a>--%>
                </div>
                <div class="s_cate_menu">
<%--                    <a href="<c:url value='/store/s_list?menu=I_ID&cate=7'/>">--%>
                        <div class="s_cate_img">
                            <img src="<c:url value='/img/cate_menu/cate_lantern.png'/>" alt="">
                        </div>
                        <span>랜턴/기타</span>
<%--                    </a>--%>
                </div>
            </div>
        </div>
        <div class="s_sec s_sec_best w_1300">
            <div class="s_sec_head best-title">BEST</div>
            <div class="s_sec_plus_btn">
                <a href="<c:url value='/store/s_list?menu=I_sell_cnt&cate=0'/>">
                    더보기&gt;
                </a>
            </div>
            <div class="s_sec_body s_best_box">
                <c:forEach var="item" items="${indexBest}">
                    <div class="s_best_item_box">
                        <a href="<c:url value='/store/s_detail?I_ID=${item.i_ID}'/>" class="s_item_a">
                            <div class="s_item_img_box">
                                <img src="<c:url value='/img/item_img/${item.i_img_URL}/'/>" alt="" class="s_item_img">
                                <div class="s_item_btn_box">
                                    <div class="s_item_btn s_item_like_btn" data-iid="${item.i_ID}">
                                        <img id="wish${item.i_ID}" src="<c:url value='/img/wish_heart${item.wishYn}.png'/>" alt="">
                                    </div>
                                    <div class="s_item_btn s_item_cart_btn" data-iid="${item.i_ID}">
                                        <img src="<c:url value='/img/cart_icon.png'/>" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="s_item_text">
                                <div class="s_item_company">${item.i_company}</div>
                                <div class="s_item_title">${item.i_name}</div>
                                <div class="s_item_price">
                                    <c:choose>
                                        <c:when test="${empty item.i_S_Price}">
                                            <span class="s_item_s_price"><fmt:formatNumber value="${item.i_O_price}" pattern="#,###"/>원</span>
                                        </c:when>
                                        <c:when test="${!empty item.i_S_Price}">
                                            <span class="s_item_o_price"><fmt:formatNumber value="${item.i_O_price}" pattern="#,###"/>원</span>
                                            <span class="s_item_s_price"><fmt:formatNumber value="${item.i_S_Price}" pattern="#,###"/>원</span>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="s_sec s_sec_MDPick w_1300">
            <div class="s_sec_head MD-title">MD Pick</div>
            <div class="s_sec_plus_btn">
                <a href="<c:url value='/store/s_list?menu=I_ID&cate=0&sort=0'/>">
                    더보기&gt;
                </a>
            </div>
            <div class="s_sec_body MDPick_box">
                <c:forEach var="item" items="${indexMDPick}">
                    <div class="MDPick_item_box">
                        <a href="<c:url value='/store/s_detail?I_ID=${item.i_ID}'/>" class="s_item_a">
                            <div class="s_item_img_box">
                                <img src="<c:url value='/img/item_img/${item.i_img_URL}/'/>" alt="" class="s_item_img">
                                <div class="s_item_btn_box">
                                    <div class="s_item_btn s_item_like_btn"  data-iid="${item.i_ID}">
                                        <img id="wish${item.i_ID}" src="<c:url value='/img/wish_heart${item.wishYn}.png'/>" alt="">
                                    </div>
                                    <div class="s_item_btn s_item_cart_btn"  data-iid="${item.i_ID}">
                                        <img src="<c:url value='/img/cart_icon.png'/>" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="s_item_text">
                                <div class="s_item_company">${item.i_company}</div>
                                <div class="s_item_title">${item.i_name}</div>
                                <div class="s_item_price">
                                    <c:choose>
                                        <c:when test="${empty item.i_S_Price}">
                                            <span class="s_item_s_price"><fmt:formatNumber value="${item.i_O_price}" pattern="#,###"/>원</span>
                                        </c:when>
                                        <c:when test="${!empty item.i_S_Price}">
                                            <span class="s_item_o_price"><fmt:formatNumber value="${item.i_O_price}" pattern="#,###"/>원</span>
                                            <span class="s_item_s_price"><fmt:formatNumber value="${item.i_S_Price}" pattern="#,###"/>원</span>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="s_sec s_sec_new w_1300">
            <div class="s_sec_head new-title">NEW</div>
            <div class="s_sec_plus_btn">
                <a href="<c:url value='/store/s_list?menu=I_ID&cate=0&sort=1'/>">
                    더보기&gt;
                </a>
            </div>
            <div class="s_sec_body new_box">
                <c:forEach var="item" items="${indexNew}">
                    <div class="new_item_box">
                        <a href="<c:url value='/store/s_detail?I_ID=${item.i_ID}'/>" class="s_item_a">
                            <div class="s_item_img_box">
                                <img src="<c:url value='/img/item_img/${item.i_img_URL}/'/>" alt="" class="s_item_img">
                                <div class="s_item_btn_box">
                                    <div class="s_item_btn s_item_like_btn" data-iid="${item.i_ID}">
                                        <img id="wish${item.i_ID}" src="<c:url value='/img/wish_heart${item.wishYn}.png'/>" alt="">
                                    </div>
                                    <div class="s_item_btn s_item_cart_btn" data-iid="${item.i_ID}">
                                        <img src="<c:url value='/img/cart_icon.png'/>" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="s_item_text">
                                <div class="s_item_company">${item.i_company}</div>
                                <div class="s_item_title">${item.i_name}</div>
                                <div class="s_item_price">
                                    <c:choose>
                                        <c:when test="${empty item.i_S_Price}">
                                            <span class="s_item_s_price"><fmt:formatNumber value="${item.i_O_price}" pattern="#,###"/>원</span>
                                        </c:when>
                                        <c:when test="${!empty item.i_S_Price}">
                                            <span class="s_item_o_price"><fmt:formatNumber value="${item.i_O_price}" pattern="#,###"/>원</span>
                                            <span class="s_item_s_price"><fmt:formatNumber value="${item.i_S_Price}" pattern="#,###"/>원</span>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
<%--        <div class="s_sec s_ad_bar">--%>
<%--            <div class="s_ad_slide s_ad_slide1"></div>--%>
<%--            <div class="s_ad_slide s_ad_slide2"></div>--%>
<%--            <div class="s_ad_slide s_ad_slide3"></div>--%>
<%--        </div>--%>
    </div>
    <div class="Camptop_btn"></div>
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
    <script src="<c:url value='/js/top_btn.js'/> "></script>
    <script src="<c:url value='/js/store_index.js'/>"></script>
    <script>
        $(document).ready(function(){
            $('.s_cate_menu').click(function(){
                let menu = 'I_ID';
                let cate = ($(this).index()) + 1;
                // alert("cate : " + cate);
                location.href = '/app/store/s_list?menu='+menu+'&cate='+cate;
            })

            $('#s_search_icon').on("click", function (){
                location.href = "<c:url value='/store/s_list'/>?page=0&option="+$('#sel_filter').val()+"&keyword="+$('#s_search_text').val().trim();
            })
            $('#s_search_text').on("keydown", function(e){
                if(e.keyCode === 13){
                    $('#s_search_icon').trigger('click');
                }
            })
            let likeId="";
            /* 찜 누르면 data iid 확인 해서 알림창 띄워주기 */
            $('.s_item_like_btn').click(function (){
                likeId = $(this).attr("data-iid");
                console.log(likeId)
            })

            /* 장바구니 누르면 data iid 확인해서 알림창 띄워주기 */
            $('.s_item_cart_btn').click(function (){
                likeId = $(this).attr("data-iid");
                console.log(likeId)
            })

            /* 아이템 카트에 추가하기*/
            $('.s_item_cart_btn').click(function (){

                $.ajax({
                    type: 'POST',
                    url: '/app/store/cart_insert?I_ID='+likeId+'&Item_cart_cnt=1',
                    headers : { "content-type": "application/json"},
                    // dataType : 'json',
                    // data: JSON.stringify(),
                    success : function (result){
                        console.log(result)
                        console.log(likeId)
                        if(result == 2){
                            alert("로그인이 필요합니다.")
                        }
                        else if(result == 1 ){
                            alert("장바구니에 추가되었습니다.")
                        }
                        else if(result == -1){
                            alert("이미 추가된 상품 입니다.")
                        }
                    },
                    error : function (){
                        alert("error!")
                        // window.location = "http://localhost:8080/app/login/login"
                    }
                })
                return false;
            })


            /*아이템 찜 목록에 추가하기*/
            $('.s_item_like_btn').click(function (){
                let thisItem=$('.s_item_like_btn').attr("data-iid");
                $.ajax({
                    type: 'POST',
                    url: '/app/store/itemwishlist_insert?I_ID='+likeId,
                    headers : { "content-type": "application/json"},
                    // dataType : 'json',
                    // data: JSON.stringify(),
                    success : function (result){
                        console.log(result)
                        if(result == 2){
                            alert("로그인이 필요합니다.")
                        }
                        else if(result == 1 ){
                            $('#wish'+likeId).attr("src", "<c:url value='/img/wish_heart2.png/'/>")
                        }
                        else if(result == -1){
                            $('#wish'+likeId).attr("src", "<c:url value='/img/wish_heart1.png/'/>");
                        }
                    },
                    error : function (){
                        alert("error!")
                        // window.location = "http://localhost:8080/app/login/login"
                    }
                })
                return false;
            })
        })
    </script>

</body>
</html>