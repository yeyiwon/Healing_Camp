<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프-회원가입</title>
    <link href="<c:url value='/css/C_join_common.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/C_join_completed.css'/>" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="wrap">
    <div class="join_complet_box22">
        <div class="join_cong22">
            <div class="conc_img">
                <img src="<c:url value='/img/concccc.png'/>">
            </div>
            <h1>회원가입 완료!</h1>
            <div class="join_com_btn">
                <input type="button" class="join_complet22" value="홈으로" onclick="location.href=<c:url value='/'/>">
            </div>
        </div>
    </div>
</div>
</body>
</html>
