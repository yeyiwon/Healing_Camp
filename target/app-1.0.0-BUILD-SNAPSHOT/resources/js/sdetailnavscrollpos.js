$(document).ready(function(){

  $(".CD_nav_ul li a").click(function () {
  var target = $(this).attr("href");
  var targetOffset = $(target).offset().top - $(".CD_nav").height() + 1;

  $("html, body").animate({ scrollTop: targetOffset }, 600);
  // 애니
    return false;

});

let CDnav1_o_top= $('#CDnav1').offset().top;

let CDnav2_o_top= $('#CDnav2').offset().top;

let CDnav3_o_top= $('#CDnav3').offset().top;

let CDnav4_o_top= $('#CDnav4').offset().top;

$(window).scroll(function () {
  var scrollPos = $(window).scrollTop() + 160;

  if(scrollPos > CDnav4_o_top) {
    $(".CD_nav_ul li a").removeClass("active");
    $(".CD_nav_ul li").eq(3).children('a').addClass("active");
  }
  else if(scrollPos > CDnav3_o_top) {
    console.log("3번이 닿음");
    $(".CD_nav_ul li a").removeClass("active");
    $(".CD_nav_ul li").eq(2).children('a').addClass("active");
  }
  else if(scrollPos > CDnav2_o_top) {
    console.log("2번이 닿음");
    $(".CD_nav_ul li a").removeClass("active");
    $(".CD_nav_ul li").eq(1).children('a').addClass("active");
  }
  else if(scrollPos > CDnav1_o_top) {
    $(".CD_nav_ul li a").removeClass("active");
    $(".CD_nav_ul li").eq(0).children('a').addClass("active");
  }


//   $(".CD_nav_ul li a").each(function () {
//     var s_top = $(this);
//     var refElement = $(s_top.attr("href"));
// console.log(s_top)
//     console.log(refElement.position().top, scrollPos, refElement.position().top + refElement.height())
//
//     if (
//       refElement.position().top <= scrollPos &&
//       scrollPos < refElement.position().top + refElement.height()
//     ) {
//       $(".CD_nav_ul li a").removeClass("active");
//       s_top.addClass("active");
//     } else {
//       s_top.removeClass("active");
//     }
//
//   });
})

});

