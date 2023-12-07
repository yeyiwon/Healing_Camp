<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<c:url value='/css/C_join_common.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/C_login.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">

    <%--                            <button class="goback" aria-label="뒤로가기" onclick="history.back()">--%>
    <%--                                <svg width="24" height="24" viewBox="0 0 24 24" fill="#0E0E0E" xmlns="http://www.w3.org/2000/svg">--%>
    <%--                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M9.21283 3.46978C9.50573 3.17689 9.9806 3.17689 10.2735 3.46978L18.0162 11.2125C18.3091 11.5054 18.3091 11.9802 18.0162 12.2731L10.2735 20.0158C9.9806 20.3087 9.50573 20.3087 9.21283 20.0158C8.91994 19.7229 8.91994 19.248 9.21283 18.9551L16.4252 11.7428L9.21283 4.53044C8.91994 4.23755 8.91994 3.76268 9.21283 3.46978Z" fill="current"></path>--%>
    <%--                                </svg>--%>
    <div class="box">

        <form action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">
            <div id="msg">
                <c:if test="${not empty param.msg}">
                    1<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
                </c:if>
                <c:if test="${not empty msg}">
                    2<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(msg)}</i>
                </c:if>
            </div>

            <div class="login_box">
                <div class="login_L">

                    <div class="login_top">
                        <div class="lt_1">Welcome back! </div>
                        <div class="lt_2">Please log in to access your account</div></div>
                    <div class="login_logo">
                        <a href="<c:url value='/'/>">
                            <img src="<c:url value='/img/Top_btnn.png'/>" alt="">
                        </a>
                    </div>
                    <div class="login_text">
                        <input class="id_pw_text" type="text" name="U_id" value="${ cookie.U_id.value }" placeholder="아이디 입력" autocomplete="off" autofocus >
                        <input class="id_pw_text" type="password" name="U_pw" value="" placeholder="비밀번호" autocomplete="off">
                        <button class="join_complet" tabindex="0">로그인</button>
                        <div class="com_btn">
                            <div class="com_btn1"><input style="height: 18px;width: 18px;margin-right: 10px;" type="checkbox" name="rememberId" ${empty cookie.U_id.value?"":"checked"}>아이디 기억하기 </div>
                            <div class="com_btn1"><a href="<c:url value='/join'/>">회원가입하기</a></div>
                        </div>
                    </div>
                </div>
                <div class="login_R"></div>
            </div>
        </form>
    </div>
</div>

</body>
<script>
    function formCheck(frm) {
        let msg ='';

        if(frm.id.value.length==0) {
            setMessage('id를 입력해주세요.', frm.U_id);
            return false;
        }

        if(frm.pwd.value.length==0) {
            setMessage('password를 입력해주세요.', frm.U_pw);
            return false;
        }

        return true;
    }

    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = ` ${'${msg}'}`;

        if(element) {
            element.select();
        }
    }
</script>
</html>