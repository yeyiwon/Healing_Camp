$(function() {
    // 동의 모두선택 / 해제
    const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[name=agree]');
    for(let i = 0; i < agreeChk.length; i++){
        agreeChk[i].checked = e.target.checked;
    }
    });
})
function agreeCheck(frm){
    if (frm.checkButton.disabled==true)
        frm.checkButton.disabled=false
    else
        frm.checkButton.disabled=true
}

$(document).ready(function() {
    $('.agree_all').click(function(){
        if($('consent_next_btn').css) {
            background: 'rgb(221, 226, 227)'
        }
        else {
            
        }
    });
})