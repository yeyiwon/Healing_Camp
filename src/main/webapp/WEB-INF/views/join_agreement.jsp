<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>힐링캠프-회원가입</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <link href="<c:url value='/css/C_join_common.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/C_agreement.css'/>" rel="stylesheet">
</head>
<body>
<div id="wrap">
    <%--    <div class="menu_pan">--%>
    <%--        <div class="menu_op"></div>--%>
    <%--        <div class="pan_area">--%>
    <%--            <div class="pan_line"></div>--%>
    <%--            <div class="pan_name">--%>
    <%--                <div class="pan_icon">--%>
    <%--                    <ul class="pan_back">--%>
    <%--                        <li>--%>
    <%--                            <button class="goback" aria-label="뒤로가기" onclick="history.back()">--%>
    <%--                                <svg width="24" height="24" viewBox="0 0 24 24" fill="#0E0E0E" xmlns="http://www.w3.org/2000/svg">--%>
    <%--                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M9.21283 3.46978C9.50573 3.17689 9.9806 3.17689 10.2735 3.46978L18.0162 11.2125C18.3091 11.5054 18.3091 11.9802 18.0162 12.2731L10.2735 20.0158C9.9806 20.3087 9.50573 20.3087 9.21283 20.0158C8.91994 19.7229 8.91994 19.248 9.21283 18.9551L16.4252 11.7428L9.21283 4.53044C8.91994 4.23755 8.91994 3.76268 9.21283 3.46978Z" fill="current"></path>--%>
    <%--                                </svg>--%>
    <%--                            </button>--%>
    <%--                        </li>--%>
    <%--                    </ul>--%>
    <%--                </div>--%>
    <%--                <p>약관동의</p>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <form class="agr" action="#" method="POST" name="#" enctype="multipart/form-data">
        <h1>가입 약관을 읽고동의해 주세요.</h1>
        <h2>약관 동의</h2>
        <div>
            <div class="all_Consent">
                <label class="all_Consent02">
                    <input type="checkbox" name="agree_all" onClick="agreeCheck(this.form)" class="agree_all">
                    <span>전체동의</span>
                </label>
            </div>
            <div>
                <div class="consent_titl">
                    <div>
                        <label class="consent_menu">
                            <input id="15" type="checkbox" name="agree" class="hidden">
                            <span>서비스 이용약관</span>
                        </label>
                        <strong> (필수)</strong>
                    </div>
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#83898C" xmlns="http://www.w3.org/2000/svg" style="margin-right: -8px;">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M9.77338 7.53033C10.0663 7.23744 10.5411 7.23744 10.834 7.53033L15.0767 11.773C15.3696 12.0659 15.3696 12.5407 15.0767 12.8336L10.834 17.0763C10.5411 17.3692 10.0663 17.3692 9.77338 17.0763C9.48049 16.7834 9.48049 16.3085 9.77338 16.0156L13.4857 12.3033L9.77338 8.59099C9.48049 8.2981 9.48049 7.82322 9.77338 7.53033Z" fill="current"></path>
                    </svg>
                </div>
                <div class="consent_titl">
                    <div>
                        <label class="consent_menu">
                            <input id="14" type="checkbox" name="agree" class="hidden">
                            <span>개인정보 수집 및 이용 동의</span>
                        </label>
                        <strong> (필수)</strong>
                    </div>
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#83898C" xmlns="http://www.w3.org/2000/svg" style="margin-right: -8px;">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M9.77338 7.53033C10.0663 7.23744 10.5411 7.23744 10.834 7.53033L15.0767 11.773C15.3696 12.0659 15.3696 12.5407 15.0767 12.8336L10.834 17.0763C10.5411 17.3692 10.0663 17.3692 9.77338 17.0763C9.48049 16.7834 9.48049 16.3085 9.77338 16.0156L13.4857 12.3033L9.77338 8.59099C9.48049 8.2981 9.48049 7.82322 9.77338 7.53033Z" fill="current"></path>
                    </svg>
                </div>
                <div class="consent_titl">
                    <div>
                        <label class="consent_menu">
                            <input id="11" type="checkbox" name="agree" class="hidden">
                            <span>개인정보 제 3자 제공 동의</span>
                        </label>
                        <strong> (필수)</strong>
                    </div>
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#83898C" xmlns="http://www.w3.org/2000/svg" style="margin-right: -8px;">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M9.77338 7.53033C10.0663 7.23744 10.5411 7.23744 10.834 7.53033L15.0767 11.773C15.3696 12.0659 15.3696 12.5407 15.0767 12.8336L10.834 17.0763C10.5411 17.3692 10.0663 17.3692 9.77338 17.0763C9.48049 16.7834 9.48049 16.3085 9.77338 16.0156L13.4857 12.3033L9.77338 8.59099C9.48049 8.2981 9.48049 7.82322 9.77338 7.53033Z" fill="current"></path>
                    </svg>
                </div>
                <div class="consent_titl">
                    <div>
                        <label class="consent_menu">
                            <input id="12" type="checkbox" name="agree" class="hidden">
                            <span>만 14세 이상입니다.</span>
                        </label>
                        <strong> (필수)</strong>
                    </div>
                </div>
                <p class="misung">*미성년자는 서비스 이용이 불가합니다.</p>
                <div class="consent_titl">
                    <div>
                        <label class="consent_menu"><input id="13" type="checkbox" name="optionalPrivacyAgreement" class="hidden">
                            <span>개인정보 수집 및 이용 동의</span>
                        </label> (선택)
                    </div>
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#83898C" xmlns="http://www.w3.org/2000/svg" style="margin-right: -8px;">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M9.77338 7.53033C10.0663 7.23744 10.5411 7.23744 10.834 7.53033L15.0767 11.773C15.3696 12.0659 15.3696 12.5407 15.0767 12.8336L10.834 17.0763C10.5411 17.3692 10.0663 17.3692 9.77338 17.0763C9.48049 16.7834 9.48049 16.3085 9.77338 16.0156L13.4857 12.3033L9.77338 8.59099C9.48049 8.2981 9.48049 7.82322 9.77338 7.53033Z" fill="current"></path>
                    </svg>
                </div>
                <div class="consent_titl">
                    <div>
                        <label class="consent_menu">
                            <input id="9" type="checkbox" name="marketing" class="hidden">
                            <span>이벤트/마케팅 수신 동의</span>
                        </label> (선택)
                    </div>
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#83898C" xmlns="http://www.w3.org/2000/svg" style="margin-right: -8px;">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M9.77338 7.53033C10.0663 7.23744 10.5411 7.23744 10.834 7.53033L15.0767 11.773C15.3696 12.0659 15.3696 12.5407 15.0767 12.8336L10.834 17.0763C10.5411 17.3692 10.0663 17.3692 9.77338 17.0763C9.48049 16.7834 9.48049 16.3085 9.77338 16.0156L13.4857 12.3033L9.77338 8.59099C9.48049 8.2981 9.48049 7.82322 9.77338 7.53033Z" fill="current"></path>
                    </svg>
                </div>
            </div>
        </div>
        <div class="consent_next">
            <input class="consent_next_btn" type="button"  name="checkButton" value="등록하기" onclick="location.href='<c:url value='/join/j_membership/save'/>'" disabled/>
        </div>
    </form>
</div>
<script type="text/javascript" src="<c:url value='/js/C_agreement.js'/>"></script>
</body>
</html>