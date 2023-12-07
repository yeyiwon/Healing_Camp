<%@ page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'':pageContext.request.getSession(true).getAttribute('U_id')}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프 상점</title>

    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/store_common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/store_list.css'/> ">

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
    <div id="wrap">
        <div class="header">
            <div class="logo">
                <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
                <span>Store</span>
                <a href="<c:url value='/store/s_index'/>" class="logo_a">힐링캠프</a>
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
                    <a  href="<c:url value=''/>" class="s_nav_menu_a">ABOUTUS</a>
                </div>
            </div>
            <div class="s_search">
                <select id="sel_filter" name="option">
                    <option value='N' ${param.option == 'N'? "selected":""}>상품명</option>
                    <option value='B' ${param.option == 'B'? "selected":""}>브랜드명</option>
                </select>
                <input type="text" id="s_search_text" class="s_search_text" placeholder="검색어를 입력하세요" value="${param.keyword}">
                <img src="<c:url value='/img/search_icon.png/'/>" alt="서치아이콘" id="s_search_icon" class="s_search_icon">
            </div>
        </div>
        <div class="container sl_main">
            <div class="s_cate_bar w_1300">
                <div class="s_cate_menu s_cate_menu_active">전체</div>
                <div class="s_cate_menu">텐트</div>
                <div class="s_cate_menu">타프</div>
                <div class="s_cate_menu">의자</div>
                <div class="s_cate_menu">테이블</div>
                <div class="s_cate_menu">가방/수납</div>
                <div class="s_cate_menu">키친/쿨러</div>
                <div class="s_cate_menu">랜턴/기타</div>
            </div>
            <div class="s_item_main w_1300">
                <div class="s_list_count">전체 <span></span>개의 상품이 있습니다.</div>
                <div class="s_sort_box">
                    <div class="s_sort_btn s_sort_btn_selected">추천순</div>
                    <div class="s_sort_btn">신상품순</div>
                    <div class="s_sort_btn">낮은가격순</div>
                    <div class="s_sort_btn">높은가격순</div>
                    <div class="s_sort_btn">찜많은순</div>
                </div>
                <div class="s_list_box">
<%--                    <c:forEach var="item" items="${selectItemCount}">--%>
<%--                        <div class="s_item_box">--%>
<%--                            <a href="<c:url value='/store/s_detail'/>" class="s_item_a">--%>
<%--                                <img src="<c:url value='/img/item_img/${item.i_img_URL}'/> " class="s_item_img">--%>
<%--                                <div class="s_item_text">--%>
<%--                                    <div class="s_item_company">${item.i_company}</div>--%>
<%--                                    <div class="s_item_title">${item.i_name}</div>--%>
<%--                                    <div class="s_item_price">--%>
<%--                                        <c:choose>--%>
<%--                                            <c:when test="${empty item.i_S_Price}">--%>
<%--                                                <span class="s_item_s_price"><fmt:formatNumber value="${item.i_O_price}" pattern="#,###"/>원</span>--%>
<%--                                            </c:when>--%>
<%--                                            <c:when test="${!empty item.i_S_Price}">--%>
<%--                                                <span class="s_item_o_price"><fmt:formatNumber value="${item.i_O_price}" pattern="#,###"/>원</span>--%>
<%--                                                <span class="s_item_s_price"><fmt:formatNumber value="${item.i_S_Price}" pattern="#,###"/>원</span>--%>
<%--                                            </c:when>--%>
<%--                                        </c:choose>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
                </div>
            </div>
        </div>
        <div class="Camptop_btn"></div>
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
    </div>
    <script src="<c:url value='/js/store_index.js'/>"></script>
    <script src="<c:url value='/js/header,footer.js'/> "></script>
    <script src="<c:url value='/js/top_btn.js'/> "></script>
<script>
    let cate ="";
    let sort ="";
    let keyword = "null";
    let page = 0;
    let option = "N";
    $(document).ready(function(){
        /* 주소 변수 받기*/
        const urlParams = new URLSearchParams(window.location.search);
        const menu = urlParams.get('menu');
        cate = urlParams.get('cate');
        sort = urlParams.get('sort');

        $('.s_cate_menu').removeClass('s_cate_menu_active').removeClass('s_cate_menu_hover')
        $('.s_cate_menu').eq(cate).addClass('s_cate_menu_active')

        $('.s_sort_btn').removeClass('s_sort_btn_selected').removeClass('s_sort_btn_hover')
        $('.s_sort_btn').eq(sort).addClass('s_sort_btn_selected')


        $('#s_search_icon').on("click", function (){
            page = 0;
            $('.s_list_box').html("");
            Itemcate(menu);
        })
        $('#s_search_text').on("keydown", function(e){
            if(e.keyCode === 13){
                $('#s_search_icon').trigger('click');
            }
        })

        /* 클릭 시 인덱스 추출 해서 변수에 넣기*/
        $('.s_cate_menu').click(function(){
            page = 0;
            $('.s_list_box').html("");
            // cate = $(this).index();
            $('.s_cate_menu').removeClass('s_cate_menu_active').removeClass('s_cate_menu_hover')
            $('.s_cate_menu').eq($(this).index()).addClass('s_cate_menu_active')

            Itemcate(menu);
        })
        $('.s_sort_btn').click(function(){
            page = 0;
            $('.s_list_box').html("");
            // sort = $(this).index();
            $('.s_sort_btn').removeClass('s_sort_btn_selected').removeClass('s_sort_btn_hover')
            $('.s_sort_btn').eq($(this).index()).addClass('s_sort_btn_selected')


            Itemcate(menu);
        })

        /* 무한 스크롤 */
        $(window).scroll(function(){
            let s_bot = $(window).scrollTop() + $(window).height();
            let f_o_top = $('.footer').offset().top;
            // console.log(s_bot, f_o_top);

            if(s_bot >= f_o_top){
                page += 16;
                Itemcate(menu);
            }
        })
        Itemcate(menu);

        let likeId="";
        /* 찜 누르면 data iid 확인 해서 알림창 띄워주기 */
        $(document).on('click', '.s_item_like_btn', function(){
            likeId = $(this).attr("data-iid");
        })
        /* 장바구니 누르면 data iid 확인해서 알림창 띄워주기 */
        $(document).on('click', '.s_item_cart_btn', function(){
            likeId = $(this).attr("data-iid");
        })

        /*아이템 찜 목록에 추가하기*/
        $(document).on('click', '.s_item_like_btn', function(){
            // let thisItem=$('.s_item_like_btn').attr("data-iid");
            $.ajax({
                type: 'POST',
                url: '/app/store/itemwishlist_insert?I_ID='+likeId,
                headers : { "content-type": "application/json"},
                // dataType : 'json',
                // data: JSON.stringify(),
                success : function (result){
                    console.log(result)
                    console.log(likeId)
                    if(result == 2){
                        alert("로그인이 필요합니다.")
                    }
                    else if(result == 1 ){
                        $('#wish'+likeId).attr("src", "/app/img/wish_heart2.png");
                        console.log($('#wish'+likeId).html())
                    }
                    else if(result == -1){
                        $('#wish'+likeId).attr("src", "/app/img/wish_heart1.png");
                    }
                },
                error : function (){
                    alert("error!")
                    // window.location = "http://localhost:8080/app/login/login"
                }
            })
            return false;
        })

        /* 아이템 카트에 추가하기*/
        $(document).on('click', '.s_item_cart_btn', function(){
            $.ajax({
                type: 'POST',
                url: '/app/store/cart_insert?I_ID='+likeId+'&Item_cart_cnt=1',
                headers : { "content-type": "application/json"},
                // dataType : 'json',
                // data: JSON.stringify(),
                success : function (result){
                    console.log(result)
                    console.log(likeId)
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
                }
            })
            return false;
        })
    })



    /* ajax 변수*/
        let Itemcate = function(menu) {
            let ajaxUrl = "";

            cate = $('.s_cate_menu_active').index();
            sort = $('.s_sort_btn_selected').index();
            keyword = $('#s_search_text').val().trim();
            option = $('#sel_filter').val();

            ajaxUrl += cate==null?'&cate=0':'&cate='+cate;
            ajaxUrl += sort==null?'&sort=0':'&sort='+sort;
            ajaxUrl += page==null?'':'&page='+page;
            ajaxUrl += keyword==''?'&keyword=null':'&keyword='+keyword;
            ajaxUrl += option==null?'&option="N"':'&option='+option;

            console.log("ajaxUrl : ", ajaxUrl);

            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/app/store/s_list?menu='+menu+ajaxUrl,  // 요청 URI
                headers: {"content-type": "application/json"}, // 요청 헤더
                // dataType: 'text', // 전송받을 데이터의 타입
                // data: JSON.stringify(),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function(result){
                    // alert("왜 성공했냐");

                    $('.s_list_count > span').html(loadItemCount(result.count));
                    $(".s_list_box").append(loadList(result.list));
                },
                error: function (e) {
                    // alert("성공적으로 실패!")
                    console.log(e)
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

            return false;
        }

        /* 아이템 넣기 */
        let loadList = function(items){
            let tmp = "";
            let hasSPrice ="";

            items.forEach(function(item){
                tmp += '<div class="s_item_box">';
                tmp += '    <a href="/app/store/s_detail?I_ID='+item.i_ID+'" class="s_item_a">';
                tmp += '        <div class="s_item_img_box">'
                tmp += '            <img src="/app/img/item_img/'+item.i_img_URL+'" alt="" class="s_item_img">';
                tmp += '             <div class="s_item_btn_box">';
                tmp += '                <div class="s_item_btn s_item_like_btn" data-iid="'+item.i_ID+'">';
                tmp += '                    <img id="wish'+item.i_ID+'" src="/app/img/wish_heart'+item.wishYn+'.png" alt="">';
                tmp += '                </div>';
                tmp += '                 <div class="s_item_btn s_item_cart_btn" data-iid="'+item.i_ID+'">';
                tmp += '                    <img src="/app/img/cart_icon.png" alt="">';
                tmp += '                </div>';
                tmp += '             </div>';
                tmp += '         </div>';
                tmp += '         <div class="s_item_text">';
                tmp += '             <div class="s_item_company">'+item.i_company+'</div>';
                tmp += '             <div class="s_item_title">'+item.i_name+'</div>';
                tmp += '             <div class="s_item_price">';

                if(item.i_S_Price !== null){
                    hasSPrice = '<span class="s_item_o_price">'+((item.i_O_price).toLocaleString("ko-KR"))+'원</span>' +
                        '<span class="s_item_s_price">'+( (+(item.i_S_Price)).toLocaleString("ko-KR"))+'원</span>'
                }else{
                    hasSPrice = '<span class="s_item_s_price">'+((item.i_O_price).toLocaleString("ko-KR"))+'원</span>'
                }
                // const cn1 = n1.toString()
                //     .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                tmp +=                hasSPrice;

                tmp += '            </div>';
                tmp += '        </div>';
                tmp += '    </a>';
                tmp += '</div>';
            })
            return tmp;


        }

        /* 아이템 갯수 넣기*/
        let loadItemCount = function (count){
            return count;
        }
</script>

</body>
</html>
