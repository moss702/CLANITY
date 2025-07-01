<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>

<style>
    
    body {
    font-family: 'Noto Sans';
  }
  
   .item-wrapper {
      max-width: 1200px; 
      margin: 0 auto;
      margin-top: 122.81px;
      display: flex;
      flex-wrap: wrap;
      gap: 24px;
    }
    .item {
      width: 33.33%;
      box-sizing: border-box;
    }
    .item img {width: 200px; }

    @media screen and (min-width:1200px) {
      .item {
        width: 25%;
      }
    }

    body {
      font-size: 15px;
    }
    a[style*="font-size:50px"] {
      font-size: 32px !important;
    }
    nav.fs-4 {
      font-size: 1rem !important;
      padding-top: 0.5rem !important;
      padding-bottom: 0.5rem !important;
      gap: 1rem !important;
    }
    div.fs-4 nav > div > a {
      font-size: 0.95rem !important;
    }
    button[style*="width: 600px"],
    div[style*="width: 600px"] {
      font-size: 0.9rem !important;
      padding: 0.4rem 0.8rem !important;
      width: 480px !important;
    }
    .text-center a[style*="font-size: 13px;"] {
      font-size: 12px !important;
      margin-top: 0.3rem;
    }
    ul.list-unstyled a {
      font-size: 12px !important;
      padding: 0.3rem 0.8rem !important;
    }
    .text-center img {
      width: 50px !important;
      height: 50px !important;
    }
    @media (max-width: 992px) {
      nav.fs-4 {
        font-size: 0.9rem !important;
        gap: 0.8rem !important;
      }
      a[style*="font-size:50px"] {
        font-size: 26px !important;
      }
      div[style*="width: 600px"],
      button[style*="width: 600px"] {
        width: 100% !important;
        font-size: 0.85rem !important;
        padding: 0.3rem 0.6rem !important;
      }
      .text-center img {
        width: 40px !important;
        height: 40px !important;
      }
      .text-center a[style*="font-size: 13px;"] {
        font-size: 11px !important;
      }
      ul.list-unstyled a {
        font-size: 11px !important;
        padding: 0.25rem 0.6rem !important;
      }
    }
     .category-dropdown:hover .dropdown-menu {
    display: block;
  }

  .dropdown-large {
    width: 700px;
    padding: 1rem;
  }

  .category-icons {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    border-bottom: 1px solid #eee;
    padding-bottom: 1rem;
    margin-bottom: 1rem;
  }

  .category-icons .icon-item {
    text-align: center;
    width: 80px;
  }

  .category-icons img {
    width: 36px;
    height: 36px;
    object-fit: contain;
  }

  .subcategory-list {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
  }

  .subcategory-list .sub-item {
    width: 120px;
  }
  /* 🔸 기본 검색 필터창 숨기기 */
    #searchFilterPanel {
      display: none;
      border-top: 1px solid #ccc;
      padding: 2rem;
      background-color: #fdfdfd;
    }

    /* 🔸 검색창 스타일 유지 */
    .search-bar {
      border-color: #E63946;
    }

    /* 🔸 태그 기본 스타일 조정 */
    .filter-btn {
      border: 1px solid orange;
      border-radius: 20px;
      padding: 5px 12px;
      font-size: 14px;
      background-color: white;
      color: orange;
    }

    .filter-btn i {
      margin-right: 5px;
    }
    .btn-secondary-outline {
    border: 1px solid var(--bs-secondary);
    color: var(--bs-secondary);
    background-color: white;
    transition: all 0.2s ease-in-out;
  }

  /* 클릭된 경우 스타일 */
  .btn-secondary-outline.active {
    border-color: #E63946;
    background-color: #E63946;
    color: #fff;
  }

  /* 호버 시 */
  .btn-secondary-outline:hover {
    border-color: #E63946;
    color: #E63946;
    background-color: #fff;
  }

  .btn-primary-filled {
    background-color: #E63946;
    color: #fff;
    border: none;
    transition: all 0.2s ease-in-out;
  }

  .btn-primary-filled:hover {
    background-color: #c9303e;
  }
  </style>


</head>
<body>
<header class="px-4 py-3 bg-white border-bottom">
  <div class="container d-flex justify-content-between align-items-center flex-wrap gap-3">

    <!-- CLANITY 로고 -->
    <div class="flex-shrink-0">
      <a class="text-decoration-none fw-bold fs-2 " href="#" style="color:#E63946;">CLANITY</a>
    </div>

   
    <!-- 좌측 메뉴 (카테고리 드롭다운 추가됨) -->
  <nav class="d-flex gap-3 align-items-center flex-shrink-0">
    <a class="text-dark text-decoration-none fw-semibold" href="#">클래스</a>
    <a class="text-dark text-decoration-none fw-semibold" href="#">소셜링</a>

    <!-- 드롭다운 카테고리 -->
    <div class="dropdown category-dropdown position-relative">
  <a href="#" class="text-dark text-decoration-none fw-semibold dropdown-toggle" id="categoryDropdown" data-bs-toggle="dropdown" aria-expanded="false">
    카테고리
  </a>

  <!-- 드롭다운 콘텐츠 -->
  <div class="dropdown-menu dropdown-large shadow border" aria-labelledby="categoryDropdown">
    

    <!-- 하단 세부 항목 리스트 -->
    <div class="subcategory-list">
      <div class="sub-item"><a class="dropdown-item" href="#">전체</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">클래스</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">소셜링</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">핸드메이드</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">뮤직파티</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">푸드파티</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">와인파티</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">생일파티</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">포틀럭파티</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">푸드·드링크</a></div>
      <div class="sub-item"><a class="dropdown-item" href="#">자기계발</a></div>
    </div>

  </div>
</div>
  </nav>

  <!-- 검색창 -->
  <form action="/search" method="GET" class="flex-grow-1" style="max-width: 600px; min-width: 200px;">
    <div id="searchInputWrapper" class="d-flex align-items-center gap-2 px-4 py-2 rounded-pill border search-bar">
      <input 
        type="text" 
        name="query" 
        class="form-control border-0 p-0 bg-transparent fw-semibold"
        placeholder="#취미시작은클래니티 #클래니티라이프"
        style="font-size: 14px; outline: none; color: #E63946;"
        readonly
        id="searchInput"
      />
      <button type="button" class="bg-transparent border-0" id="toggleSearchFilter">
        <i class="fa-solid fa-magnifying-glass" style="color: #E63946;"></i>
      </button>
    </div>
  </form>

  <!-- 조건 검색 박스 -->
  <div id="searchFilterBox" class="d-none bg-white border rounded shadow p-4 w-100 position-absolute start-50 translate-middle-x" style="top: 100px; max-width: 1200px; z-index: 1000; color: #E63946;">
    <!-- 탭 -->
    <div class="mb-3 d-flex gap-2 ">
      <button class="btn btn-primary-filled">클래스</button>
      <button class="btn btn-primary-filled">소셜링</button>
      <form action="/search" method="GET" class="mx-auto" style="max-width: 600px; min-width: 200px;">
        <div id="searchInputWrapper" class="d-flex align-items-center gap-2 px-4 py-2 rounded-pill border search-bar">
                <input 
                type="text" 
                name="query" 
                class="form-control border-0 p-0 bg-transparent fw-semibold"
                style="font-size: 14px; outline: none; color: #E63946;"
                readonly
                id="searchInput"
                />
                <button type="button" class="bg-transparent border-0" id="toggleSearchFilter">
                    <i class="fa-solid fa-magnifying-glass" style="color: #E63946;"></i>
                    </button>
        </div>
        </form>
    </div>

    <div class="row">
      <!-- 좌측 -->
      <div class="col-md-6">
        <div class="mb-3">
          <label class="form-label fw-semibold">지역</label>
          <select class="form-select">
            <option selected>전체</option>
            <option>서울</option>
            <option>부산</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="form-label fw-semibold">카테고리</label>
          <select class="form-select">
            <option selected>전체</option>
            <option>요리</option>
            <option>미술</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="form-label fw-semibold">요일</label>
          <div class="d-flex gap-2 flex-wrap">
            <button type="button" class="btn btn-secondary-outline toggle-btn">평일</button>
            <button type="button" class="btn btn-secondary-outline toggle-btn">토요일</button>
            <button type="button" class="btn btn-secondary-outline toggle-btn">일요일</button>
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label fw-semibold">난이도</label>
          <div class="d-flex gap-2 flex-wrap">
            <button type="button" class="btn btn-secondary-outline toggle-btn">입문</button>
            <button type="button" class="btn btn-secondary-outline toggle-btn">중급</button>
            <button type="button" class="btn btn-secondary-outline toggle-btn">고급</button>
          </div>
        </div>
      </div>

      <!-- 우측 -->
      <div class="col-md-6">
        

        <div class="mb-3">
          <label class="form-label fw-semibold">인원</label>
          <select class="form-select">
            <option selected>선택 안함</option>
            <option>1~2명</option>
            <option>3~5명</option>
            <option>6명 이상</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="form-label fw-semibold">시간</label>
          <div class="d-flex gap-2 align-items-center">
            <input type="time" class="form-control" name="start_time" style="max-width: 120px;">
            <span class="text-muted">~</span>
            <input type="time" class="form-control" name="end_time" style="max-width: 120px;">
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label fw-semibold">금액</label>
          <div class="d-flex gap-2 align-items-center">
            <input type="number" class="form-control text-center" name="min_price" placeholder="0원" style="max-width: 100px;">
            <span class="text-muted">~</span>
            <input type="number" class="form-control text-center" name="max_price" placeholder="1,000,000원" style="max-width: 140px;">
          </div>
        </div>
      </div>
    </div>

    <!-- 추천 검색어 -->
    <div class="mt-4">
      <label class="form-label fw-semibold">추천 검색어</label>
      <div class="d-flex flex-wrap gap-2">
        <button class="btn btn-secondary-outline toggle-btn">단체</button>
        <button class="btn btn-secondary-outline toggle-btn">베이킹</button>
        <button class="btn btn-secondary-outline toggle-btn">반지</button>
        <button class="btn btn-secondary-outline toggle-btn">드로잉</button>
        <button class="btn btn-secondary-outline toggle-btn">선물</button>
        <button class="btn btn-secondary-outline toggle-btn">데이트</button>
        <button class="btn btn-secondary-outline toggle-btn">향수</button>
        <button class="btn btn-secondary-outline toggle-btn">스포츠</button>
        <button class="btn btn-secondary-outline toggle-btn">목공</button>
        <button class="btn btn-secondary-outline toggle-btn">도자기</button>
        <button class="btn btn-secondary-outline toggle-btn">캔들</button>
      </div>
    </div>

    <!-- 버튼 -->
    <div class="mt-4 d-flex gap-3">
      <button class="btn btn-secondary-outline" onclick="toggleSearchBox()">닫기</button>
      <button class="btn btn-primary-filled">검색하기</button>
    </div>
  </div>



<!-- 검색창 보이게 하기 -->
<script>
   const filterBox = document.getElementById('searchFilterBox');
  const searchInput = document.getElementById('searchInput');
  const toggleBtn = document.getElementById('toggleSearchFilter');

  function toggleSearchBox() {
    filterBox.classList.toggle('d-none');
  }

  toggleBtn.addEventListener('click', toggleSearchBox);
  searchInput.addEventListener('click', toggleSearchBox);

  document.querySelectorAll('.toggle-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      btn.classList.toggle('active');
    });
  });
  </script>
    


    <!-- 우측 아이콘 -->
    <nav class="d-flex gap-3 align-items-center flex-shrink-0 text-danger">
      <i class="fa-solid fa-list fs-5"></i>
      <i class="fa-solid fa-heart fs-5"></i>
      <i class="fa-solid fa-bell fs-5"></i>
      <i class="fa-solid fa-circle-user fs-5"></i>
      <a class="text-dark text-decoration-none" href="#">+열기</a>
      <a class="text-dark text-decoration-none" href="member/login">로그인</a>
    </nav>

  </div>

</header>





</body>
</html>
