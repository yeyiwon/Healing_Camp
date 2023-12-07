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
    <link rel="stylesheet" href="<c:url value='/css/C_reservation.css'/> ">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="wrap">
    <div class="rev_page">
        <div class="rev_L">
            <h2 class="reserv_desc_h2">#Reservation</h2>
            <div class="reserv_desc">
                <div class="rev_1">예약 확인
                    <p>고객님의 예약 정보와 숙소에 대한 간략한 안내입니다.</p>
                </div>
                <div class="user_check_list">
                    <div class="checklist_box">
                        <div class="rev2">--- ${C_info.c_name} ---</div>
                        <div class="rev">주소 : ${C_info.c_region}</div>
                    </div>
                    <div class="checklist_box">
                        <div class="rev2">예약자 성함 : ${U_info.u_name}</div>
                        <div class="rev">예약자 이메일 : ${U_info.u_email}</div>
                    </div>
                    <div class="checklist_box_bot">
                        <div class="bot_R">
                            <div class="rev">CHECK IN</div>
                            <div class="rev2 startDate"></div>
                        </div>
                        <div class="rev2"> ~ </div>
                        <div class="bot_L">
                            <div class="rev">CHECK OUT</div>
                            <div class="rev2 endDate"></div>
                        </div>
                    </div>
                    <div class="checklist_price">
                        <div class="rev">결제 금액 : <fmt:formatNumber value="${C_info.c_Price}" pattern="#,###"/>원 </div>
                        <div class="rev_button">
                            <button onclick="go()">결제하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="rev_R">
            <div class="opacity_cover_box"></div>
        </div>
    </div>


</div>

<script>
    let startDate = "";
    let endDate = "";
    $(document).ready(function(){
        const urlParams = new URLSearchParams(window.location.search);
        startDate = urlParams.get("startDate");
        endDate = urlParams.get("endDate");

        $('.startDate').html(startDate);
        $('.endDate').html(endDate);
    })
    let C_id = ${C_info.c_ID};
    function go() {
        alert('결제 페이지로 이동합니다.');
        console.log(C_id)
        console.log(startDate +" "+endDate);
        $.ajax({
            type: 'POST',
            url: '/app/camp/c_reserve?C_ID='+C_id+'&startDate='+startDate+'&endDate='+endDate,
            headers : { "content-type": "application/json"},
            success: function (result){
                // alert("성공했슈"+ result)
                // $('.reserve_body').html(loadReserveCmp(result));
            },
            error : function (){
                // alert("실패했슈")
            }
        })
    }
</script>

</body>
</html>