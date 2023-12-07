<%@ page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/mypage.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/mypageUserInfo.css'/> ">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<div class="m_sec m_userinfo">
    <div class="m_sec_header">
        회원 정보 확인
    </div>
    <div class="m_sec_body">
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
</div>
<script>
    $(document).ready(function (){
        let U_ID = $('#pickUid').attr("data-uid");

        $('#forInfoUpdate').click(function(){
            $('.m_userinfo').html("");
            // Ajax를 사용하여 특정 URL에서 데이터를 불러와 userInfoUpdateContainer에 삽입
            $('.m_userinfo').load('/app/mypage/userInfoModify?U_id=' + U_ID);
        });
    });


    // $(document).ready(function (){
    //     let U_ID = $('#pickUid').attr("data-uid");
    //     console.log(U_ID)
    //     $('#forInfoUpdate').click(function(){
    //         // location.href='/app/mypage/userInfoModify?U_id='+U_ID
    //         $('#updateUserInfoBtn').load('/app/mypage/userInfoModify?U_id=' + U_ID);
    //     })
    // })
</script>
</body>
</html>
