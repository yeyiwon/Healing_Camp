$(document).ready(function(){
    function getUri(){
        let temParam="";
        const searchParams = new URLSearchParams(location.search);
        for(const param of searchParams){
            console.log(param);
            tmpParam+=param[0]+"="+param[1]+"&";
        }
        return tmpParam;
    }
    $('#s_search_icon').on("click", function (){
        location.href = "<c:url value='/store/s_search'/>?page=0&option="+$('#sel_filter').val()+"&keyword="+$('#s_search_text').val().trim();
        // $('.s_cate_bar').css({
        //     display: "none"
        // })
    })
    $('#s_search_text').on("keydown", function(e){
        if(e.keyCode === 13){
            $('#s_search_icon').trigger('click');
        }
    })
})


let loadList = function(items){
    let tmp = "";
    let hasSPrice ="";

    console.log(Object.keys(items).length);

    items.forEach(function(item){

        tmp += '<div class="s_item_box">';
        tmp += '    <a href="/store/s_detail" class="s_item_a">';
        tmp += '        <img src="/app/img/item_img/'+item.i_img_URL+'" alt="" class="s_item_img">';
        tmp += '        <div class="s_item_text">';
        tmp += '            <div class="s_item_company">'+item.i_company+'</div>';
        tmp += '            <div class="s_item_title">'+item.i_name+'</div>';
        tmp += '            <div class="s_item_price">';

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