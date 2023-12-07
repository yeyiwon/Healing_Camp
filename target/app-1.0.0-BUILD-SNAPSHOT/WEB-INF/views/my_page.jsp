<%@ page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="campcount" value="${ pageContext.request.getSession(false).getAttribute('campCount')==null?'':pageContext.request.getSession(false).getAttribute('campCount')}" />
<c:set var="logInOutLink" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'':pageContext.request.getSession(true).getAttribute('U_id')}" />

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/mypage.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/mypageUserInfo.css'/> ">
    <%--        <link rel="stylesheet" href="<c:url value='/css/mypageUserInfoModify.css'/> ">--%>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<div id="wrap">
    <!-- 공동 header -->
    <div class="header">
        <div class="logo">
            <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
            <a href="<c:url value='/'/>" class="logo_a">힐링캠프</a>
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
            <div class="mb_menu to_camp_index">
                <a href="<c:url value='/'/>" class="mb_menu_a">캠핑페이지로</a>
            </div>
        </div>
    </div>
    <!-- 사이드 메뉴바  -->
    <div class="containermy"></div>
    <div class="MY_container">


        <%--        <button id="openPopupBtn" class="popupbtn">리뷰 쓰기</button>--%>
        <div id="backgroundOverlay" class="overlay"></div>
        <div id="popupForm" class="POP_container">
            <form>
                <label for="title">제목</label>
                <div class="boxboxbox">
                    <input type="hidden" class="chk_cid">
                    <input type="hidden" class="chk_cname">
                    <input type="hidden" class="chk_R_date">
                    <input type="text" id="title" class="review_txt_box chk_R_title" required>
<%--                    <div class="area1">--%>
<%--                        <label class="score11" for="score">Score</label>--%>
<%--                        <input type="number" id="score" class="scoreindex chk_C_R_score" min="1" max="5" required>--%>
<%--                    </div>--%>
                </div>
                <textarea class="chk_R_txt" id="review" placeholder="내용" required></textarea>
                <div class="myp_btn">
                    <button type="submit" class="btn btn2 R_write_btn">글 쓰기</button>
                    <button class="btn btn2 R_update_btn">수정하기</button>
                    <button class="btn btn1" type="button" onclick="closePopup()">취소</button>
                </div>
            </form>
        </div>


        <div class="side_nav">
            <!-- 마이페이지 내용 -->
            <ul class="side_nav_ul">
                <li><a href="#" class="my_menu_item"><img src="<c:url value='/img/me.png'/>" alt="">MY INFO</a></li>
                <li><a href="#" class="my_menu_item"><img src="<c:url value='/img/reserv.png'/>" alt="">예약 확인</a></li>
                <li><a href="#" class="my_menu_item"><img src="<c:url value='/img/JJIM.png'/>" alt="">캠핑장 찜</a></li>
                <li><a href="#" class="my_menu_item"><img src="<c:url value='/img/JJIM.png'/>"alt="">아이템 찜</a> </li>
                <li><a href="#" class="my_menu_item"><img src="<c:url value='/img/review.png'/>"alt="">MY REVIEW</a></li>
                <li><a href="#" class="my_menu_item"><img src="<c:url value='/img/point.png'/>"alt="">POINT</a></li>
            </ul>
        </div>

        <div class="my_page_container">
            <div class="my_selected_item">
                <div class="my_side active">
                    <div class="my_h2">MY INFO</div>
                    <div class="m_sec my_info_main">
                        <table>
                            <tr>
                                <th>아이디</th>
                                <td id="pickUid" data-uid="${selectUserInfo.u_id}">${selectUserInfo.u_id}</td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${selectUserInfo.u_name}</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>${selectUserInfo.u_phone}</td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td>${selectUserInfo.u_birth}</td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <c:choose>
                                    <c:when test="${selectUserInfo.u_gender eq '0'}">
                                        <td><c:out value="남" /> </td>
                                    </c:when>
                                    <c:when test="${selectUserInfo.u_gender eq '1'}">
                                        <td> <c:out value="여" /></td>
                                    </c:when>
                                </c:choose>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>${selectUserInfo.u_email}</td>
                            </tr>
                            <tr>
                                <th>선호지역</th>
                                <td>${selectUserInfo.u_field}</td>
                            </tr>
                            <tr>
                                <th>
                                    <button id="forInfoUpdate" class="infobutton">수정</button>
                                    <div id="userInfoUpdateContainer"></div>
                                </th>
                            </tr>
                        </table>
                    </div>
                    <%--                            <jsp:include page="mypageUserInfo.jsp"></jsp:include>--%>
                </div>
                <div class="my_side">
                    <div class="my_h2">예약 내역</div>
                    <div class="reserve_body">
                        <c:forEach var="item" items="${selectCampReserve}">
                            <div class="mypage-rev">
                                <div class="rev-list_L">
                                    <div class="rev-name">캠핑장 이름: ${item.c_name}</div>
                                    <div class="rev-address">${item.c_region}</div>
                                </div>
                                <div class="rev-list_R">
                                    <div class="rev-details">예약 일자: ${item.c_startDate} / ${item.c_endDate}</div>
                                    <div class="rev-date">이용 여부 : ${item.reserveYn}</div>

                                    <div class="button_box">
                                        <c:choose>
                                            <c:when test="${item.reserveYn eq '이용예정'}">
                                                <button class="button cancel-button"  data-cid="${item.c_ID}" data-unum="${selectUserInfo.u_num}" data-csdt="${item.c_startDate}" data-cedt="${item.c_endDate}">예약취소</button>
                                            </c:when>
                                            <c:when test="${item.reserveYn eq '이용완료'}">
                                                <button class="button review-button" data-cid="${item.c_ID}" data-cnm="${item.c_name}" data-cdt="${item.c_startDate}">리뷰쓰기</button>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <%-- 예약 내역에서 리뷰 글쓰기 버튼 --%>
                <%--                    <button id="openPopupBtn" class="popupbtn">리뷰 쓰기</button>--%>
                <%--                    <div id="backgroundOverlay" class="overlay"></div>--%>
                <%--                    <div id="popupForm" class="POP_container">--%>
                <%--                        <form>--%>
                <%--                            <label for="title">제목</label>--%>
                <%--                            <div class="boxboxbox">--%>
                <%--                                <input type="text" id="title" class="review_txt_box" required>--%>
                <%--                                <div class="area1">--%>
                <%--                                    <label class="score11" for="score">Score</label>--%>
                <%--                                    <input type="number" id="score" class="scoreindex" min="1" max="5" required>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                            <textarea id="review" placeholder="내용" required></textarea>--%>
                <%--                            <div class="myp_btn">--%>
                <%--                                <button type="submit" class="btn btn2">글 쓰기</button>--%>
                <%--                                <button class="btn btn1" type="button" onclick="closePopup()">취소</button>--%>
                <%--                            </div>--%>
                <%--                        </form>--%>
                <%--                    </div>--%>

                <%--리뷰 ///////////////////////////////////--%>
                <div class="my_side" id="CWL">
                    <div class="my_h2">캠핑장 찜 목록</div>
                    <div class="CWL_main">
                        <c:forEach var="CampDto" items="${campwishlist}">
                            <div class="CWL">
                                <div class="CWL_container">
                                    <div class="CWL_name">
                                        <span>${CampDto.c_name}</span>
                                    </div>
                                    <div class="CWL_region">
                                        <span>${CampDto.c_region}</span>
                                    </div>
                                    <div class="CWL_price">
                                        <span>가격 :</span>
                                        <span>${CampDto.c_Price}</span>
                                    </div>
                                </div>

                                <div class="CWL_item">
                                    <div class="CWL_area">
                                        <span>예약 가능 자리 :</span>
                                        <span>${CampDto.c_area}</span>
                                    </div>
                                    <div class="delete_campwishlist_btn">✖ 삭제</div>
                                    <input type="hidden" value="${CampDto.c_ID}" id="CWL_chk_id">
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>


                <div class="my_side" id="IWL">
                    <div class="my_h2 ">아이템 찜 목록</div>
                    <div class="IWL_main">
                        <c:forEach var="ItemDto" items="${itemwishlist}">
                            <div class="IWL">
                                <div class="IWL_img">
                                    <img src="<c:url value='/img/item_img/${ItemDto.i_img_URL}/'/>">
                                </div>
                                <div class="IWL_container">
                                    <div class="IWL_name">
                                        <span>${ItemDto.i_name}</span>
                                    </div>
                                    <div class="IWL_bot_box">
                                        <span class="IWL_company">${ItemDto.i_company}</span>
                                        <div class="IWL_price">
                                            <span>가격 :</span>
                                            <span class="IWL_o_price">${ItemDto.i_O_price}</span><span>원</span>
                                        </div>
                                    </div>

                                </div>
                                <div class="delete_itemwishlist_btn">✖ 삭제</div>
                                <input type="hidden" value="${ItemDto.i_ID}" id="IWL_chk_id">
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="my_side" id="MY_review">
                    <div class="my_h2">MY REVIEW </div>
                    <%--                        내 리뷰 목록 --%>
                    <%--                    큰 리스트가 my_review--%>
                    <c:forEach var="Camp_reviewDto" items="${usercampreviewlist}">
                        <div class="my_review">
                            <div class="my_review_item">
                                <div class="my_review1">캠핑장 ( ${Camp_reviewDto.c_name} ) 리뷰</div>
                                <div class="my_review2"> 제목 : ${Camp_reviewDto.c_R_title}</div>
                                <div class="my_review3"> 내용 : ${Camp_reviewDto.c_R_text} </div>
                            </div>
                            <div class="review_item2">
                                <div class="review2">
                                    <div class="my_review4">방문 날짜: ${Camp_reviewDto.r_date}</div>
                                    <div class="my_review5">별점  ${Camp_reviewDto.c_R_score}</div>
                                </div>
                                <div class="review-actions">
                                    <button class="edit-btn">수정</button>
                                    <input type="hidden" class="chk_update_cid" value="${Camp_reviewDto.c_ID_fk}">
                                    <input type="hidden" class="chk_update_cname" value="${Camp_reviewDto.c_name}">
                                    <input type="hidden" class="chk_update_rdate" value="${Camp_reviewDto.r_date}">
                                    <input type="hidden" class="chk_update_title" value="${Camp_reviewDto.c_R_title}">
                                    <input type="hidden" class="chk_update_text" value="${Camp_reviewDto.c_R_text}">
                                    <input type="hidden" class="chk_update_cscore" value="${Camp_reviewDto.c_R_score}">
                                    <button class="delete-btn">삭제</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <%--                    <div class="my_review">--%>
                    <%--                        <div class="my_review_item">--%>
                    <%--                            <div class="my_review1">캠핑장 ( 오디캠핑장 ) 리뷰</div>--%>
                    <%--                            <div class="my_review2"> 제목 : </div>--%>
                    <%--                            <div class="my_review3"> 내용 : ㄴㅇㅅdfdffdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdf </div>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="review_item2">--%>
                    <%--                            <div class="review2">--%>
                    <%--                                <div class="my_review4">방문 날짜: 2023-11-01</div>--%>
                    <%--                                <div class="my_review5">별점  </div>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="review-actions">--%>
                    <%--                                <button class="edit-btn">수정</button>--%>
                    <%--                                <button class="delete-btn">삭제</button>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>
                <%--////////////////////////////////////리뷰 끝--%>
                <div class="my_side">
                    <div class="my_h2"> POINT </div>
                    <div class="my_p">
                        <p>내 포인트 사용 내역을 확인할 수 있는 페이지입니다.</p>
                        <p>현재 포인트: <span>${pointList}</span> point</p>
                    </div>
                </div>
                <div class="cover-bar"></div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $(document).on('click', '.delete_campwishlist_btn', function () {
            $.ajax({
                type: 'POST',
                url: '/app/mypage/delete_campwishlist?C_ID='+$(this).next('#CWL_chk_id').val(),
                headers : { "content-type": "application/json"},
                success : function (result){
                    let list = "";
                    for(let i=0; i<result.length; i++){
                        list +=
                            `<div class="CWL">
                            <div class="CWL_container">
                                <div class="CWL_name">
                                    <span>${'${result[i].c_name}'}</span>
                                </div>
                                <div class="CWL_region">
                                    <span>${'${result[i].c_region}'}</span>
                                </div>
                                <div class="CWL_price">
                                    <span>가격 :</span>
                                    <span>${'${result[i].c_Price}'}</span>
                                </div>
                            </div>

                            <div class="CWL_item">
                                <div class="CWL_area">
                                    <span>예약 가능 자리 :</span>
                                    <span>${'${result[i].c_area}'}</span>
                                </div>
                                <div class="delete_campwishlist_btn">✖ 삭제</div>
                                <input type="hidden" value="${'${result[i].c_ID}'}" id="CWL_chk_id">
                            </div>
                        </div>`;
                    }
                    $('.CWL_main').html(list);
                },
                error : function (){
                    alert("error!")
                }
            })
        })

        $(document).on('click', '.delete_itemwishlist_btn', function () {
            $.ajax({
                type: 'POST',
                url: '/app/mypage/delete_itemwishlist?I_ID='+$(this).next('#IWL_chk_id').val(),
                headers : { "content-type": "application/json"},
                success : function (result){
                    let list = "";
                    for(let i=0; i<result.length; i++){
                        list +=
                            `<div class="IWL">
                                <div class="IWL_img">
                                    <img src="/app/img/item_img/${'${result[i].i_img_URL}'}" alt="">
                                </div>
                                <div class="IWL_container">
                                    <div class="IWL_name">
                                        <span>${'${result[i].i_name}'}</span>
                                    </div>
                                    <div class="IWL_bot_box">
                                        <span class="IWL_company">${'${result[i].i_company}'}</span>
                                        <div class="IWL_price">
                                            <span>가격 :</span>
                                            <span class="IWL_o_price">${'${result[i].i_O_price}'}</span><span>원</span>
                                        </div>
                                    </div>

                                </div>
                                <div class="delete_itemwishlist_btn">✖ 삭제</div>
                                <input type="hidden" value="${'${result[i].i_ID}'}" id="IWL_chk_id">
                            </div>`;
                    }
                    $('.IWL_main').html(list);
                },
                error : function (){
                    alert("error!")
                }
            })
        })

        $(document).on('click', '.edit-btn', function (){
            // $('.edit-btn').click(function (){
            $('#backgroundOverlay').css({
                display: "block",
                zIndex: 99999
            })
            $('#popupForm').css({
                display: "block",
                zIndex: 999999
            })
            $('.chk_cid').val($(this).parent('.review-actions').children('.chk_update_cid').val());
            $('.chk_cname').val($(this).parent('.review-actions').children('.chk_update_cname').val());
            $('.chk_R_date').val($(this).parent('.review-actions').children('.chk_update_rdate').val());
            $('.chk_R_title').val($(this).parent('.review-actions').children('.chk_update_title').val());
            $('.chk_R_txt').val($(this).parent('.review-actions').children('.chk_update_text').val());
            $('.chk_C_R_score').val($(this).parent('.review-actions').children('.chk_update_cscore').val());

            console.log($('.chk_cid').val());
            console.log($('.chk_cname').val());
            console.log($('.chk_R_date').val());
            console.log($('.chk_R_title').val());
            console.log($('.chk_R_txt').val());
            console.log($('.chk_C_R_score').val());
            $('.R_write_btn').css({
                display : "none"
            })
            $('.R_update_btn').css({
                display : "block"
            })
        })

        $(document).on('click', '.R_write_btn', function (){
            let C_ID = $('.chk_cid').val();
            let C_name = $('.chk_cname').val();
            let R_date = $('.chk_R_date').val();
            let C_R_score = $('.chk_C_R_score').val();
            let C_R_title = $('.chk_R_title').val();
            let C_R_text = $('.chk_R_txt').val();
            $.ajax({
                type: 'POST',
                url: "/app/review/write?C_ID="+C_ID+"&C_name="+C_name+"&C_R_score="+C_R_score+"&R_date="+R_date+"&C_R_title="+C_R_title+"&C_R_text="+C_R_text,
                headers : { "content-type": "application/json"},
                success : function (result){
                    if(result == 1 ){
                        alert("리뷰 작성 완료!")
                    }
                    else if(result == -1){
                        alert("이미 리뷰를 작성 하였습니다.")
                    }
                    $('#backgroundOverlay').css({
                        display: "none",
                    })
                    $('#popupForm').css({
                        display: "none",
                    })
                },
                error : function (){
                    alert("error!")
                }
            })
        })

        $(document).on('click', '.R_update_btn', function (){
            let C_ID = $('.chk_cid').val();
            let C_R_score = $('.chk_C_R_score').val();
            let C_R_title = $('.chk_R_title').val();
            let C_R_text = $('.chk_R_txt').val();
            console.log(C_R_score)
            console.log(C_ID)
            console.log(C_R_title)
            console.log(C_R_text)
            $.ajax({
                type: 'POST',
                url: "/app/review/update?C_ID="+C_ID+"&C_R_score="+C_R_score+"&C_R_title="+C_R_title+"&C_R_text="+C_R_text,
                headers : { "content-type": "application/json"},
                success : function (result){
                    let list = "";
                    for(let i=0; i<result.length; i++) {
                        list +=
                            `<div class="my_review">
                                <div class="my_review_item">
                                    <div class="my_review1">캠핑장 ( ${'${result[i].c_name}'} ) 리뷰</div>
                                    <div class="my_review2"> 제목 : ${'${result[i].c_R_title}'}</div>
                                    <div class="my_review3"> 내용 : ${'${result[i].c_R_text}'} </div>
                                </div>
                                <div class="review_item2">
                                    <div class="review2">
                                        <div class="my_review4">방문 날짜: ${'${result[i].r_date}'}</div>
                                        <div class="my_review5">별점  ${'${result[i].c_R_score}'}</div>
                                    </div>
                                    <div class="review-actions">
                                        <button class="edit-btn">수정</button>
                                        <input type="hidden" class="chk_update_cid" value="${'${result[i].c_ID_fk}'}">
                                        <button class="delete-btn">삭제</button>
                                    </div>
                                </div>
                            </div>`
                    }
                    $('#MY_review').html(`<div class="my_h2">MY REVIEW </div>`+list);
                    alert("수정 완료!")
                    $('#backgroundOverlay').css({
                        display: "none",
                    })
                    $('#popupForm').css({
                        display: "none",
                    })
                },
                error : function (){
                    alert("error!")
                }
            })
        })

        $(document).on('click', '.delete-btn', function (){
            // $('.delete-btn').click(function (){
            let C_ID = $(this).parent('.review-actions').children('.chk_update_cid').val()
            console.log(C_ID)
            $.ajax({
                type: 'POST',
                url: "/app/review/deletereview?C_ID="+C_ID,
                headers : { "content-type": "application/json"},
                success : function (result){
                    let list = "";
                    for(let i=0; i<result.length; i++) {
                        list +=
                            `<div class="my_review">
                                <div class="my_review_item">
                                    <div class="my_review1">캠핑장 ( ${'${result[i].c_name}'} ) 리뷰</div>
                                    <div class="my_review2"> 제목 : ${'${result[i].c_R_title}'}</div>
                                    <div class="my_review3"> 내용 : ${'${result[i].c_R_text}'} </div>
                                </div>
                                <div class="review_item2">
                                    <div class="review2">
                                        <div class="my_review4">방문 날짜: ${'${result[i].r_date}'}</div>
                                        <div class="my_review5">별점  ${'${result[i].c_R_score}'}</div>
                                    </div>
                                    <div class="review-actions">
                                        <button class="edit-btn">수정</button>
                                        <input type="hidden" class="chk_update_cid" value="${'${result[i].c_ID_fk}'}">
                                        <button class="delete-btn">삭제</button>
                                    </div>
                                </div>
                            </div>`
                    }
                    $('#MY_review').html(`<div class="my_h2">MY REVIEW </div>`+list);
                }
            })
        })
    })
</script>
<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $('.edit-btn').click(function (){--%>
<%--            $('#backgroundOverlay').css({--%>
<%--                display: "block",--%>
<%--                zIndex: 99999--%>
<%--            })--%>
<%--            $('#popupForm').css({--%>
<%--                display: "block",--%>
<%--                zIndex: 999999--%>
<%--            })--%>
<%--        })--%>
<%--    })--%>
<%--</script>--%>

<script>
    // document.getElementById('openPopupBtn').addEventListener('click', function() {
    //     document.getElementById('backgroundOverlay').style.display = 'block';
    //     document.getElementById('popupForm').style.display = 'block';
    // });

    function closePopup() {
        document.getElementById('backgroundOverlay').style.display = 'none';
        document.getElementById('popupForm').style.display = 'none';
    }

    document.getElementById('backgroundOverlay').addEventListener('click', function() {
        closePopup();
    });

    // document.getElementById('popupForm').addEventListener('submit', function(event) {
    //     alert('리뷰 작성완료');
    //     closePopup();
    //     event.preventDefault();
    // });
</script>

<script>
    const menuItems = document.querySelectorAll('.my_menu_item');
    const mySideContents = document.querySelectorAll('.my_side');

    menuItems.forEach((item, index) => {
        item.addEventListener('click', () => {
            mySideContents.forEach(content => {
                content.classList.remove('active');
            });

            mySideContents[index].classList.add('active');
        });
    });

    // 비밀번호 입력 상태를 확인하는 함수
    function checkPassword() {
        var inputPassword = document.getElementById('input-password').value;
        var correctPassword = '1234'; // 비밀번호가 1234일 경우

        if (inputPassword === correctPassword) {
            // 비밀번호가 맞을 경우
            var editTab = document.getElementById('edit-tab');
            var changeTab = document.getElementById('change-tab');

            editTab.style.display = 'none'; // 편집 탭 숨기기
            changeTab.style.display = 'block'; // 비밀번호 변경 탭 보이기   (아직 안됨)
        }
        else {
            // 비밀번호가 틀릴 경우 틀렸다고 출력하기
            alert('비밀번호가 일치하지 않습니다.');
        }
    }
    // 비밀번호 확인 버튼 클릭 시 checkPassword() 함수 호출
    // var passwordButton = document.getElementById('password-button');
    // passwordButton.addEventListener('click', checkPassword);



    $(document).ready(function (){
        $(document).on('click', '.review-button', function (){
            let thisC_id = $(this).attr("data-cid");
            let thisC_name = $(this).attr("data-cnm");
            let thisC_date = $(this).attr("data-cdt");

            $('.chk_cid').val(thisC_id);
            $('.chk_cname').val(thisC_name);
            $('.chk_R_date').val(thisC_date);

            $('.chk_R_title').val("");
            $('.chk_R_txt').val("");

            console.log(thisC_id +" "+ thisC_name +" "+thisC_date);
            console.log($('.chk_cid').val());

            $('#backgroundOverlay').css({
                display: 'block'
            })
            $('#popupForm').css({
                display: 'block'
            })

            $('.R_update_btn').css({
                display : "none"
            })
            $('.R_write_btn').css({
                display : "block"
            })
        })

        let U_ID = $('#pickUid').attr("data-uid");

        $('#forInfoUpdate').click(function(){
            $('.m_sec').html("");
            // Ajax를 사용하여 특정 URL에서 데이터를 불러와 userInfoUpdateContainer에 삽입
            $('.m_sec').load('/app/mypage/userInfoModify?U_id=' + U_ID);
        });

        $(document).on('click', '.cancel-button', function(){
            let thisC_id = $(this).attr("data-cid");
            let thisU_num = $(this).attr("data-unum");
            let thisC_sdate = $(this).attr("data-csdt");
            let thisC_edate = $(this).attr("data-cedt");
            $.ajax({
                type: 'POST',
                url: '/app/mypage/c_rev_del?C_ID='+thisC_id+'&U_num='+thisU_num+'&startDate='+thisC_sdate+'&endDate='+thisC_edate,
                headers : { "content-type": "application/json"},
                success: function (result){
                    // alert("성공했슈")
                    $('.reserve_body').html(loadReserveCmp(result));
                },
                error : function (){
                    alert("실패했슈")
                }
            })
        })
    })
    let loadReserveCmp = function (result){
        let tmp = "";
        let hasBtn = "";

        result.forEach(function(item){

            tmp += '<div class="mypage-rev">';
            tmp += '    <div class="rev-list_L">';
            tmp += '        <div class="rev-name">캠핑장 이름: '+item.c_name+'</div>';
            tmp += '        <div class="rev-address">'+item.c_region+'</div>';
            tmp += '    </div>';
            tmp += '    <div class="rev-list_R">';
            tmp += '        <div class="rev-details">예약 일자: '+item.c_startDate+' / '+item.c_endDate+'</div>';
            tmp += '        <div class="rev-date">이용 여부 : '+item.reserveYn+'</div>';
            tmp += '        <div class="button_box">';

            if (item.reserveYn === '이용예정'){
                hasBtn = '<button class="button cancel-button"  data-cid="'+item.c_ID+'" data-unum="'+selectUserInfo.u_num+'" data-csdt="'+item.c_startDate+'" data-cedt="'+item.c_endDate+'">예약취소</button>';
            }
            else if(item.reserveYn === '이용완료'){
                hasBtn = '<button class="button review-button" data-cid="'+item.c_ID+'" data-cnm="'+item.c_name+'" data-cdt="'+item.c_startDate+'">리뷰쓰기</button>';
            }
            tmp += hasBtn;
            tmp += '        </div>';
            tmp += '    </div>';
            tmp += '</div>';
        })
        return tmp;
    }
</script>

<script src="<c:url value='/js/header,footer.js'/>"></script>

</body>
</html>