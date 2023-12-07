// 무한 스크롤을 위한 변수들
let pageNumber = 1;
const itemsPerPage = 10;

// 아이템 목록 컨테이너
const itemListContainer = document.getElementById('itemList');
// 검색된 캠핑장 개수 표시 영역
const campingCountSpan = document.getElementById('campingCount');

// 페이지 로드 시 초기 데이터 로드
window.onload = function () {
    loadItems();
};

// 스크롤 이벤트 리스너
window.addEventListener('scroll', () => {
    if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
        // 스크롤이 페이지 하단에 도달하면 새로운 아이템 로드
        loadItems();
    }
});

// 아이템 로드 함수
function loadItems() {
    // MyBatis를 통해 데이터베이스에서 아이템 데이터 가져오기 (가상의 코드)
    fetchDataFromDatabase(pageNumber, itemsPerPage)
        .then(newData => {
            newData.forEach(item => {
                const newItem = document.createElement('div');
                newItem.classList.add('CL_item');
                newItem.innerHTML = `
                    <img src="${item.imageUrl}" alt="">
                    <div class="CL_txtbox">
                        <div class="CL_desc">
                            <div class="CLD_L">
                                <div class="CL_CampName">#캠핑장이름${item.name}</div>
                                <div class="CL_score">별점${item.score}</div>
                                <div class="CL_Address">주소${item.address}</div>
                            </div>
                            <div class="CLD_R">
                                <div class="CL_Price">${item.price}원</div>
                            </div>
                        </div>
                    </div>
                `;

                itemListContainer.appendChild(newItem);
            });

            // 검색된 캠핑장 개수 업데이트
            campingCountSpan.innerText = parseInt(campingCountSpan.innerText) + newData.length;

            // 페이지 번호 증가
            pageNumber++;
        })
        .catch(error => {
            console.error('데이터를 불러오는 중 에러 발생:', error);
        });
}

// MyBatis를 통해 데이터베이스에서 아이템 데이터 가져오기 함수 (가상의 코드)