$(document).ready(function () {
    // 네비게이션 바 고정
    let h_o_top = $('.CD_nav').offset().top

    $(window).scroll(function(){
      if(h_o_top <= $(window).scrollTop())
      {
          $('.CD_nav').css({
              position: 'fixed',
              top: 0,
              left: "50%",
              transform:'translate(-50%, 0)',
              width: 1300,

              // background: 'reba(0, 0, 0, 0.5)'
          })
      }
      else {
          $('.CD_nav').css({
              position: 'absolute',
              top: 925,
              left: 0,
              transform:'translate(0%, 0)',
              width: "100%",
              background: 'reba(0, 0, 0, 0.5)'
          })

      }
    })

    $('.Camptop_btn').click(function(){
        $('html, body').animate({
            scrollTop: 0
        }, 800)
    })

  });