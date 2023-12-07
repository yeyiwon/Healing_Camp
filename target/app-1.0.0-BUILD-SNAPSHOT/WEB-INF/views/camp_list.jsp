<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="campcount" value="${ pageContext.request.getSession(false).getAttribute('campCount')==null?'':pageContext.request.getSession(false).getAttribute('campCount')}" />
<c:set var="logInOutLink" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(true).getAttribute('U_id')==null?'':pageContext.request.getSession(true).getAttribute('U_id')}" />
<%--<c:set var="fireMouse" value="<c:url value='/img/Camp_img/firecursor.png'/>" />--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링캠프</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/Campsearchbar.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/Camp_LocationList.css'/> ">
    <link href="<c:url value='/css/jquery-ui.css'/>" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<div id="wrap">
        <div class="header">
            <div class="logo">
                <img src="<c:url value='/img/logo.png'/>" alt="로고 이미지" class="logo_img">
                <a href="<c:url value='/'/>" class="logo_a">힐링캠프</a>
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


<%--                <div class="mb_menu cart">--%>
<%--                    <a href="<c:url value='/store/s_cart/'/>" class="mb_menu_a">장바구니</a>--%>
<%--                </div>--%>
                <div class="mb_menu to_camp_index">
                    <a href="<c:url value='/store/s_index'/>" class="mb_menu_a">상점페이지로</a>
                </div>
            </div>
        </div>
    <div class="container">
        <div class="search_cl">
<%--            <form action="<c:url value='/camp/c_list'/>">--%>
            <div class="search_box">
            <div class="search-bar">
                <input type="text" class="search-input" id="c_search_text" name="keyword" value="" placeholder="캠핑장명 검색">
                <img src="<c:url value='/img/search_icon_black.png'/>">
            </div>
            <div class="list_bar">
                <div class="in2">
                <input type="date" id="datepicker1" class="date-input" value="" placeholder="출발 날짜">
                <h3 class="list_h3"> ~ </h3>
                <input type="date" id="datepicker2" class="date-input" placeholder="도착 날짜">
                <select name="type" class="category-select">
                    <option value=""> 어디로 떠나볼까요?</option>
                    <option value="강원도"> 강원도</option>
                    <option value="경기도"> 경기도</option>
                    <option value="경상남도"> 경상남도</option>
                    <option value="경상북도"> 경상북도</option>
                    <option value="대구"> 대구</option>
                    <option value="인천"> 인천</option>
                    <option value="전라남도"> 전라남도</option>
                    <option value="전라북도"> 전라북도</option>
                    <option value="제주특별자치도"> 제주특별자치도</option>
                    <option value="충청남도"> 충청남도</option>
                    <option value="충청북도"> 충청북도</option>
                </select>
            </div>
            <input type="int" name="page" value=0 hidden>
            <input type="int" name="recordSize" value=10 hidden>
            <button class="search-button" id="c_search_icon">검색</button>
        </div>
    </div>
<%--            </form>--%>
        </div>
        <div class="CL_nav">
                <div class="CL_campcount">검색된 게시물 &lt; <span></span> &gt; 개</div>
                <div class="option">
                    <ul class="CL_nav_ul">
                        <li class="CL_nav_li"> 인기순 </li>
                        <li class="CL_nav_li"> 가격 낮은 순</li>
                        <li class="CL_nav_li"> 가격 높은 순</li>
                        <li class="CL_nav_li">리뷰 많은 순</li>
                        <li class="CL_nav_li">평점 높은 순</li>
                    </ul>
                </div>
        </div>
<%--    아이템 리스트 시작 무한스크롤 --%>
        <div class="w_1300">
            <div id="itemList" class="CL_item_List">
<%--        <c:forEach var="campli" items="${selectCampList}">--%>
<%--                <div class="CL_item">--%>
<%--                    <a href="<c:url value='/camp/c_list/${campli.c_ID}'/>">--%>
<%--                        <img src="<c:url value='/img/Camp_img/${campli.c_F_image}'/>" alt="">--%>
<%--                        <div class="CL_txtbox">--%>
<%--                            <div class="CL_desc">--%>
<%--                                <div class="CLD_L">--%>
<%--                                    <div class="CL_CampName">${campli.c_name}</div>--%>
<%--                                    <div class="CL_score">평점 : ${campli.c_score}점</div>--%>
<%--                                    <div class="CL_Address">주소 : ${campli.c_region}</div>--%>
<%--                                </div>--%>
<%--                                <div class="CLD_R">--%>
<%--                                    <div class="CL_Price"><fmt:formatNumber value="${campli.c_Price}" pattern="###,###"/> 원 ~</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--&lt;%&ndash;            <div class="ajax-load"><img src="<c:url value='/img/firecursor3.png/'>" alt=""> 로딩 중...</div>&ndash;%&gt;--%>
<%--                </div>--%>
<%--        </c:forEach>--%>
            </div>
    </div>
        <div class="Camptop_btn"></div>
        <%@include file="/WEB-INF/views/layout/footer.jsp"%>

</div>
</div>
<script src="<c:url value='/js/top_btn.js'/> "></script>
<script src="<c:url value='/js/header,footer.js'/> "></script>
</body>
</html>
<%--<script src="<c:url value='/js/LocaitonList.js'/> "></script>--%>
<%--/app/camp/c_list/paging?keyword="+핑장+"&type="+강원도+"&offset=10"+currentPage+"&pageSize=10--%>
<script>
    /* 정렬버튼 클릭 시 글씨 두껍게 */
    $(document).on('click', '.CL_nav_li', function(){
        $('.CL_nav_li').removeClass('CL_nav_li_selected').removeClass('CL_nav_li_hover')
        $('.CL_nav_li').eq($(this).index()).addClass('CL_nav_li_selected')
    })

    /* 정렬버튼 호버시 글씨 색 변하게 */
    $('.CL_nav_li').mouseenter(function(){
        if($('.CL_nav_li').eq($(this).index()).hasClass('CL_nav_li_selected')==false){
            $('.CL_nav_li').eq($(this).index()).addClass('CL_nav_li_hover')
        }
    })
    $('.CL_nav_li').mouseleave(function(){
        if($('.CL_nav_li').eq($(this).index()).hasClass('CL_nav_li_selected')==false){
            $('.CL_nav_li').eq($(this).index()).removeClass('CL_nav_li_hover')
        }
    })

    let startDate = "";
    let endDate = "";
    let campReserveDate=[];
    let campList=[];

    let sort =0;
    let keyword = "";
    let page = 0;
    let type = "";

    $(document).ready(function(){
        const urlParams = new URLSearchParams(window.location.search);
        type = urlParams.get('type');
        keyword = urlParams.get('keyword');
        sort = urlParams.get('sort');
        startDate = urlParams.get('startDate');
        endDate = urlParams.get('endDate');

        if(keyword != null || type!=null || startDate != null || endDate || null){
            $('.search-input').val(keyword);
            $('#datepicker1').val(startDate);
            $('#datepicker2').val(endDate);
            $('.category-select').val(type);
        }

        $('#datepicker2').on('input', function () {
            let toDate = new Date();
            let t_year = toDate.getFullYear();
            let t_month = toDate.getMonth();
            let t_date = toDate.getDate();

            startDate = $('#datepicker1').val();
            endDate = $(this).val();
            // '-'를 기준으로 나누어 배열에 저장
            let startDateArray = startDate.split('-');
            let endDateArray = endDate.split('-');

            if (+startDateArray[2] > +endDateArray[2] ||
                (+startDateArray[2] <= +endDateArray[2] && +startDateArray[1] > +endDateArray[1]) ||
                (+startDateArray[2] <= +endDateArray[2] && +startDateArray[1] <= +endDateArray[1] && +startDateArray[0] > +endDateArray[0])) {
                alert("예약은 첫 날보다 이후 날짜로 조회 가능합니다.");
                $(this).val("")
            }
            // campReserveList();
        })



        $('.CL_nav_li').removeClass('CL_nav_li_selected').removeClass('CL_nav_li_hover')
        $('.CL_nav_li').eq(sort).addClass('CL_nav_li_selected')

        $('.CL_nav_li').click(function(){
            page = 0;
            $('.CL_item_List').html("");
            // sort = $(this).index();
            sort = $('.CL_nav_li_selected').index();
            $('.CL_nav_li').removeClass('CL_nav_li_selected').removeClass('CL_nav_li_hover')
            $('.CL_nav_li').eq($(this).index()).addClass('CL_nav_li_selected')
            // campReserveList();
            CampList();
        })

        $('#c_search_icon').on("click", function (){

            page = 0;
            $('.CL_item_List').html("");
            // campReserveList();
            keyword = $('#c_search_text').val();
            type = $('#c_sel_filter').val();
            CampList();
        })
        $('#c_search_text').on("keydown", function(e){
            if(e.keyCode === 13){
                $('#c_search_icon').trigger('click');
            }
        })

        /* 무한 스크롤 */
        $(window).scroll(function(){
            let s_bot = $(window).scrollTop() + $(window).height();
            let f_o_top = $('.footer').offset().top;
            // console.log(s_bot, f_o_top);

            if(s_bot >= f_o_top){
                page += 10;
                // campReserveList();
                CampList();
            }
        })


        // campReserveList();
        CampList();

    })
    // let campReserveList = function(){
    //     $.ajax({
    //         type: 'POST',       // 요청 메서드
    //         url: '/app/camp/c_list?startDate='+startDate+'&endDate='+endDate,  // 요청 URI
    //         headers: {"content-type": "application/json"}, // 요청 헤더
    //         // dataType: 'text', // 전송받을 데이터의 타입
    //         // data: JSON.stringify(),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
    //         success: function(result){
    //             console.log("여기")
    //             // alert("왜 성공했냐");
    //             let r_size = (result.reserve).length;
    //             for(let i=0; i<r_size; i++){
    //                 campReserveDate[i] = result.reserve[i];
    //                 console.log((result.reserve[i]) instanceof Object)
    //             }
    //
    //             CampList();
    //             console.log(JSON.stringify(campReserveDate));
    //
    //         },
    //         error: function (e) {
    //             alert("성공적으로 실패!")
    //             console.log(e)
    //         } // 에러가 발생했을 때, 호출될 함수
    //     }); // $.ajax()
    // }
    let CampList = function() {
            let ajaxUrl = "";

            sort = $('.CL_nav_li_selected').index();
            // keyword = $('#c_search_text').val();
            // type = $('#c_sel_filter').val();

            ajaxUrl += keyword==''?'?keyword=':'?keyword='+keyword;
            ajaxUrl += type==null?'&type=':'&type='+type;
            ajaxUrl += sort==null?'&sort=0':'&sort='+sort;
            ajaxUrl += page==null?'':'&page='+page;
            ajaxUrl += startDate==null?'':'&startDate='+startDate;
            ajaxUrl += endDate==null?'':'&endDate='+endDate;

            console.log("ajaxUrl : ", ajaxUrl);
            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/app/camp/c_list'+ajaxUrl,  // 요청 URI
                headers: {"content-type": "application/json"}, // 요청 헤더
                // dataType: 'text', // 전송받을 데이터의 타입
                // data: JSON.stringify(),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function(result){
                    console.log("여기2")

                    $('.CL_campcount > span').html(loadCampCount(result.c_count));
                    $(".CL_item_List").append(loadList(result.c_List));
                },
                error: function (e) {
                    // alert("성공적으로 실패!")
                    // console.log(e)
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

            return false;
        }

        /* 아이템 넣기 */
    let loadList = function(items){
            let tmp = "";
            let hasSPrice ="";



                items.forEach(function (item) {

                        tmp += '<div class="CL_item">';
                        tmp += '    <a href="/app/camp/c_list/' + item.c_ID + '?startDate='+startDate+'&endDate='+endDate+'">';
                        tmp += '        <img src="/app/img/Camp_img/' + item.c_F_image + '" alt="">'
                        tmp += '        <div class="CL_txtbox">';
                        tmp += '            <div class="CL_desc">';
                        tmp += '                <div class="CLD_L">';
                        tmp += '                    <div class="CL_CampName">' + item.c_name + '</div>';
                        tmp += '                    <div class="CL_score">평점 : ' + item.c_score + '점</div>';
                        tmp += '                    <div class="CL_Address">주소 : ' + item.c_region + '</div>';
                        tmp += '                </div>';
                        tmp += '                <div class="CLD_R">';
                        tmp += '                    <div class="CL_Price">' + item.c_Price.toLocaleString("ko-KR") + ' 원 ~</div>';
                        tmp += '                </div>';
                        tmp += '            </div>';
                        tmp += '        </div>';
                        tmp += '     </a>';
                        tmp += '</div>';
                })
            return tmp;
        }

    let loadCampCount = function (count){
        return count;
    }
</script>

<%--///////////////////////////////////////////////////--%>

<%--&lt;%&ndash;여기 스크립트 보면서 하면 됨 &ndash;%&gt;--%>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        $('.CL_nav_ul li').click(function () {--%>
<%--            var sortType = $(this).data('sort');--%>
<%--            DataSort(sortType); // 데이터 정렬--%>
<%--        });--%>
<%--    });--%>

<%--    function DataSort(sort) {--%>
<%--        var keyword = encodeURIComponent("핑장"); //--%>
<%--        var type = encodeURIComponent("강원도"); //--%>
<%--        $.ajax({--%>
<%--            type: 'GET',--%>
<%--            url: "/app/camp/c_list/paging?keyword="+keyword+"&type="+type+"&offset="+0+"&pageSize=10",--%>
<%--            data: {--%>
<%--                offset: 0,--%>
<%--                pageSize: 10,--%>
<%--                sort: sort--%>
<%--            },--%>
<%--            success: function (response) {--%>
<%--                console.log(response);--%>
<%--                $('#itemList').html(appendPage(response))--%>
<%--                ;--%>
<%--            },--%>
<%--            error: function (error) {--%>
<%--                console.error('Error:', error);--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--    let currentPage = 1;--%>
<%--    let isLoading = false;--%>

<%--        $(window).on("scroll", function() {--%>
<%--            let scrollTop = $(window).scrollTop();--%>
<%--            let windowHeight = $(window).height();--%>
<%--            let documentHeight = $(document).height();--%>
<%--            let isBottom = scrollTop + windowHeight + 10 >= documentHeight;--%>

<%--            if (isBottom && !isLoading) {--%>
<%--                isLoading = true;--%>
<%--                $('.ajax-load').show();--%>
<%--                currentPage++;--%>
<%--                getCampList(currentPage);--%>
<%--            }--%>

<%--            --%>
<%--            // 여기 부분 애매함 --%>
<%--                // const getCampList = function() {--%>
<%--                //     console.log("inGetList" + currentPage);--%>
<%--                // }--%>
<%--                //--%>
<%--                //     $.ajax({--%>
<%--                //         type: "post",--%>
<%--                //         // url: "/app/camp/c_list/paging?keyword="+keyword+"&type="+type+"&offset="+currentPage+"&pageSize=10",--%>
<%--                //         url: "/app/camp/c_list/paging",--%>
<%--                //         // data: {"currentPage": currentPage},--%>
<%--                //         data: "keyword=" + keyword + "&type=" + type + "&offset=" + currentPage + "&pageSize=10",--%>
<%--                //         success: function (data) {--%>
<%--                //             console.log(data)--%>
<%--                //             $('#itemList').append(appendPage(data));--%>
<%--                //             $('.ajax-load').hide();--%>
<%--                //             isLoading = false;--%>
<%--                //             console.log("ajax")--%>
<%--                //         }--%>
<%--                //--%>
<%--                //     });--%>
<%--                // }--%>
<%--            let s_bot = scrollTop + windowHeight;--%>
<%--            console.log("s_bot: " + s_bot +", f_offset: " + $('.footer').offset().top)--%>
<%--            if(s_bot >= $('.footer').offset().top - 100) {--%>

<%--                console.log("닿음")--%>
<%--                getCampList((currentPage ) * 10)--%>
<%--            }--%>

<%--    function getCampList(currentPage) {--%>
<%--        //?keyword=핑장&type=강원도&offset=0&pageSize=10--%>
<%--        let keyword = "핑장"; //$('.keyword').val();--%>
<%--        let type = "강원도"--%>
<%--        $.ajax({--%>
<%--            type: "get",--%>
<%--            url: "/app/camp/c_list/paging?keyword="+keyword+"&type="+type+"&offset="+currentPage+"&pageSize=10",--%>
<%--            data: {"currentPage": currentPage},--%>
<%--            success: function (data) {--%>
<%--                console.log(data)--%>
<%--                console.log(appendPage(data))--%>
<%--                $('#itemList').append(appendPage(data));--%>
<%--                $('.ajax-load').hide();--%>
<%--                isLoading = false;--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--            --%>
<%--    function appendPage(data) {--%>

<%--        let newItemHtml = ``;--%>
<%--        for (let i = 0; i < data.length; i++) {--%>
<%--            let campli = data[i];--%>
<%--            newItemHtml += `--%>
<%--            <div class="CL_item">--%>
<%--                <a href="/camp/c_list/${'${data[i].c_ID}'}">--%>
<%--                    <img src="/app/img/Camp_img/${'${data[i].c_F_image}'}" alt=""></a>--%>
<%--                <div class="CL_txtbox">--%>
<%--                    <div class="CL_desc">--%>
<%--                        <div class="CLD_L">--%>
<%--                            <div class="CL_CampName">${'${data[i].c_name}'}</div>--%>
<%--                            <div class="CL_score">평점 : ${'${data[i].c_score}'}점</div>--%>
<%--                            <div class="CL_Address">주소 : ${'${data[i].c_region}'}</div>--%>
<%--                        </div>--%>
<%--                        <div class="CLD_R">--%>
<%--                            <div class="CL_Price"><fmt:formatNumber value="${'data[i].c_Price'}" pattern="###,###"/>원</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>`;--%>
<%--        }--%>
<%--        return newItemHtml;--%>
<%--    }--%>
<%--            --%>
<%--            --%>
<%--            --%>
<%--            --%>
<%--            --%>
<%--            --%>
<%--            --%>



//////////////////////////////////////////////





//  여기까지 일단 참고하면서 보면 됨 밑에봐도 비슷비슷함
// 잘 모르겠는 부분
    <%-- <script>
    var baseUrl = "http://localhost:8080/app";

    function DataSort(sortType) {
        $.ajax({
            type: 'GET',
            url: baseUrl + "/camp/c_list/paging",
            data: {
                keyword: "핑장",
                type: "강원도",
                offset: 1,
                pageSize: 10,
                sort: "인기순"
            },
            success: function (response) {
                console.log(response);
            },
            error: function (error) {
                console.error('Error:', error);
            }
        });
    }

    function getCampList(currentPage) {
        $.ajax({
            type: "get",
            url: baseUrl + "/camp/c_list/paging",
            data: {
                keyword: "핑장",
                type: "강원도",
                offset: currentPage,
                pageSize: 10
            },
            success: function (data) {
                console.log(data);
                console.log(appendPage(data));
                $('#itemList').append(appendPage(data));
            }
        });
    }

    function appendPage(data) {
        let newItemHtml = ``;
        console.log("data.length: " + data.length)
        for (let i = 0; i < data.length; i++) {
            let campli = data[i];
            newItemHtml += `
            <div class="CL_item">
                <a href="/camp/c_list/${campli.c_F_img}">
                <div class="CL_txtbox">
                    <div class="CL_desc">
                        <div class="CLD_L">
                            <div class="CL_CampName">${campli.c_name}</div>
                            <div class="CL_score">평점 : ${campli.c_score}점</div>
                            <div class="CL_Address">주소 : ${campli.c_region}</div>
                        </div>
                        <div class="CLD_R">
                            <div class="CL_Price"><fmt:formatNumber value="${campli.c_Price}" pattern="###,###"/>원</div>
                        </div>
                    </div>
                </div>
            </div>`;
        }

        return newItemHtml;
    }


</script> --%> <%--3차 망함--%>

    <%--<script>
        var offset = 1;
        var pageSize = 10;
        var keyword = encodeURIComponent("핑장");
        var type = encodeURIComponent("강원도");
        var url = "http://localhost:8080/app/camp/c_list/paging?keyword=" + keyword + "&type=" + type + "&offset=" + offset + "&pageSize=" + pageSize + "&sort=가격+높은+순";

        function DataSort(sortType) {
            $.ajax({
                type: 'GET',
                url: "http://localhost:8080/app/camp/c_list/paging?keyword=" + keyword + "&type=" + type + "&offset=" + offset + "&pageSize=" + pageSize + "&sort=가격+높은+순",
                data: {
                    offset: 1,
                    pageSize: 10,
                    sort: sortType
                },
                success: function (response) {
                    console.log(response);
                },
                error: function (error) {
                    console.error('Error:', error);
                }
            });
        }

        function getCampList(currentPage) {
            let keyword = encodeURIComponent("핑장");
            let type = encodeURIComponent("강원도");
            $.ajax({
                type: "get",
                url: "/app/camp/c_list/paging?keyword=" + keyword + "&type=" + type + "&offset=" + currentPage + "&pageSize=10",
                data: {"currentPage": currentPage},
                success: function (data) {
                    console.log(data);
                    console.log(appendPage(data));
                    $('#itemList').append(appendPage(data));
                }
            });
        }
        function appendPage(data) {
            let newItemHtml = ``;
            console.log("data.length: " + data.length)
            for (let i = 0; i < data.length; i++) {
                let campli = data[i];
                newItemHtml += `
                <div class="CL_item">
                    <a href="/camp/c_list/${campli.c_ID}">
                        <img src="/img/Camp_img/2.png" alt=""></a>
                    <div class="CL_txtbox">
                        <div class="CL_desc">
                            <div class="CLD_L">
                                <div class="CL_CampName">${campli.c_name}</div>
                                <div class="CL_score">평점 : ${campli.c_score}점</div>
                                <div class="CL_Address">주소 : ${campli.c_region}</div>
                            </div>
                            <div class="CLD_R">
                                <div class="CL_Price"><fmt:formatNumber value="${campli.c_Price}" pattern="###,###"/>원</div>
                            </div>
                        </div>
                    </div>
                </div>`;
            }

            return newItemHtml;

        }
    </script>--%> <%-- 2차 망함--%>


<%--</script>--%>
<%--//     개 망함--%>
<%--보지 마셈 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
<%--///////////////////////////////////////////////////////--%>

<%--&lt;%&ndash;</script>--%>
<%--&lt;%&ndash;// if ($(window).scrollTop() == $(document).height() - $(window).height()) {&ndash;%&gt;--%>
<%--&lt;%&ndash;// // 스크롤이 페이지 하단에 도달하면 추가 데이터를 가져오는 Ajax 요청&ndash;%&gt;--%>
<%--&lt;%&ndash;// $.ajax({&ndash;%&gt;--%>
<%--&lt;%&ndash;// type: 'GET',&ndash;%&gt;--%>
<%--&lt;%&ndash;// url: '/camp/c_list',&ndash;%&gt;--%>
<%--&lt;%&ndash;// data: { offset: offset, limit: limit },&ndash;%&gt;--%>
<%--&lt;%&ndash;// success: function(data) {&ndash;%&gt;--%>
<%--&lt;%&ndash;// // 성공적으로 데이터를 가져왔을 때의 처리&ndash;%&gt;--%>
<%--&lt;%&ndash;// if (data.length > 0) {&ndash;%&gt;--%>
<%--&lt;%&ndash;// // 가져온 데이터를 화면에 추가&ndash;%&gt;--%>
<%--&lt;%&ndash;// appendDataToPage(data);&ndash;%&gt;--%>
<%--&lt;%&ndash;// offset += limit; // offset 업데이트&ndash;%&gt;--%>
<%--&lt;%&ndash;// }&ndash;%&gt;--%>
<%--&lt;%&ndash;// }&ndash;%&gt;--%>
<%--&lt;%&ndash;// });&ndash;%&gt;--%>
<%--&lt;%&ndash;// }&ndash;%&gt;--%>
<%--&lt;%&ndash;// });&ndash;%&gt;--%>
<%--&lt;%&ndash;//&ndash;%&gt;--%>
<%--&lt;%&ndash;// function appendDataToPage(data) {&ndash;%&gt;--%>
<%--&lt;%&ndash;// // 가져온 데이터를 페이지에 추가하는 로직 작성&ndash;%&gt;--%>
<%--&lt;%&ndash;// // 예: 가져온 데이터를 반복문으로 순회하여 새로운 아이템을 생성하고 페이지에 추가&ndash;%&gt;--%>
<%--&lt;%&ndash;// }&ndash;%&gt;--%>

<%--&lt;%&ndash;let currentPage = 1;&ndash;%&gt;--%>
<%--&lt;%&ndash;let loading = false;&ndash;%&gt;--%>
<%--&lt;%&ndash;let totalPage = ${totalCampCount / 10}; // 10은 페이지당 아이템 수&ndash;%&gt;--%>

<%--&lt;%&ndash;// 스크롤 이벤트 감지&ndash;%&gt;--%>
<%--&lt;%&ndash;$(window).scroll(function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {&ndash;%&gt;--%>
<%--&lt;%&ndash;        console.log("ㅎㅇㅎㅇ");&ndash;%&gt;--%>
<%--&lt;%&ndash;        // 스크롤이 하단에 도달하면 데이터를 불러오기&ndash;%&gt;--%>
<%--&lt;%&ndash;        if (!loading) {&ndash;%&gt;--%>
<%--&lt;%&ndash;            loading = true;&ndash;%&gt;--%>
<%--&lt;%&ndash;            console.log("ㅎㅇㅎㅇ");&ndash;%&gt;--%>
<%--&lt;%&ndash;            loadData();&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;});&ndash;%&gt;--%>

<%--&lt;%&ndash;// 데이터 불러오기 함수&ndash;%&gt;--%>
<%--&lt;%&ndash;function loadData() {&ndash;%&gt;--%>
<%--&lt;%&ndash;    $('.loading').show();&ndash;%&gt;--%>
<%--&lt;%&ndash;    // Ajax&ndash;%&gt;--%>
<%--&lt;%&ndash;    $.ajax({&ndash;%&gt;--%>
<%--&lt;%&ndash;        type: 'GET',&ndash;%&gt;--%>
<%--&lt;%&ndash;        url: '/camp/c_list',&ndash;%&gt;--%>
<%--&lt;%&ndash;        data: { page: currentPage },&ndash;%&gt;--%>
<%--&lt;%&ndash;        success: function(data) {&ndash;%&gt;--%>
<%--&lt;%&ndash;            if (data.length > 0) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                // 데이터가 있을 경우 화면에 추가&ndash;%&gt;--%>
<%--&lt;%&ndash;                appendPage(data);&ndash;%&gt;--%>
<%--&lt;%&ndash;                currentPage++;&ndash;%&gt;--%>
<%--&lt;%&ndash;            } else {&ndash;%&gt;--%>
<%--&lt;%&ndash;                $('.loading').hide();&ndash;%&gt;--%>
<%--&lt;%&ndash;            }&ndash;%&gt;--%>
<%--&lt;%&ndash;            loading = false;&ndash;%&gt;--%>
<%--&lt;%&ndash;        },&ndash;%&gt;--%>
<%--&lt;%&ndash;        error: function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;            console.error('에러');&ndash;%&gt;--%>
<%--&lt;%&ndash;            loading = false;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    });&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>
<%--&lt;%&ndash;function appendPage(data) {&ndash;%&gt;--%>
<%--&lt;%&ndash;    let newItemHtml = ``;&ndash;%&gt;--%>
<%--&lt;%&ndash;console.log("data.length: " +data.length)&ndash;%&gt;--%>
<%--&lt;%&ndash;    for (let i = 0; i < data.length; i++) {&ndash;%&gt;--%>
<%--&lt;%&ndash;        let campli = data[i];&ndash;%&gt;--%>
<%--&lt;%&ndash;        newItemHtml += `&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:forEach var="campli" items="${camplist}">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="CL_item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <a href="<c:url value='/camp/c_list/${campli.c_ID}'/>">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <img src="<c:url value='/img/Camp_img/2.png'/>" alt=""></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="CL_txtbox">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="CL_desc">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="CLD_L">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="CL_CampName">${campli.c_name}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="CL_score">평점 : ${campli.c_score}점</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="CL_Address">주소 : ${campli.c_region}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="CLD_R">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="CL_Price"><fmt:formatNumber value="${campli.c_Price}" pattern="###,###"/> 원</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div></div> </c:forEach>`;&ndash;%&gt;--%>
<%--&lt;%&ndash;        $('#itemList').append(newItemHtml);&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>

<%--&lt;%&ndash;    return newItemHtml;&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>


<%--// $(window).on("scroll",function() {--%>
<%--//     //위로 스크롤 된 길이--%>
<%--//     let scrollTop=$(window).scrollTop();--%>
<%--//     //웹브라우저 창의 높이--%>
<%--//     let windowHeight=$(window).height();--%>
<%--//     //문서의 전체높이--%>
<%--//     let documentHeight=$(document).height();--%>
<%--//     //바닥까지 스크롤 되어있는지 여부--%>
<%--//     let isBottom=scrollTop+windowHeight + 10 >= documentHeight;--%>

<%--&lt;%&ndash;    if(isBottom){&ndash;%&gt;--%>
<%--&lt;%&ndash;        //이게 마지막 페이지면&ndash;%&gt;--%>
<%--&lt;%&ndash;        if(currentPage == ${totalPage} || isLoading){&ndash;%&gt;--%>
<%--&lt;%&ndash;            return false; //끝&ndash;%&gt;--%>
<%--&lt;%&ndash;        } else {&ndash;%&gt;--%>
<%--&lt;%&ndash;        isLoading=true;&ndash;%&gt;--%>
<%--&lt;%&ndash;        $("$loding").show();&ndash;%&gt;--%>
<%--&lt;%&ndash;        currentPage++; // 위에서 종료 안되면 true가 되서&ndash;%&gt;--%>
<%--&lt;%&ndash;        console.log("inscroll"+currentPage);&ndash;%&gt;--%>
<%--&lt;%&ndash;        getcamplist(currentPage); // 추가로 받을 리스트 ajax로 처리&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;});&ndash;%&gt;--%>
<%--&lt;%&ndash;//리스트 불러올 함수&ndash;%&gt;--%>
<%--&lt;%&ndash;function getcamplist(currentPage) {&ndash;%&gt;--%>
<%--&lt;%&ndash;    $.ajax({&ndash;%&gt;--%>
<%--&lt;%&ndash;        type: "get",&ndash;%&gt;--%>
<%--&lt;%&ndash;        url: "/camp/c_list",&ndash;%&gt;--%>
<%--&lt;%&ndash;        data : {"currentPage":currentPage},&ndash;%&gt;--%>
<%--&lt;%&ndash;        success:function (data){&ndash;%&gt;--%>
<%--&lt;%&ndash;            $("#itemList").append(data);&ndash;%&gt;--%>
<%--&lt;%&ndash;            $("#loding").hide();&ndash;%&gt;--%>
<%--&lt;%&ndash;            isloding = false;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    });&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>

<%--&lt;%&ndash;const getcamplist = function (currentPage) {&ndash;%&gt;--%>
<%--&lt;%&ndash;    console.log("inGetList" + currentPage);&ndash;%&gt;--%>
<%--&lt;%&ndash;    //스크롤&ndash;%&gt;--%>
<%--&lt;%&ndash;    $.ajax({&ndash;%&gt;--%>
<%--&lt;%&ndash;        method: "GET",&ndash;%&gt;--%>
<%--&lt;%&ndash;        url: "camp/c_list",&ndash;%&gt;--%>
<%--&lt;%&ndash;        //검색기능 생길때 추가&ndash;%&gt;--%>

<%--&lt;%&ndash;    })&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>

<%--// if ($(window).scrollTop() == $(document).height() - $(window).height()) {--%>
<%--// // 스크롤이 페이지 하단에 도달하면 추가 데이터를 가져오는 Ajax 요청--%>
<%--// $.ajax({--%>
<%--// type: 'GET',--%>
<%--// url: '/camp/c_list',--%>
<%--// data: { offset: offset, limit: limit },--%>
<%--// success: function(data) {--%>
<%--// // 성공적으로 데이터를 가져왔을 때의 처리--%>
<%--// if (data.length > 0) {--%>
<%--// // 가져온 데이터를 화면에 추가--%>
<%--// appendDataToPage(data);--%>
<%--// offset += limit; // offset 업데이트--%>
<%--// }--%>
<%--// }--%>
<%--// });--%>
<%--// }--%>
<%--// });--%>
<%--//--%>
<%--// function appendDataToPage(data) {--%>
<%--// // 가져온 데이터를 페이지에 추가하는 로직 작성--%>
<%--// // 예: 가져온 데이터를 반복문으로 순회하여 새로운 아이템을 생성하고 페이지에 추가--%>
<%--// }--%>
<%--</script>&ndash;%&gt; --%>
