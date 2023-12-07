<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'':pageContext.request.getSession(true).getAttribute('U_id')}" />
<%--session 값 확인 :<p th:text="${session.U_id}"></p>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프</title>
    <%-- 공통 제이쿼리 --%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link href="<c:url value='/css/common.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/C_main.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/menupan.css'/>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<c:url value='/css/Campsearchbar.css'/> ">
    <%--    캠프리스트랑 사용하는 검색바 --%>
    <script async src="https://static1.sharpweather.com/widgetjs/?id=idaf0e17f988c43"></script>
</head>
<body>

<%--
<div class="menu_pan" id="menu_pan">
    <div class="menu_op"></div>
    <div class="pan_area">
        <div class="pan_line"></div>
        <div class="pan_name">
            <p>메뉴</p>
            <div class="pan_icon">
                <a href="#">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#AAAAAA" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M10.52 2C9.7039 2 8.99053 2.55053 8.78369 3.33997L8.60093 4.03751C8.49705 4.43398 8.17709 4.80118 7.70755 5.05591C7.25355 5.30222 6.79257 5.36839 6.40657 5.24678L5.36604 4.91895C4.56311 4.66599 3.68511 4.99978 3.25677 5.7268L1.9191 7.99725C1.50109 8.70673 1.62147 9.60779 2.21727 10.1797L3.13069 11.0565C3.36157 11.2781 3.49921 11.6323 3.49921 12.0567C3.49921 12.4813 3.36155 12.8356 3.1306 13.0572L2.21727 13.9339C1.62147 14.5058 1.50109 15.4069 1.9191 16.1164L3.25677 18.3868C3.68511 19.1138 4.56311 19.4476 5.36604 19.1947L6.52661 18.829C6.83836 18.7308 7.21681 18.7819 7.58776 18.9913C7.97416 19.2093 8.2236 19.5241 8.29517 19.8493L8.45845 20.5912C8.63957 21.4141 9.36876 22.0002 10.2114 22.0002H12.9215C13.7376 22.0002 14.4509 21.4497 14.6578 20.6603L14.8502 19.9258C14.9412 19.5785 15.2177 19.2514 15.6307 19.0226C16.0403 18.7957 16.4575 18.7376 16.8037 18.8468L17.9079 19.1948C18.7109 19.4479 19.5889 19.114 20.0172 18.3869L21.3545 16.1162C21.7723 15.4067 21.6519 14.5057 21.0562 13.9338L20.1442 13.0581C19.913 12.8362 19.7753 12.4816 19.7753 12.0567C19.7753 11.814 19.8642 11.624 19.9883 11.5138L21.0756 10.5481C21.7125 9.98253 21.8559 9.05078 21.4248 8.31868L20.0875 6.04803C19.6722 5.34292 18.8318 5.0052 18.0446 5.22061L17.0854 5.48305C16.7364 5.57854 16.3221 5.50404 15.9227 5.26064C15.5234 5.01725 15.2633 4.68255 15.1868 4.33505L14.983 3.40909C14.8019 2.58615 14.0727 2 13.2301 2H10.52ZM10.2719 3.7299C10.3015 3.61713 10.4034 3.53848 10.52 3.53848H13.2301C13.3505 3.53848 13.4546 3.62222 13.4805 3.73978L13.6843 4.66573C13.8736 5.52572 14.4657 6.17432 15.1221 6.57437C15.7877 6.98005 16.6374 7.20066 17.4914 6.96698L18.4506 6.70454C18.572 6.67133 18.701 6.72548 18.7618 6.82877L20.0991 9.09943L20.7619 8.70906L20.0991 9.09943C20.1591 9.20122 20.1382 9.32307 20.054 9.39782L18.9667 10.3635C18.4586 10.8147 18.2368 11.454 18.2368 12.0567C18.2368 12.7903 18.4742 13.5875 19.0786 14.1678L19.9907 15.0436C20.069 15.1187 20.087 15.2366 20.0288 15.3355L18.6915 17.6062C18.6286 17.7129 18.4937 17.7663 18.3704 17.7275L17.2663 17.3794C16.4228 17.1136 15.5666 17.2993 14.8851 17.6769C14.2092 18.0514 13.5865 18.6789 13.362 19.5358L13.1695 20.2703C13.14 20.3831 13.0381 20.4618 12.9215 20.4618H10.2114C10.091 20.4618 9.98684 20.378 9.96097 20.2605L9.79769 19.5186C9.60962 18.6641 9.00952 18.0271 8.34396 17.6515C7.69274 17.2839 6.87206 17.1072 6.06431 17.3616L4.90373 17.7273C4.78032 17.7662 4.64521 17.7126 4.5823 17.6059L3.24463 15.3354L2.59201 15.7199L3.24463 15.3354C3.1864 15.2366 3.20445 15.1189 3.28264 15.0438L4.19598 14.1671C4.80036 13.587 5.03769 12.7901 5.03769 12.0567C5.03769 11.3235 4.80037 10.5266 4.19606 9.94655L3.28264 9.06978C3.20445 8.99472 3.1864 8.87704 3.24463 8.7782L4.5823 6.50776C4.64521 6.40098 4.78032 6.34745 4.90373 6.38633L5.94427 6.71416C6.82837 6.99269 7.72471 6.79691 8.44119 6.40821C9.16813 6.01383 9.84805 5.34774 10.0892 4.42744L10.2719 3.7299ZM9.36428 12.0001C9.36428 10.7256 10.3975 9.6924 11.672 9.6924C12.9465 9.6924 13.9797 10.7256 13.9797 12.0001C13.9797 13.2746 12.9465 14.3078 11.672 14.3078C10.3975 14.3078 9.36428 13.2746 9.36428 12.0001ZM11.672 8.15392C9.5478 8.15392 7.8258 9.87593 7.8258 12.0001C7.8258 14.1243 9.5478 15.8463 11.672 15.8463C13.7962 15.8463 15.5182 14.1243 15.5182 12.0001C15.5182 9.87593 13.7962 8.15392 11.672 8.15392Z" fill="current"></path></svg>
                </a>
            </div>
        </div>
        <div class="pan_btn">
            <a href="<c:url value='/login/login'/>" class="pan_btn02">
            <a href="<c:url value='${ logInOutLink }' />" class="pan_btn02">${ logInOutTxt }</a>
            </a>
            <a href="<c:url value='/join'/>" class="pan_btn01">
            <c:if test="${empty userId }">
                <a href="<c:url value='/join'/>" class="pan_btn01">회원가입</a>
            </c:if>
            <c:if test="${not empty userId }">
                <a href="<c:url value='/mypage/mypage'/>" class="pan_btn01">마이페이지</a>
            </c:if>
            </a>
            <a href="<c:url value='/store/s_index'/>" class="pan_btn03">
                <p>쇼핑몰로 이동</p>
            </a>
        </div>
    </div>
</div>
</div>


--%>



<div id="wrap">

    <div class="header">
        <div class="logo">
            <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
            <a href="<c:url value='/store/s_index/'/>" class="logo_a">힐링캠프</a>
        </div>

        <div class="hamberg">
            <div class="line" id="line_top"></div>
            <div class="line" id="line_mid"></div>
            <div class="line" id="line_bot"></div>
        </div>
        <div class="menu_pan" id="menu_pan">
            <div class="menu_list">
                <ul class="menu_list_ul">
                    <li><a href="<c:url value='/join'/>" class="pan_btn01">
                        <c:if test="${empty userId }">
                            <a href="<c:url value='/join'/>" class="pan_btn01">회원가입</a>
                        </c:if>
                        <c:if test="${not empty userId }">
                            <a href="<c:url value='/mypage/mypage'/>" class="pan_btn01">마이페이지</a>
                        </c:if>
                    </a></li>
                    <li><a href="<c:url value='/store/s_index'/>" class="pan_btn03"><p>쇼핑몰로 이동</p></a></li>
                </ul>
            </div>
        </div>
        <%-- 모바일 버전만 나옴 --%>



        <div class="member">
          <%-- 날씨 api 자리 --%>

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
        </div>

    </div>
    <div class="mainP">
        <div class="maintext">
            <div class="searchTXT">"Discover pure serenity with us. Escape for healing moments. Your journey to tranquility starts here."</div>


            <form action="<c:url value='/camp/c_list'/>">
                <div class="search_box">
                    <div class="search-bar">
                        <input type="text" class="search-input" name="keyword" value="" placeholder="캠핑장명 검색" autocomplete= "off">
                        <img src="<c:url value='/img/search_icon_black.png'/>">
                    </div>
                    <div class="list_bar">
                        <div class="in2">
                            <input type="date" class="date-input" value="" placeholder="출발 날짜" autocomplete= "off">
                            <h3 class="list_h3"> ~ </h3>

                            <input type="date" class="date-input" placeholder="도착 날짜" autocomplete= "off">
                            <select name="type" class="category-select">
                                <option value=""> 어디로 떠나볼까요?</option>
                                <option value="강원도"> 강원도</option>
                                <option value="경기도"> 경기도</option>
                                <option value="경상남도"> 경상남도</option>
                                <option value="경상북도"> 경상북도</option>
                                <option value="대구"> 대구</option>
                                <option value="인천"> 인천</option>
                                <option value="전라남도"> 전라남도</option>
                                <option value="전라북도"> 전라북도</option>
                                <option value="제주특별자치도"> 제주특별자치도</option>
                                <option value="충청남도"> 충청남도</option>
                                <option value="충청북도"> 충청북도</option>
                            </select>
                        </div>
                        <input type="int" name="page" value=0 hidden>
                        <input type="int" name="recordSize" value=10 hidden>
                        <button class="search-button">검색</button>
                    </div>
                </div>
            </form>
            <div class="btn_box">
                <a href="<c:url value='${ logInOutLink }' />">
                    <div class="main_btn"> ${ logInOutTxt } </div>
                </a>
                <a href="<c:url value='/store/s_index'/>">
                    <div class="main_btn"> STORE</div>
                </a>
            </div>
        </div>
        <div class="mainPL">
            <div class="mainPL2"></div>

        </div>
        <%--    왼쪽 화면 --%>
        <div class="mainPR">


            <%--    <div class="panpan">--%>
            <%--            <div class="A11">--%>
            <%--                    <div class="A112"><img src="<c:url value='/img/05.png'/>" ></div>--%>
            <%--                    <div class="A112"><img src="<c:url value='/img/05.png'/>" ></div>--%>
            <%--            </div>--%>
            <%--                <div class="A12">--%>
            <%--                    <div class="A113"><img src="<c:url value='/img/05.png'/>" ></div>--%>
            <%--                    <div class="A113"><img src="<c:url value='/img/05.png'/>" ></div>--%>
            <%--                    <div class="A113"><img src="<c:url value='/img/05.png'/>" ></div>--%>
            <%--                </div>--%>
            <%--        </div>--%>
            <%--        </div>--%>
            <div class="shape">
                <div class="opacity_txt_box"></div>
            </div>
        </div>
    </div>
    <%--    /////////////////////////--%>
    <%--랭킹--%>
    <div class="w_1300">
        <div class="C_Lanking">
            <div class="hot_msg">HOT PLACE</div>
            <div id="main_item01" class="item-list">
                <c:forEach var="CMList" items="${campMainlist}">
                    <div class="item">
                        <a href="<c:url value='/camp/c_list/${CMList.c_ID}'/>">
                            <img src="<c:url value='/img/Camp_img/${CMList.c_F_image}'/>" alt="">
                            <div class="item-content item_txt">
                                <h3>${CMList.c_region_si}</h3>
                                <h3>${CMList.c_name}</h3>

                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <%--    --%>
    <div class="mid_bar">
        <div class="mid_txt_bar">
            <h2>with All in One!</h2>
            <h3>From reservations to weather and gear, enjoy camping seamlessly</h3>
        </div>

    </div>
    <div class="w_1300">
        <div class="I_Lanking">
            <div class="p50img"></div>
            <div class="hot_msg">HOT ITEM</div>
            <div id="main_item02" class="item-list">
                <c:forEach var="IMList" items="${i_list}">
                    <div class="item">
                        <a href="<c:url value='/store/s_list/${IMList.i_ID}'/>">
                            <img src="<c:url value='/img/item_img/${IMList.i_img_URL}'/>" alt="">
                            <div class="item-content item_txt">
                                <h3>${IMList.i_company}</h3>
                                <h3>${IMList.i_name}</h3>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="Camptop_btn"></div>
    </div>
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

<script type="text/javascript" src="<c:url value='/js/C_ham.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/top_btn.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/menu_pan.js'/>"></script>
<script>
    let keyword = "";
    let startDate = "";
    let endDate ="";
    let type = "";
    $(document).ready(function (){


        $(document).on('click', '.search-button', function (){
            keyword = $('.search-input').val();
            startDate = $('#datepicker1').val();
            endDate = $('#datepicker2').val();
            type = $('.category-select').val();
            location.href = "/app/camp/c_list?keyword="+keyword+"&startDate="+startDate+"&endDate="+endDate+"&type="+type;
        })

        $('#datepicker2').on('input', function () {
            let toDate = new Date();

            startDate = $('#datepicker1').val();
            endDate = $(this).val();

            console.log(startDate);
            console.log(endDate);
            // '-'를 기준으로 나누어 배열에 저장
            let startDateArray = startDate.split('-');
            let endDateArray = endDate.split('-');

            if (+startDateArray[2] > +endDateArray[2] ||
                (+startDateArray[2] <= +endDateArray[2] && +startDateArray[1] > +endDateArray[1]) ||
                (+startDateArray[2] <= +endDateArray[2] && +startDateArray[1] <= +endDateArray[1] && +startDateArray[0] > +endDateArray[0])) {
                alert("예약은 첫 날보다 이후 날짜로 조회 가능합니다.");
                $(this).val("")
            }
            // campReserveList();
        })
    })
</script>


</body>
</html>
