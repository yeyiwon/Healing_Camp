<%@ page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'':pageContext.request.getSession(true).getAttribute('U_id')}" />

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프 상점</title>

    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/store_common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/store_brand.css'/> ">

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
    <div id="wrap">
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
                    <a  href="<c:url value=''/>" class="s_nav_menu_a">ABOUTUS</a>
                </div>
            </div>
            <div class="s_search">
                <select id="sel_filter" name="option">
                    <option value='N' ${param.option == 'N'? "selected":""}>상품명</option>
                    <option value='B' ${param.option == 'B'? "selected":""}>브랜드명</option>
                </select>
                <input type="text" id="s_search_text" class="s_search_text" placeholder="검색어를 입력하세요" value="${param.keyword}">
                <img src="<c:url value='/img/search_icon.png/'/>" alt="서치아이콘" id="s_search_icon" class="s_search_icon">
            </div>
        </div>
        <div class="container">
            <div class="s_brand_cate_bar w_1300">
                <c:forEach var="item" items="${storeBrandName}">
                    <div class="s_brand_cate" data-bcate="${item}">${item}</div>
                </c:forEach>
            </div>
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
    </div>

    <script src="<c:url value='/js/top_btn.js'/> "></script>
    <script>
        $(document).ready(function(){
            $('.s_brand_cate').click(function(){
                let b_cate = $(this).attr("data-bcate");
                console.log(b_cate)
                location.href = '<c:url value='/store/s_list'/>?keyword='+b_cate+'&option=B';
            })

            $('#s_search_icon').on("click", function (){
                location.href = "<c:url value='/store/s_list'/>?page=0&option="+$('#sel_filter').val()+"&keyword="+$('#s_search_text').val().trim();
            })
            $('#s_search_text').on("keydown", function(e){
                if(e.keyCode === 13){
                    $('#s_search_icon').trigger('click');
                }
            })

        })
    </script>
</body>
</html>
