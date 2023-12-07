<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 결제</title>
    <link rel="stylesheet" href="<c:url value='/css/s_payment.css'/>">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<div id="wrap">
    <div class="w_900">
        <header class="PP_header">
            <div class="PP_header_top">
                <div class="logo">
                    <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
                    <span>Store</span>
                    <a href="<c:url value='/'/>" class="logo_a">힐링캠프</a>
                </div>
                <div class="cart_icon">
                    <img src="<c:url value='/img/cart_icon.png'/>" alt="">
                    <div class="cart_count">2</div>
                    <a href="<c:url value='/store/s_cart'/>">장바구니</a>
                </div>
            </div>
            <div class="PP_header_bot">주문/결제</div>
        </header>
        <main class="main">
            <section class="PP_user_info">
                <h3>배송지</h3>
                <table class="recipient">
                    <tbody>
                    <tr>
                        <th>받는사람<span>*</span></th>
                        <td>
                            <input type="text">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="address">
                    <tbody>
                    <tr>
                        <th rowspan="3">주소<span>*</span></th>
                        <td>
                            <input type="text" placeholder="우편번호">
                        </td>
                    </tr>
                    <tr>
                        <!-- <td></td> -->
                        <td>
                            <input type="text" placeholder="기본주소">
                        </td>
                    </tr>
                    <tr>
                        <!-- <td></td> -->
                        <td>
                            <input type="text" placeholder="나머지 주소">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="phone_num">
                    <tbody>
                    <tr>
                        <th>휴대전화<span>*</span></th>
                        <td>
                            <select class="select_first_phone_num">
                                <option value="" selected>010</option>
                                <option value="">011</option>
                                <option value="">016</option>
                                <option value="">017</option>
                                <option value="">018</option>
                                <option value="">019</option>
                            </select>
                            <span>-</span>
                            <input type="number">
                            <span>-</span>
                            <input type="number">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="email">
                    <tbody>
                    <tr>
                        <th>이메일<span>*</span></th>
                        <td>
                            <input type="text">
                            <span>@</span>
                            <select class="select_second_email">
                                <option value="" selected>-이메일 선택-</option>
                                <option value="">naver.com</option>
                                <option value="">daum.net</option>
                                <option value="">nate.com</option>
                                <option value="">hotmail.com</option>
                                <option value="">yahoo.com</option>
                                <option value="">empas.com</option>
                                <option value="">korea.com</option>
                                <option value="">dreamwiz.com</option>
                                <option value="">gmail.com</option>
                                <option value="">직접입력</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="select_massage">
                    <select>
                        <option value="" selected>-- 메시지 선택 (선택사항) --</option>
                        <option value="">배송 전에 미리 연락바랍니다.</option>
                        <option value="">부재 시 경비실에 맡겨주세요.</option>
                        <option value="">부재 시 문 앞에 놓아주세요.</option>
                        <option value="">빠른 배송 부탁드립니다.</option>
                        <option value="">택배함에 보관해 주세요.</option>
                    </select>
                    <div class="chk_save_address">
                        <input type="checkbox" name="" id="">
                        <span>기본 배송지로 저장</span>
                    </div>
                </div>
            </section>
            <section class="PP_order_item">
                <div class="PP_order_item_head">
                    <h3>주문상품</h3>
                </div>
                <div class="PP_order_item_main">
                    <c:forEach var="item" items="${selectItemInCart}">
                        <div class="PP_order_item_box">
                            <div class="PP_order_item_img_box">
                                <img src="<c:url value='/img/item_img/${item.i_img_URL}/'/>" alt="">
                            </div>
                            <div class="PP_order_item_info">
                                <div class="PP_order_item_name">${item.i_name}</div>
                                <div class="PP_order_item_count">
                                    <span>수량:</span>
                                    <span class="PP_order_item_count_num">${item.item_cart_cnt}</span><span>개</span>
                                </div>
                                <div class="PP_order_item_price">
                                    <c:choose>
                                        <c:when test="${empty item.i_S_Price}">
                                            <span class="s_item_s_price"><fmt:formatNumber value="${item.i_O_price}" pattern="#,###"/>원</span>
                                        </c:when>
                                        <c:when test="${!empty item.i_S_Price}">
                                            <span class="s_item_s_price"><fmt:formatNumber value="${item.i_S_Price}" pattern="#,###"/>원</span>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="PP_order_item_footer">
                    <div class="txt1">배송비</div>
                    <div class="txt2">무료</div>
                </div>
            </section>
            <section class="PP_chk_point_use">
                <div class="PP_chk_point_use_head">
                    <h3>포인트사용</h3>
                </div>
                <div class="PP_chk_point_use_main">
                    <div class="use_point">
                        <div class="use_point_title">사용할 포인트</div>
                        <div class="use_point_count">
                            <input type="number" placeholder="0원" id="usePoint">
                            <div class="max_btn">최대사용</div>
                        </div>
                    </div>
                    <div class="chk_user_point">
                        <div class="txt1">보유 포인트</div>
                        <div class="txt2" id="currPoint"><span><fmt:formatNumber value="${currPoint}" pattern="#,###"/></span>원</div>
                    </div>
                    <div class="final_sale_price">
                        <div class="txt1">할인금액</div>
                        <div class="txt2 salePrice"><span>0</span>원</div>
                    </div>
                </div>
            </section>
            <section class="chk_final_price">
                <div class="chk_final_price_head">
                    <h3>결제정보</h3>
                </div>
                <div class="chk_final_price_main">
                    <article class="chk_final_price_main_article1">
                        <div class="txt1">주문상품</div>
                        <div class="txt2" id="beforeTotal"><span><fmt:formatNumber value="${sum}" pattern="#,###"/></span>원</div>
                    </article>
                    <article class="chk_final_price_main_article2">
                        <div class="txt1">배송비</div>
                        <div class="txt2">무료</div>
                    </article>
                    <article class="chk_final_price_main_article3">
                        <div class="txt1">할인/부가결제</div>
                        <div class="txt2 salePrice"><span>0</span>원</div>
                    </article>
                    <article class="chk_final_price_main_article4">
                        <div class="txt1">최종 결제 금액</div>
                        <div class="txt2 afterPrice" ><span><fmt:formatNumber value="${sum}" pattern="#,###"/></span>원</div>
                    </article>
                </div>
            </section>
            <section class="chk_methods_of_payment">
                <div class="chk_methods_of_payment_head">
                    <h3>결제수단</h3>
                </div>
                <div class="chk_methods_of_payment_main">
                    <div class="chk_methods_of_payment_main_title">결제수단 선택</div>
                    <article>
                        <img src="<c:url value='/img/store_payment/무통장2.gif' />" alt="">
                    </article>
                    <article>
                        <img src="<c:url value='/img/store_payment/카드결제1.gif' />" alt="">
                    </article>
                    <article>
                        <img src="<c:url value='/img/store_payment/가상계좌1.gif' />" alt="">
                    </article>
                    <article>
                        <img src="<c:url value='/img/store_payment/실시간계좌1.gif' />" alt="">
                    </article>
                </div>
            </section>
            <section class="final_pay_btn_box">
                <div class="txt1">구매조건 확인 및 결제진행 동의</div>
                <div class="txt2">주문 내용을 확인하였으며 약관에 동의합니다.</div>
                <div class="final_pay_btn">
                    <span class="final_price afterPrice"><span><fmt:formatNumber value="${sum}" pattern="#,###"/></span>원 결제하기</span>
                </div>
            </section>
        </main>
        <footer class="footer">
            <p>-무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다. 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</p>
            <br>
            <p>-최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
        </footer>
    </div>
</div>
<script>
    $(document).ready(function (){
        let currPoint = ${currPoint};
        let sum = ${sum};
        let modifiedValue = "";
        let inputElement = "";
        let originalValue = "";
        console.log(currPoint);
        $(document).on('keyup', '#usePoint', function () {
            inputElement = $(this);
            originalValue = inputElement.val();

            // 체크: originalValue가 유효한 숫자인지 확인
            if (isNaN(originalValue) || originalValue === "") {
                // 유효한 숫자가 아니거나 비어있는 문자열이면 0으로 설정
                originalValue = 0;
            }

            if (originalValue > currPoint) {
                alert('포인트는 보유하신 만큼만 사용하실 수 있습니다.')
                // originalValue가 currPoint보다 큰 경우 처리
                inputElement.val(originalValue.slice(0, -1));

                // 여기서 변경된 originalValue 값을 사용
                modifiedValue = +(originalValue.slice(0, -1));
                $('.salePrice span').html((modifiedValue).toLocaleString("ko-KR"));
                $('#currPoint span').html((+currPoint - modifiedValue).toLocaleString("ko-KR"));
                $('afterPrice span').html((+sum - modifiedValue).toLocaleString("ko-KR"));
            } else {
                // originalValue가 currPoint 이하인 경우 처리
                if (originalValue === 0 || originalValue === "") {
                    $('.salePrice span').html(0);
                } else {
                    // 여기서 변경된 originalValue 값을 사용
                    modifiedValue = +originalValue;
                    $('.salePrice span').html(modifiedValue.toLocaleString("ko-KR"));
                    $('#currPoint span').html((+currPoint - modifiedValue).toLocaleString("ko-KR"));
                    $('.afterPrice span').html((+sum - modifiedValue).toLocaleString("ko-KR"));
                }
            }
        });

        $(document).on('click', '.max_btn', function (){
            $('#usePoint').val('${currPoint}');
            $('#currPoint span').html(0);
            modifiedValue = +($('#usePoint').val());
            $('.salePrice span').html(modifiedValue.toLocaleString("ko-KR"));
            $('.afterPrice span').html((+sum - modifiedValue).toLocaleString("ko-KR"));
        })

        const urlParams = new URLSearchParams(window.location.search);
        let chklist = urlParams.get('I_ID');

        $(document).on('click', '.final_price', function (){
            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/app/store/s_buy?chklist='+chklist+'&updatePoint='+$('#usePoint').val(),  // 요청 URI
                headers: {"content-type": "application/json"}, // 요청 헤더
                // dataType: 'text', // 전송받을 데이터의 타입
                // data: JSON.stringify(
                //     {"chklist": 123, "modifiedValue" : 456}
                // ),
                success: function(result){
                    // alert("왜 성공했냐");
                    $('.main').html(completePayment());
                },
                error: function (e) {
                    // alert("성공적으로 실패!")
                    console.log(e)
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        })
    })



    let completePayment = function (){

        let tmp = '';

        tmp += '<div class="complete_box">';
        tmp += '    <div class="complete_ck_box">';
        tmp += '        <div class="complete_ck"></div>';
        tmp += '    </div>';
        tmp += '    <div class="complete_txt">';
        tmp += '        <h1> 결제 완료되었습니다. </h1>';
        tmp += '    </div>';
        tmp += '</div>';

        return tmp;
    }
</script>
</body>
</html>