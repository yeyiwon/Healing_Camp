<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'':pageContext.request.getSession(true).getAttribute('U_id')}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 정보</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- 모두 공통 css -->
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <!-- 상점 nav css -->
    <link rel="stylesheet" href="<c:url value='/css/store_common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/s_detail.css'/>">

</head>
<body>
<div id="wrap">

    <!-- 헤더 -->
    <div class="header">
        <div class="logo">
            <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
            <span>Store</span>
            <a href="<c:url value='/store/s_index/'/>" class="logo_a">힐링캠프</a>
        </div>
        <div class="member">
            <div class="mb_menu login">
                <a href="<c:url value='${ logInOutLink }' />" class="mb_menu_a">${ logInOutTxt }</a>
            </div>
            <div class="mb_menu join">
                <c:if test="${empty userId }">
                    <a href="<c:url value='/join'/>" class="mb_menu_a">회원가입</a>
                </c:if>
                <c:if test="${not empty userId }">
                    <a href="<c:url value='/mypage/mypage'/>" class="mb_menu_a">마이페이지</a>
                </c:if>
            </div>
            <div class="mb_menu cart">
                <a href="<c:url value='/store/s_cart/'/>" class="mb_menu_a">장바구니</a>
            </div>
            <div class="mb_menu to_camp_index">
                <a href="<c:url value='/'/>" class="mb_menu_a">캠핑페이지로</a>
            </div>
        </div>
    </div>
    <!-- 네비 -->
    <div class="s_nav">
        <div class="s_nav_menu_box">
            <div class="s_nav_menu s_nav_menu1">
                <a href="<c:url value='/store/s_list?menu=I_ID'/>" class="s_nav_menu_a">전체</a>
            </div>
            <div class="s_nav_menu s_nav_menu2">
                <a  href="<c:url value='/store/s_list?menu=I_sell_cnt'/>" class="s_nav_menu_a">BEST</a>
            </div>
            <div class="s_nav_menu s_nav_menu3">
                <a  href="<c:url value='/store/s_brand'/>" class="s_nav_menu_a">BRAND</a>
            </div>
            <div class="s_nav_menu s_nav_menu4">
                <a  href="<c:url value='/'/>" class="s_nav_menu_a">ABOUTUS</a>
            </div>
        </div>
        <div class="s_search">
            <select id="sel_filter">
                <option value='N' ${param.option == 'N'? "selected":""}>상품명</option>
                <option value='B' ${param.option == 'B'? "selected":""}>브랜드명</option>
            </select>
            <input type="text" id="s_search_text" class="s_search_text" placeholder="검색어를 입력하세요" value="${param.keyword}">
            <img src="<c:url value='/img/search_icon.png/'/>" alt="서치아이콘" id="s_search_icon" class="s_search_icon">
        </div>
    </div>
    <main class="main w_1300">
        <section class="DP_top">
            <article class="DP_top_L">
                <div class="DP_item_img">
                    <img src="<c:url value='/img/item_img/${itemDto.i_img_URL}/'/>" alt="">
                </div>
            </article>
            <article class="DP_top_R">
                <div class="DP_item_info">
                    <div class="DP_item_brand">${itemDto.i_company}</div>
                    <div class="DP_item_title">${itemDto.i_name}</div>
                    <div class="DP_item_price">
                        <div class="DP_item_o_price">${itemDto.i_O_price}</div>
                        <div class="DP_item_s_price">${itemDto.i_S_Price}</div>
                    </div>
                    <div class="DP_info_box">
                        <div class="DP_info DP_info1">
                            <div class="DP_info_title">브랜드</div>
                            <div class="DP_info_txt">${itemDto.i_company}</div>
                        </div>
                        <div class="DP_info DP_info2">
                            <div class="DP_info_title">배송방법</div>
                            <div class="DP_info_txt">택배</div>
                        </div>
                        <div class="DP_info DP_info3">
                            <div class="DP_info_title">배송비</div>
                            <div class="DP_info_txt">5,000원</div>
                        </div>
                    </div>
                </div>
                <div class="DP_item_order_count">
                    <div class="order_title">
                        ${itemDto.i_name}
                    </div>
                    <div class="order_count_box">
                        <div class="order_count_btn order_count_btn_minus">-</div>
                        <input type="number" min="1" value="1" class="order_count">
                        <div class="order_count_btn order_count_btn_plus">+</div>
                        <%--                        <div class="order_price">449,000원</div>--%>
                    </div>
                </div>
                <div class="DP_total_price_box">
                    <div class="DP_total_price_title">총 상품금액</div>
                    <div class="DP_total_price">
                        <span class="span1">449,000원</span>
                        <span class="span2">(1개)</span>
                    </div>
                </div>
                <div class="DP_btn_box">
                    <div class="DP_btn DP_btn_add_wishlist">
                        <img id="wish_heart" src="<c:url value='/img/wish_heart${chkwish}.png/'/>" alt="">
                    </div>
                    <div class="DP_btn DP_btn_add_cartlist">
                        <img src="<c:url value='/img/cart_icon.png/'/>" alt="">
                    </div>
                    <div class="DP_btn DP_btn_order_now">바로구매</div>
                </div>
            </article>
        </section>
        <section class="DP_bot">
            <ul class="DP_bot_nav">
                <li class="DP_bot_nav_li_1">
                    <a href="#item_detail">제품상세</a>
                </li>
                <li class="DP_bot_nav_li_2">
                    <a href="#shopping_guide">
                        상품구매안내</a>
                </li>
                <li class="DP_bot_nav_li_3">
                    <a href="#DP_QA">FAQ</a>
                </li>
                <li class="DP_bot_nav_li_4">
                    <a href="#DP_review">REVIEW</a>
                </li>
            </ul>
            <div class="w_1300">
                <article id="item_detail">
                    <img src="<c:url value='/img/상세페이지1.jpg/'/>" alt="">
                    <aside class="side_order_box">
                        <div class="side_order_box_article1">
                            <div class="side_order_box_item_name">
                                ${itemDto.i_name}
                            </div>
                        </div>
                        <div class="side_order_box_article2">
                            <div class="side_order_count_btn order_count_btn_minus">-</div>
                            <input type="number" min="1" value="1" class="order_count">
                            <div class="side_order_count_btn order_count_btn_plus">+</div>
                            <%--                            <div class="side_order_price">${itemDto.i_S_Price}원</div>--%>
                        </div>
                        <div class="side_order_box_article3">
                            <span class="span1">총 상품금액</span>
                            <span class="span2">449,000원</span>
                        </div>
                        <div class="side_order_box_article4">
                            <input type="button" value="장바구니" class="side_order_box_btn side_order_box_btn_cart">
                            <input type="button" value="바로 구매" class="side_order_box_btn side_order_box_btn_buy">
                        </div>
                    </aside>
                </article>
                <article id="shopping_guide">
                    <div class="DP_bot_article_title">
                        <div class="DP_nav_title">상품구매안내</div>
                    </div>
                    <div class="shopping_guide_article1">
                        <h3>결제안내</h3>
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <th>결제 안내</th>
                                <td>
                                    <p>결제안내고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.</p>
                                    <p>확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.</p>
                                    <p>무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.</p>
                                    <p>주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="shopping_guide_article2">
                        <h3>배송 안내</h3>
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <th>배송 방법</th>
                                <td>택배</td>
                            </tr>
                            <tr>
                                <th>배송 지역</th>
                                <td>전국</td>
                            </tr>
                            <tr>
                                <th>배송 비용</th>
                                <td>무료</td>
                            </tr>
                            <tr>
                                <th>배송 기간</th>
                                <td>1일 ~ 2일</td>
                            </tr>
                            <tr>
                                <th>배송 안내</th>
                                <td>
                                    <p>산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.</p>
                                    <p>고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다.</p>
                                    <p>다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="shopping_guide_article3">
                        <h3>교환/반품 안내</h3>
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <th>교환/반품 안내</th>
                                <td>
                                    <p>교환 및 반품 주소</p>
                                    <p>- 경기도 안양시 동안구 관악대로366, 3층</p>
                                    <br>
                                    <p>교환 및 반품이 가능한 경우</p>
                                    <p>- 계약내용에 관한 서면을 받은 날부터 7일. 단, 그 서면을 받은 때보다 재화등의 공급이 늦게 이루어진 경우에는 재화등을 공급받거나 재화등의 공급이 시작된 날부터 7일 이내</p>
                                    <p>- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날 부터 3월이내, 그사실을 알게 된 날 또는 알 수 있었던 날부터 30일이내</p>
                                    <br>
                                    <p>교환 및 반품이 불가능한 경우</p>
                                    <p>- 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)</p>
                                    <p>- 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</p>
                                    <p>- 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우</p>
                                    <p>- 복제가 가능한 재화등의 포장을 훼손한 경우</p>
                                    <p>- 개별 주문 생산되는 재화 등 청약철회시 판매자에게 회복할 수 없는 피해가 예상되어 소비자의 사전 동의를 얻은 경우</p>
                                    <p>- 디지털 콘텐츠의 제공이 개시된 경우, (다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우 제공이 개시되지 아니한 부분은 청약철회를 할 수 있습니다.)</p>
                                    <br>
                                    <p>*고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.</p>
                                    <p>(색상 교환, 사이즈 교환 등 포함)</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="shopping_guide_article4">
                        <h3>서비스문의</h3>
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <th>서비스문의 안내</th>
                                <td>
                                    <p>고객센터 정보</p>
                                    <p>- 전화 : 070-1234-1234</p>
                                    <p>- 이메일 : abcd11@naver.com</p>
                                    <p>- 평일 : 11:00 ~ 17:00 (주말 및 공휴일은 휴무)</p>
                                    <p>- 점심시간 : 12:30 ~ 13:30</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </article>
                <article id="DP_QA">
                    <div class="DP_bot_article_title">
                        <div class="DP_nav_title">FAQ</div>
                        <div class="DP_FAQ_container">
                            <div class="DP_faq-item">
                                <div class="DP_faq-title"><h2>1. 주문과 결제 관련 질문 </h2></div>
                                <div class="DP_faq-content">
                                    <p>Q: 어떻게 주문을 할 수 있나요?<br>
                                        A: 당사의 웹사이트에서 제품을 선택한 후 쇼핑카트에 담아 주문할 수 있습니다. 또는 전화로 주문도 가능합니다.</p>
                                    <p>Q: 어떤 결제 방법이 제공되나요?<br>
                                        A: 신용카드, 직불카드, 페이팔 등 다양한 결제 수단을 통해 결제할 수 있습니다.</p>
                                </div>
                            </div>

                            <div class="DP_faq-item">
                                <div class="DP_faq-title"><h2>2. 배송과 반품 관련 질문:</h2></div>
                                <div class="DP_faq-content">
                                    <p>Q: 제품은 얼마나 빨리 배송되나요?<br>
                                        A: 주문 일로부터 보통 1-3일 이내에 배송됩니다. 특별한 경우에는 배송 시간이 달라질 수 있습니다.</p>
                                    <p>Q: 제품이 마음에 들지 않을 경우 어떻게 반품할 수 있나요?<br>
                                        A: 제품을 30일 이내에 무료로 반품할 수 있습니다. 반품 절차에 대한 자세한 내용은 고객 서비스 페이지를 참조해주세요.</p>
                                </div>
                            </div>

                            <div class="DP_faq-item">
                                <div class="DP_faq-title"><h2>3. 상품 및 재고 관련 질문:</h2></div>
                                <div class="DP_faq-content">
                                    <p>Q: 품절된 상품은 어떻게 확인할 수 있나요?<br>
                                        A: 품절 상품은 제품 페이지에서 표시됩니다. 재고가 다시 입고되면 고객에게 알림을 보내드립니다.</p>
                                    <p>Q: 상품의 품질에 대해 어떤 보장이 제공되나요?<br>
                                        A: 당사는 모든 제품에 대해 만족스러운 품질을 제공하기 위해 노력하며, 불량 제품의 경우 교환이나 환불이 가능합니다.</p>
                                </div>
                            </div>

                            <div class="DP_faq-item">
                                <div class="DP_faq-title">
                                    <h2>4. 캠핑장 이용료는 어떻게 결제하나요?</h2>
                                </div>
                                <div class="DP_faq-content">
                                    <p>캠핑장 이용료는 온라인 예약 시 신용카드 또는 기타 전자 결제 수단을 통해 결제할 수 있습니다.</p>
                                </div>
                            </div>
                        </div>
                        <%--                    여기 부터 작업 --%>
                    </div>
                </article>
                <article id="DP_review">
                    <div class="DP_bot_article_title">
                        <div class="DP_nav_title">REVIEW </div>
                        <c:forEach var="Item_reviewDto" begin="0" end="1" items="${itemreviewlist}">
                            <div class="CP_REVIEW_container">
                                <div class="CP_review">
                                    <img src="<c:url value='/img/Camp_img/3.png'/>" alt="">
                                    <h2>${Item_reviewDto.i_R_title}</h2>
                                    <p>${Item_reviewDto.i_R_text}</p>
                                    <div class="CP_user-info">USER_ID: 예이원 | DATE: <fmt:formatDate value="${Item_reviewDto.i_R_update}" pattern="yyyy-MM-dd" type="date"/></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>



                    <%--                  리뷰 포이치       --%>
                    <%--                        <c:forEach var="camp_rv_list" begin="1" end="2" items="${}">--%>
                    <%--                        <jsp:include page="camp_review.jsp" flush="false"/>--%>
                    <%--                        </c:forEach>--%>


                </article>

            </div>
        </section>
    </main>
    <div class="Camptop_btn"></div>
    <!-- 푸터 -->
    <div class="footer">
        <div class="w_1300 f_content_area">
            <div class="footer_top">
                <ul>
                    <li>
                        <a href="#" class="f_t_li">회사소개</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">개인정보 처리방침</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">청소년 보호 정책</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">서비스이용약관</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">위치정보이용약관</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">전자금융거래 이용약관</a>
                    </li>
                    <li>
                        <a href="#" class="f_t_li">전자금융거래 이용자 유의사항</a>
                    </li>
                </ul>
            </div>
            <div class="footer_bottom">
                <div class="f_b_L">
                    <div class="logo">
                        <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
                        <a href="<c:url value='/'/>" class="logo_a">힐링캠프</a>
                    </div>
                    <div class="f_b_L_phone">
                        <h3>고객센터</h3>
                        <h1>1644-0000</h1>
                        평일 09:00~18:00 / 점심시간 12:00~13:00
                    </div>
                </div>
                <div class="f_b_R">
                    <h2>힐링캠프</h2>
                    <div class="f_b_R_txt">
                        대표 : OOO | 사업자 등록번호 : OOO-OO-OOOOOO |
                        통신판매업 신고 : OO-OOOOO호 | 메일 : healing_camp@heling.com |
                        관광사업자 등록번호 : 제 OOOO-OO호 | 주소 : 서울시 서울구 서울동 123-12 |
                    </div>
                    <div class="f_b_R_txt2">
                        호스팅서비스 제공자 : 힐링캠프
                        COPYRIGHT ⓒ HEALINGCAMP ALL RIGHTS RESERVED.
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--    <div class="top_btn">Top</div>--%>
</div>
<script src="<c:url value='/js/top_btn.js'/> "></script>
<%--<script src="<c:url value='/js/header,footer.js'/>"></script>--%>
<script src="<c:url value='/js/s_detail.js'/>"></script>
<script>
    $(document).ready(function() {
        $('#s_search_icon').on("click", function (){
            location.href = "<c:url value='/store/s_list'/>?page=0&option="+$('#sel_filter').val()+"&keyword="+$('#s_search_text').val().trim();
        })
        $('#s_search_text').on("keydown", function(e){
            if(e.keyCode === 13){
                $('#s_search_icon').trigger('click');
            }
        })

        $(document).on('click', '.DP_btn_add_cartlist', function () {
        // $('.DP_btn_add_cartlist').click(function (){

            $.ajax({
                type: 'POST',
                url: '/app/store/cart_insert?I_ID=${itemDto.i_ID}&Item_cart_cnt='+$('.order_count').val(),
                headers : { "content-type": "application/json"},
                // dataType : 'json',
                // data: JSON.stringify(),
                success : function (result){
                    console.log(result)
                    if(result == 2){
                        alert("로그인이 필요합니다.")
                    }
                    else if(result == 1 ){
                        alert("장바구니에 추가되었습니다.")
                    }
                    else if(result == -1){
                        alert("이미 추가된 상품 입니다.")
                    }
                },
                error : function (){
                    alert("error!")
                    // window.location = "http://localhost:8080/app/login/login"
                }
            })
        })
        $(document).on('click', '.DP_btn_add_wishlist', function () {
        // $('.DP_btn_add_wishlist').click(function (){

            $.ajax({
                type: 'POST',
                url: '/app/store/itemwishlist_insert?I_ID=${itemDto.i_ID}',
                headers : { "content-type": "application/json"},
                // dataType : 'json',
                // data: JSON.stringify(),
                success : function (result){
                    console.log(result)
                    if(result == 2){
                        alert("로그인이 필요합니다.")
                    }
                    else if(result == 1 ){
                        $('#wish_heart').attr("src", "<c:url value='/img/wish_heart2.png/'/>")
                    }
                    else if(result == -1){
                        $('#wish_heart').attr("src", "<c:url value='/img/wish_heart1.png/'/>");
                    }
                },
                error : function (){
                    alert("error!")
                    // window.location = "http://localhost:8080/app/login/login"
                }
            })
        })

        $(document).on('click', '.DP_btn_order_now', function () {
        // $('.DP_btn_order_now').click(function (){
            location.href="/app/store/s_buy?I_ID=${itemDto.i_ID}"
        })

    })
</script>
</body>
</html>