<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="random" value="${ pageContext.request.getSession(false).getAttribute('randomimg')==null?'':pageContext.request.getSession(false).getAttribute('randomimg')}" />
<c:set var="logInOutLink" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'':pageContext.request.getSession(true).getAttribute('U_id')}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/Camp_DetailPage.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/camp_review.css'/>">
<%-- 카카오 지도 api 키 있는 자리 --%>
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="wrap">
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

<%--            <div class="mb_menu cart">--%>
<%--                <a href="<c:url value='/store/s_cart/'/>" class="mb_menu_a">장바구니</a>--%>
<%--            </div>--%>
            <div class="mb_menu to_camp_index">
                <a href="<c:url value='/store/s_index'/>" class="mb_menu_a">상점페이지로</a>
            </div>
        </div>
    </div>

    <div class="Container">
        <div class="w_1300">
            <div class="map_desc">#Location information</div>
            <div class="CD_main_box">

                <div class="CD_main">
                    <div class="CD_img CD_sildeimg1"><img src="<c:url value='/img/Camp_img/${randomimg}.png'/>" alt=""></div>
                    <div class="CD_img CD_sildeimg2"><img src="<c:url value='/img/Camp_img/${randomimg+1}.png'/>" alt=""></div>
                    <div class="CD_img CD_sildeimg3"><img src="<c:url value='/img/Camp_img/${randomimg+2}.png'/>" alt=""></div>
                    <div class="CD_img CD_sildeimg4"><img src="<c:url value='/img/Camp_img/${randomimg+3}.png'/>" alt=""></div>
                    <div class="CD_img CD_sildeimg5"><img src="<c:url value='/img/Camp_img/${randomimg+4}.png'/>" alt=""></div>

                    <input type="button" value="〈" class="CD_btn Cbtn_L">
                    <input type="button" value="〉" class="CD_btn Cbtn_R">
                    <div class="indis">
                        <!-- <div class="indi indi_active"></div>
                        <div class="indi"></div>
                        <div class="indi"></div>
                        <div class="indi"></div>  -->
                    </div>
                </div>
                <div class="CD_map_box">
                    <div id="map" class="map" style="width:100%;"></div>
                </div>
            </div>

            <div class="CD_Detail">
                <div class="CDD_L">
                    <div class="CD_campName" id="camp_name" data-camp_name="${campdetail.c_name}">${campdetail.c_name}</div>
                    <div class="CD_Number" id="campAddress" data-address=${campdetail.c_region}> 주소 : ${campdetail.c_region}</div>
                    <div class="CD_Address">전화번호 : ${campdetail.c_phone}</div>
                </div>

                <div class="CDD_R">
                    <div class="CDD_R_BOX_top">
                    <div class="CD_SR"><img src="<c:url value='/img/staricon.png'/>"></div>
                    <div class="scorefont"> / ${campdetail.c_score}</div>

                    <%--서영이랑 찜버튼--%>
                    <div class="CD_like_button">
                        <div class="heartBtn liked" id="likeButton" data-C_ID="${campdetail.c_ID}" data-uNum="${sessionScope.Unum_fk}">
                            <img id="wish_heart" src="<c:url value='/img/wish_heart${chkwish}.png'/>" alt="">
                        </div>
                    </div>
                    </div>
<%--                        <form action="/addLike" method="post" id="likeForm">--%>
<%--                            <input type="hidden" name="C_ID" value="${c_detail.getC_ID()}">--%>
<%--                            <input type="hidden" name="U_num_fk" value="${getCurrentUserId(session)}">--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${addlike == 1}">--%>
<%--                                    <div class="heartBtn liked", id="likeButton" data-C_ID="${campdetail.c_ID}" data-uNum="${sessionScope.Unum_fk}">--%>
<%--                                        <img src="<c:url value='/img/Camp_img/wish_heart${addlike}.png'/>" alt="">--%>
<%--                                    </div>--%>
<%--                                </c:when>--%>
<%--                                <c:when test="${addlike == 0}">--%>
<%--                                    <div class="heartBtn not-liked">--%>
<%--                                        <img src="<c:url value='/img/Camp_img/wish_heart0.png'/>" alt="">--%>
<%--                                    </div>--%>
<%--                                </c:when>--%>
<%--                            </c:choose>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                    </div>--%>
                    <div class="CDR_BOX_mid"> 예약가능 자리 :  ${campdetail.c_area} </div>
                    <div class="CDR_BOX_bottom"><button class="reserve_btn" type="button">예약하기</button></div>
                    </div>
                </div>


<%--            CDtail--%>
            <div class="CD_nav">
                <ul class="CD_nav_ul">
                    <li><a href="#CDnav1">캠핑장 정보</a></li>
                    <li><a href="#CDnav2">시설</a></li>
                    <li><a href="#CDnav3">RIVEW</a></li>
                    <li><a href="#CDnav4">FAQ</a></li>
                </ul>
            </div>
<%--            네비게이션바 --%>
            <div id="CDnav1" class="CD_info">
                <div class="h22">#캠핑장 정보 및 소개 글</div>
                <div class="h21_p">${campdetail.c_intro}</div>
            </div>
            <div id="CDnav2" class="CD_fac_list">
                <div class="h22">#시설 안내</div>
                <div class="CD_fac">
                <div class="C_iconimg">
                    <img src="<c:url value='/img/Camp_facimg/icon6.png'/>">
                    <div class="img_desc">Wifi</div>
                </div>
                <div class="C_iconimg">
                    <img src="<c:url value='/img/Camp_facimg/icon2.png'/>">
                    <div class="img_desc">수영장</div>
                </div>
                <div class="C_iconimg">
                    <img src="<c:url value='/img/Camp_facimg/icon3.png'/>">
                    <div class="img_desc">화장실</div>
                </div>
                <div class="C_iconimg">
                    <img src="<c:url value='/img/Camp_facimg/icon4.png'/>">
                    <div class="img_desc">세면대</div>
                </div>
                <div class="C_iconimg">
                    <img src="<c:url value='/img/Camp_facimg/icon5.png'/>">
                    <div class="img_desc">산책로</div>
                </div>
                <div class="C_iconimg">
                    <img src="<c:url value='/img/Camp_facimg/icon1.png'/>">
                    <div class="img_desc">드라이기</div>
                </div>
                <div class="C_iconimg">
                    <img src="<c:url value='/img/Camp_facimg/icon7.png'/>">
                    <div class="img_desc">침대</div>
                </div>
            </div>
            </div>
            <div id="CDnav3" class="CD_review_box">
                <c:forEach var="Camp_reviewDto" begin="0" end="1" items="${campreviewlist}">
                    <div class="CD_REVIEW_container">
                        <div class="CD_review">
                            <img src="<c:url value='/img/Camp_img/53.png'/>" alt="">
                            <h2>${Camp_reviewDto.c_R_title}</h2>
                            <p>${Camp_reviewDto.c_R_text}</p>
                            <div class="CD_user-info">USER_ID: 예이원 | DATE: <fmt:formatDate value="${Camp_reviewDto.c_R_update}" pattern="yyyy-MM-dd" type="date"/></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div id="CDnav4" class="CD_FAQ">
                <div class="h22">#FAQ</div>
                <jsp:include page="FAQ.jsp" flush="false"/>
            </div>
        </div>
<%--            여기가 컨테이너 끝 --%>
        </div>
<%--        <div class="Camptop_btn">올려</div>--%>
    <div class="Camptop_btn"></div>
    <%@include file="/WEB-INF/views/layout/footer.jsp"%>
    </div>
<%--        <jsp:include page="comment.jsp" flush="false"/>--%>


<script src="<c:url value='/js/navfixed.js'/>"></script>
<script src="<c:url value='/js/navscrollpos.js'/>"></script>
<script src="<c:url value='/js/likebtn.js'/> "></script>
<script src="<c:url value='/js/imgslide.js'/> "></script>
<script src="<c:url value='/js/faqAco.js'/> "></script>
<script src="<c:url value='/js/header,footer.js'/> "></script>
<script src="<c:url value='/js/top_btn.js'/> "></script>

<script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng("<c:out value='${campdetail.c_map_x}'/>", "<c:out value='${campdetail.c_map_y}'/>"), // 지도의 중심좌표
            level: 4 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    var imageSrc = "<c:url value='/img/campingicon.png'/>",
        imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng("<c:out value='${campdetail.c_map_x}'/>", "<c:out value='${campdetail.c_map_y}'/>");
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage // 마커이미지 설정
    });
    // ❤
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

</script>
    <script>
        let startDate = "";
        let endDate = "";
        let restArea = ${campdetail.c_area};

        $(document).ready(function () {

            if(restArea === 0){
                $('.reserve_btn').css({
                    backgroundColor: "gray"
                })

            }else{
                $('.reserve_btn').css({
                    backgroundColor: "#468b97"
                })
                $(document).on('click', '.CDR_BOX_bottom', function (){
                    location.href="/app/camp/c_reserve?C_ID="+C_id+"&startDate="+startDate+"&endDate="+endDate;
                })
            }

            const urlParams = new URLSearchParams(window.location.search);
            startDate = urlParams.get("startDate");
            endDate = urlParams.get("endDate");

            // 찜(하트) 버튼 클릭 이벤트
            let C_id =$('.heartBtn').attr("data-C_ID");
            $("#likeButton").click(function () {
                // 여기에서 로그인 상태 확인
                let clike = $(this).attr("data-C_ID");
                console.log("222");

            });



            console.log(${chkwish})
            $('#wish_heart').click(function (){
                console.log("11111")
                $.ajax({
                    type: 'POST',
                    url: '/app/camp/campwishlist_insert?C_ID=${campdetail.c_ID}',
                    headers : { "content-type": "application/json"},
                    success : function (result){
                        console.log(result)
                        if(result == 2){
                            alert("로그인이 필요합니다.")
                        }
                        else if(result == 1 ){
                            $('#wish_heart').attr("src", "<c:url value='/img/wish_heart2.png/'/>")
                        }
                        else if(result == -1){
                            $('#wish_heart').attr("src", "<c:url value='/img/wish_heart1.png/'/>");
                        }
                    },
                    error : function (){
                        alert("error!")
                    }
                })
            })
        });


    </script>

</body>
</html>
