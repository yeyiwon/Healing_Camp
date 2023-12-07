

  //   var isLoggedIn = false;
  //
  //   $('#likeButton').click(function () {
  //       // 로그인 상태 체크
  //       if (isLoggedIn) {
  //           // 찜 버튼을 클릭할 때마다 active 클래스를 토글
  //           $(this).toggleClass('CD_like_button_active');
  //       } else {
  //           // 로그인되어 있지 않은 경우 로그인 페이지로 이동하거나 다른 처리 수행
  //           alert('로그인이 필요합니다.');
  //           // 예시: 로그인 페이지로 이동하는 코드
  //           window.location.href = '/login';
  //       }
  //   });
  //
  //   function checkLoginStatus() {
  //   if (user.loggedIn) {
  //       $("#myPage").append("<button id='addToWishListBtn'>찜리스트에 추가</button>");
  //
  //     // 찜리스트에 추가 버튼 클릭 시 동작
  //       $("#addToWishListBtn").on("click", function() {
  //       var itemName = prompt("찜리스트에 추가할 항목을 입력하세요:");
  //       if (itemName) {
  //           addToWishList(itemName);
  //       }
  //       });
  //   } else {
  //       $("#myPage").append("<p>로그인이 필요합니다.</p>");
  //   }
  // }
  // });


/* <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
  $(document).ready(function () {
    var isLoggedIn = false;

    function updateLoginStatus() {
      $('#status').text(isLoggedIn ? '로그인' : '로그아웃');
    }

    // 로그인 상태 업데이트 호출 (페이지 로드시 한번 호출)
    updateLoginStatus();

    // 찜 버튼 클릭 이벤트
    $('#likeButton').click(function () {
      // 로그인 상태 체크
      if (isLoggedIn) {
        // 찜 버튼을 클릭할 때마다 active 클래스를 토글
        $(this).toggleClass('active');
      } else {
        // 로그인되어 있지 않은 경우 로그인 페이지로 이동하거나 다른 처리 수행
        alert('로그인이 필요합니다.');
        // 예시: 로그인 페이지로 이동하는 코드
        // window.location.href = '/login';
      }
    });

    // 로그인 버튼 클릭 이벤트 (예시로 로그인 상태를 토글하는 함수)
    $('#loginStatus').click(function () {
      isLoggedIn = !isLoggedIn;
      updateLoginStatus();
    });
  });
</script> */

// function checkLoginStatus() {
//     if (user.loggedIn) {
//       $("#myPage").append("<button id='addToWishListBtn'>찜리스트에 추가</button>");

//       // 찜리스트에 추가 버튼 클릭 시 동작
//       $("#addToWishListBtn").on("click", function() {
//         var itemName = prompt("찜리스트에 추가할 항목을 입력하세요:");
//         if (itemName) {
//           addToWishList(itemName);
//         }
//       });
//     } else {
//       $("#myPage").append("<p>로그인이 필요합니다.</p>");
//     }
//   }