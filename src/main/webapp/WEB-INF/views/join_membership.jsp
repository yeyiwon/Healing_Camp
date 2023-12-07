<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="java.net.URLDecoder" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <title>힐링캠프-회원가입</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value='/css/C_join_common.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/C_join_membership.css'/>">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<%--    <div id="wrap">--%>
<%--        <div class="menu_pan">--%>
<%--            <div class="menu_op"></div>--%>
<%--            <div class="pan_area">--%>
<%--                <div class="pan_line"></div>--%>
<%--                <div class="pan_name">--%>
<%--                    <div class="pan_icon">--%>
<%--                        <ul class="pan_back">--%>
<%--                            <li>--%>
<%--                                <button class="goback" aria-label="뒤로가기" onclick="history.back()">--%>
<%--                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#0E0E0E" xmlns="http://www.w3.org/2000/svg">--%>
<%--                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M9.21283 3.46978C9.50573 3.17689 9.9806 3.17689 10.2735 3.46978L18.0162 11.2125C18.3091 11.5054 18.3091 11.9802 18.0162 12.2731L10.2735 20.0158C9.9806 20.3087 9.50573 20.3087 9.21283 20.0158C8.91994 19.7229 8.91994 19.248 9.21283 18.9551L16.4252 11.7428L9.21283 4.53044C8.91994 4.23755 8.91994 3.76268 9.21283 3.46978Z" fill="current"></path>--%>
<%--                                    </svg>--%>
<%--                                </button>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                    <p>회원가입</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<div class="join_pong">
    <form  action="<c:url value="/join/j_membership/save" />"  method="POST" onsubmit="return formCheck(this)">
        <div class="join_pormet1">
            <div class="join_pormet_fontm">회원정보입력해주세요</div>
            <div class="join_pormet_in">
                <!-- 아이디 입력 -->
                <span>
                    <label for="" name="U_id" class="required typography-footnote">아이디</label>
                    <input placeholder="아이디" id="U_id" name="U_id" type="text" minlength="4" maxlength="12" autofocus onkeyup="idCheck(this)">
                </span>
                <div class="hide_msg">
                    <div class="success-message hide">사용할 수 있는 아이디입니다</div>
                    <div class="failure-message hide">아이디는 4~12글자이어야 합니다</div>
                    <div class="failure-message2 hide">영어 또는 숫자만 가능합니다</div>
                </div>

                <!-- 비밀번호/비밀번호 확인 -->
                <span>
                    <label for="" class="required typography-footnote">비밀번호</label>
                    <input placeholder="8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&) 포함" id="password" name="U_pw" type="password" minlength="8">
                <p class="typography-footnote"></p>
                </span>
                <div class="strongPassword-message hide">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요</div>
                <span>
                    <input placeholder="비밀번호 확인" id="password-retype" type="password" minlength="8">
                    <p class="typography-footnote"></p>
                </span>
                <div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>

                <!-- 이름 -->
                <span>
                    <label for="" class="required typography-footnote">이름</label>
                    <input placeholder="이름" id="U_name" name="U_name" type="text">
                    <p class="typography-footnote"></p>
                </span>

                <!-- 전화번호 -->
                <span>
                    <label for="" class="required typography-footnote">전화번호</label>
                    <input type="text"  id="U_phone" name="U_phone" oninput="autoHyphen(this)" maxlength="13" placeholder="000-0000-0000형식">
                    <p class="typography-footnote"></p>
                </span>

            </div>
        </div>
        <div class="join_pormet2">
            <!-- 생년월일 -->
            <div class="bord">
                <label for="" name="birth" class="required typography-footnote">생년월일</label>
                <p class="typography-footnote"></p>
                <input type="date" class="inputDate" id="datepicker1" name="U_birth" pattern="\d{4}-\d{2}-\d{2}" />
                <span class="validity"> </span>
            </div>
            <!-- 성별 -->
            <div class="bord">
                <label for="" class="required typography-footnote">성별</label>
                <p class="typography-footnote"></p>
                <div class="gender">
                    <label><input type="radio" name="U_gender" value="0">남자</label>
                    <label><input type="radio" name="U_gender" value="1">여자</label>
                    <label><input type="radio" name="U_gender" value="2" checked>선택안함</label>
                </div>
            </div>

            <!-- 이메일 -->
            <div class="bord">
                <label for="" class="required typography-footnote">이메일</label>
                <input placeholder="이메일" id="U_email" name="U_email" type="email" class="input_box">
                <p class="typography-footnote"></p>
            </div>
            <div class="bord">
                <!-- 선호지역 -->
                <label for="" class="required typography-footnote">선호지역</label>
                <p class="typography-footnote"></p>
                <div class="field_select">
                    <label><input type="checkbox" name="U_field" value="강원도">강원도</label>
                    <label><input type="checkbox" name="U_field" value="경기도">경기도</label>
                    <label><input type="checkbox" name="U_field" value="경상남도">경상남도</label>
                    <label><input type="checkbox" name="U_field" value="경상북도">경상북도</label>
                    <label><input type="checkbox" name="U_field" value="대구">대구</label>
                    <label><input type="checkbox" name="U_field" value="인천">인천</label>
                    <label><input type="checkbox" name="U_field" value="전라남도">전라남도</label>
                    <label><input type="checkbox" name="U_field" value="전라북도">전라북도</label>
                    <label><input type="checkbox" name="U_field" value="제주특별자치도">제주특별자치도</label>
                    <label><input type="checkbox" name="U_field" value="충청남도">충청남도</label>
                    <label><input type="checkbox" name="U_field" value="충청북도">충청북도</label>
                </div>
            </div>
            <div class="bottom_bar"></div>
            <div class="join_com_btn">
                <button type="submit" class="join_complet" ></button>
            </div>
        </div>


    </form>
</div>
</body>

<script type="text/javascript" src="<c:url value='/js/C_member.js'/>"></script>
<script>
    // 전화번호
    const autoHyphen = (target) => {
        console.log(target.value)
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        console.log(target.value)
    }

    // 빈칸 체크
    function check_onclick(){
        theForm=document.frm1;
        if(theForm.U_id.value=="") {
            alert("아이디 입력란이 비어있습니다.")
            return theForm.U_id.focus();
        }
        if(theForm.U_pw.value=="") {
            alert("비밀번호 입력란이 비어있습니다.")
            return theForm.U_pw.focus();
        }
        if(theForm.U_name.value=="") {
            alert("이름 입력란이 비어있습니다.")
            return theForm.U_name.focus();
        }
        if(theForm.U_birth.value=="") {
            alert("생년월일을 선택해주세요.")
            return theForm.U_birth.focus();
        }
        if(theForm.U_email.value=="") {
            alert("이메일 입력란이 비어있습니다.")
            return theForm.U_email.focus();
        }
        if(theForm.U_phone.value=="") {
            alert("전화번호 입력란이 비어있습니다.")
            return theForm.U_phone.focus();
        }
        theForm.submit();
    }
</script>
<script>
    const idCheck = () => {
        const U_id = document.getElementById("U_id").value;
        console.log("입력값: ", U_id);
        $.ajax({
            type:"post",
            url: "/join/j_membership/save",
            date: {
                "U_id": U_id
            },
            success: function(res) {
                console.log("요청", res)
            },
            error: function(err) {
                console.log("에러", err)
            }
        })
    }
</script>
</html>

