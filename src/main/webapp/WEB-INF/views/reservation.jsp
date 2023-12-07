<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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



<div class="background-container">
<%--    <img src="img/5.png" alt="">--%>
</div>

<div class="reservation-container">

    <div class="rev_header">
        #Reservation
        <p id="selectedLocation"></p>
        <p id="selectedDates"></p>
    </div>


    <div class="calendar-container">
        <div id="calendar"></div>
    </div>
    <div class="reservation-details">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" placeholder="예약자 이름">
        <button class="submit-button" onclick="reserve()">예약하기</button>
    </div>
</div>
<script>
    $(document).ready(function () {
        // 달력 설정
        $("#calendar").datepicker({
            onSelect: function (dateText) {
                // 선택한 날짜를 출력
                $("#selectedDates").text("CHECK IN / OUT: " + dateText);
            }
        });

        // 예약 페이지로부터 받아온 데이터 (예시)
        var selectedLocation = "camp_name";
        var selectedCheckin = "2023-11-29";
        var selectedCheckout = "2023-11-30";

        // 선택한 장소와 체크인/체크아웃 날짜를 출력
        $("#selectedLocation").text("선택한 장소: " + selectedLocation);
        $("#selectedDates").text("CHECK IN : " + selectedCheckin + " CHECK OUT :  " + selectedCheckout);

        document.addEventListener('DOMContentLoaded', function () {
            // 캘린더 초기화 함수 호출x
            initializeCalendar();
        });

        function initializeCalendar() {
            // 현재 날짜 가져오기
            var currentDate = new Date();

            // 다음 달로 이동
            var nextMonthDate = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 1);

            // 캘린더에 데이터 로드
            loadCalendarData(nextMonthDate);
        }

        function loadCalendarData(date) {
            // 여기에서 다음 달에 대한 데이터를 가져와서 캘린더에 표시하는 로직을 작성
            // 예: 서버에서 데이터 가져오기, 데이터 구조에 따라 동적으로 HTML 생성 등
        }
    });


</script>
    </body>
</html>
