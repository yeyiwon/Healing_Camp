// 마우스 커서
    document.addEventListener('DOMContentLoaded', function() {
    var navListItems = document.querySelectorAll('.CL_nav_ul');
    navListItems.forEach(function(item) {
});
    item.addEventListener('mouseover', function() {
    document.body.style.cursor = 'url("${pageContext.request.contextPath}/img/firecursor3.png"), auto';
});
    item.addEventListener('mouseout', function() {
    document.body.style.cursor = 'auto'; // 기본 커서로 변경
});

    var ListCursor = document.querySelectorAll('.CL_item');
    ListCursor.forEach(function(item2) {
    item2.addEventListener('mouseover', function() {
    document.body.style.cursor = 'url("${pageContext.request.contextPath}/img/firecursor2.png"), auto';
});

    item2.addEventListener('mouseout', function() {
    document.body.style.cursor = 'auto'; // 기본 커서로 변경
});
});
});
