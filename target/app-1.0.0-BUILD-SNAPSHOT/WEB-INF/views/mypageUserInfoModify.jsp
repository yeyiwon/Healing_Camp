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
    <link rel="stylesheet" href="<c:url value='/css/mypageUserinfoModi.css'/> ">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <style>
        .forPassword,
        .forPasswordchk{
            color: #EF6262;
        }
        .hide{
            opacity: 0;
        }
    </style>
</head>
<body>
<div class="m_sec m_userinfo">
    <div class="m_sec_body">
        <form action="<c:url value='/mypage/mypage'/>" method="post" name="userInfoModify">
            <table>
                <tr>
                    <th>아이디</th>
                    <td id="pickUid">
                        <input type="text" name="U_id" value ="${selectUserInfo.u_id}" readonly style="height: 35px; width: 200px; border-radius: 15px">
                    </td>
                </tr>
                <tr>

                    <th>비밀번호</th>
                    <td>
                        <input name="U_pw" id="modifyUpw" type="password" class= value="${selectUserInfo.u_pw}" style="height: 35px; width: 200px; border-radius: 15px">
                    </td>
                </tr>
                <tr>
                    <td class="forPassword hide">비밀번호는 영문&숫자&특수기호 포함하여 8자리 이상 입력하세요</td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td>
                        <input id="modifyUpwchk" type="password" value="${selectUserInfo.u_pw}" style="height: 35px; width: 200px; border-radius: 15px">
                    </td>
                <tr>
                    <td class="forPasswordchk hide">비밀번호가 일치하지 않습니다.</td>
                </tr>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>${selectUserInfo.u_name}</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="text"  id="U_phone" name="U_phone" oninput="autoHyphen(this)" maxlength="13" placeholder="000-0000-0000형식" style="height: 35px; width: 200px; border-radius: 15px" >
                    </td>
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
                    <td>
                        <input name="U_email" id="modifyUemail" type="email" value="${selectUserInfo.u_email}" style="height: 35px; width: 200px; border-radius: 15px">
                    </td>
                </tr>
                <tr>
                    <th>
                        <button type="submit" class="button">변경 사항 저장하기</button>
                    </th>
                    <td>
                        <input id="MO_back" class="MO_back"  type="button" value="돌아가기">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script>
    let passWordVal = "";
    let passWordChkVal = "";
    let phoneVal = $('#modifyUphone').val();
    let emailVal = $('#modifyUemail').val();
    let fieldVal = $('#modifyUfield').val();
    $(document).ready(function(){
        function strongPassword (str) {
            return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
        }

        $(document).on('keyup','#modifyUpw', function(){
            passWordVal = $(this).val();
            console.log(passWordVal)
            if(passWordVal !== 0 && passWordVal.length <= 8){
                if(strongPassword(passWordVal) === false){
                    console.log(strongPassword(passWordVal));
                    $('.forPassword').removeClass('hide');
                }
            }else{
                $('.forPassword').addClass('hide');
            }
        })

        $(document).on('keyup', '#modifyUpwchk', function (){
            passWordChkVal = $(this).val();
            if(passWordVal !== 0){
                if(passWordChkVal !== passWordVal){
                    $('.forPasswordchk').removeClass('hide');
                }else{
                    $('.forPasswordchk').addClass('hide');
                }
            }
        })

        // $('#back').click(function (){
        //     location.href="/app/mypage/userInfo"
        // })

        $(document).on('click', '#MO_back', function (){
            location.href ="/app/mypage/mypage"
        })
    })

    const autoHyphen = (target) => {
        console.log(target.value)
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        console.log(target.value)
    }


</script>
</body>
</html>