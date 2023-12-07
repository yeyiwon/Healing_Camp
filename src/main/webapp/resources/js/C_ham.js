$(document).ready(function() {

    let chk = true;

    $('.hamberg').click(function(){
        /* 메뉴판 */
        $('.menu_pan').toggleClass('menu_pan_active')

        /* X자 */
        if(chk) { 
            $('#line_top').css({
                transform: 'translateY(10px)',
            })
            setTimeout(function(){
                $('#line_top').css({
                    transform: 'translateY(10px) rotate(45deg)',
                })
            }, 500)

            setTimeout(function(){
                $('#line_mid').css({
                    transform: 'scale(0)'
                })
            }, 500)

            $('#line_bot').css({
                transform: 'translateY(-10px)',
            })
            setTimeout(function(){
                $('#line_bot').css({
                    transform: 'translateY(-10px) rotate(-45deg)',
                })
            }, 500)
        }
        else { 
            $('#line_top').css({
                transform: 'translateY(10px) rotate(0)',
            })
            setTimeout(function(){
                $('#line_top').css({
                    transform: 'translateY(0)',
                })
            }, 500)

            setTimeout(function(){
                $('#line_mid').css({
                    transform: 'scale(1)'
                })
            }, 500)

            $('#line_bot').css({
                transform: 'translateY(-10px) rotate(0)',
            })
            setTimeout(function(){
                $('#line_bot').css({
                    transform: 'translateY(0)',
                })
            }, 500)
        }
        chk = !chk;
    })        
})