<%@ page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>

    <link rel="stylesheet" href="styles.css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style>
    .overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    }

    .container {

    width: 400px;
    /* height: 400px; */

    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    border-radius: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }

    .popup {
    width: 450px;
    height: 450px;
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    border: 1px solid #ccc;
    padding: 20px;
    background-color: #fff;
    z-index: 2;
    }

    .boxboxbox{
    width: 100%;
    display: flex;
    justify-content: center;
    height: 50px;
    align-items: flex-end;
    }

    /* .popup ,
    .popup  {
    display: block;
    margin-bottom: 10px;
    } */

    .popupbtn{
    width: 80px;
    height: 50px;
    border-radius: 30px;
    background: #1D5B79;
    color: #fff;
    }

    .review_txt_box{
    height: 40px;
    width: 300px;
    border-radius: 10px;
    }

    .scoreindex{
    width: 60px;
    border-radius: 15px;
    height: 30px;
    }
    form {
    display: flex;
    flex-direction: column;
    gap: 10px;
    }


    textarea {
    height: 150px;
    /* margin-bottom: 20px; */
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    resize: none;
    }

    /* input[type="submit"] {
    background-color: #1D5B79;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    }

    input[type="submit"]:hover {
    background-color: #141E46;
    } */

    .area1{
    font-size: 17px;
    width: 100px;
    height: 50px;
    display: flex;
    flex-direction: column;
    align-items: center;
    }

    .myp_btn{
    width: 100%;
    height: 50px;
    display: flex;
    justify-content: space-between;
    }

    .btn{
    width: 100px;
    height: 50px;
    border: none;
    border-radius: 20px;
    }

    .btn1{
    color: #fff;
    background: #1D5B79;
    }
    .btn2{
    color: #fff;
    background: #ef6262;
    }
    </style>
</head>
<body>
    <div>
        <c:forEach var="item" items="${selectCampReserve}">
            <div class="M_reserve_chk_box">
                <img src="<c:url value='/img/Camp_img/${item.c_F_image}'/>">
                <div class="M_reserve_chk_txt">
                    <div class="MR_camp_title">${item.c_name}</div>
                    <span class="startDate">${item.c_startDate}</span>
                    <span> ~ </span>
                    <span class="endDate">${item.c_endDate}</span>
                </div>
            </div>
            <div class="MR_useYn">${item.reserveYn}</div>
        </c:forEach>
    </div>
    <button id="openPopupBtn" class="popupbtn">리뷰 쓰기</button>

    <div id="backgroundOverlay" class="overlay"></div>

    <div id="popupForm" class="container">

        <form>

            <label for="title">제목</label>
            <div class="boxboxbox">
                <input type="text" id="title" class="review_txt_box" required>
                <div class="area1">
                    <label for="score">Score</label>
                    <input type="number" id="score" class="scoreindex" min="1" max="5" required>
                </div>
            </div>
            <textarea id="review" placeholder="내용" required></textarea>

            <div class="myp_btn">
                <button type="submit" class="btn btn2">글 쓰기</button>
                <button class="btn btn1" type="button" onclick="closePopup()">취소</button>

            </div>
        </form>
    </div>




    <script>
        document.getElementById('openPopupBtn').addEventListener('click', function() {
            document.getElementById('backgroundOverlay').style.display = 'block';
            document.getElementById('popupForm').style.display = 'block';
        });

        function closePopup() {
            document.getElementById('backgroundOverlay').style.display = 'none';
            document.getElementById('popupForm').style.display = 'none';
        }

        document.getElementById('backgroundOverlay').addEventListener('click', function() {
            closePopup();
        });

        document.getElementById('popupForm').addEventListener('submit', function(event) {
            alert('리뷰 작성완료');
            closePopup();
            event.preventDefault();
        });
    </script>
    <div class="mypage-rev">

        <div class="rev-list_L">
            <div class="rev-name">캠핑장 이름: 12345</div>
            <div class="rev-address">캠핑장 주소</div>
        </div>
        <div class="rev-list_R">
            <div class="rev-details">예약 일자: 2023-11-28</div>
            <div class="rev-date">체크인 / 체크아웃</div>

            <div class="button_box">
                <button class="button review-button">이용 완료 / 리뷰쓰기</button> // 예약 취소하기
            </div>
        </div>
    </div>

</body>
</html>
