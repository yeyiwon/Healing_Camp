<%@ page  language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="<c:url value='/css/store_common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/store_list.css'/> ">

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<div class="header">
    <div class="logo">
        <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">

        <a href="<c:url value='/'/>" class="logo_a">힐링캠프</a>
    </div>
    <div class="member">
        <div class="mb_menu login">
            <a href="<c:url value='/login/login/'/>" class="mb_menu_a">로그인</a>
        </div>
        <div class="mb_menu join">
            <a href="<c:url value='/join/join/'/>" class="mb_menu_a">회원가입</a>
        </div>
        <div class="mb_menu cart">
            <a href="<c:url value='/store/s_cart/'/>" class="mb_menu_a">장바구니</a>
        </div>
        <div class="mb_menu to_camp_index">
            <a href="<c:url value='/'/>" class="mb_menu_a">캠핑페이지로</a>
        </div>
    </div>
</div>

