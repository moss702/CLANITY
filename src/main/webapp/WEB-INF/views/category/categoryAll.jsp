<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 
  <%@ include file="../common/head.jsp"%>

<style>
    
    body {
    font-family: 'Noto Sans', sans-serif;
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
<%@ include file="../common/header.jsp"%>
  <!-- Main -->
  <main class="d-flex justify-content-center flex-fill px-4 py-5">
  <div class="d-flex w-100 align-items-stretch" style="max-width: 1200px;">
    <!-- Sidebar -->
    <aside class="pe-4 border-end" style="width: 200px; flex-shrink: 0; align-self: flex-start; max-height: 100%;">
      <h6 class="fw-bold mb-3">카테고리전체</h6>
      <ul class="list-unstyled d-flex flex-column gap-1">
        <li><a href="#" class="text-dark text-decoration-none pb-2">컨셉파티</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">홈파티</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">내향인파티</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">뮤직파티</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">푸드파티</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">와인파티</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">생일파티</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">포틀럭파티</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">푸드·드링크</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">자기계발</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">N잡·재테크</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">외국어</a></li>
        <li><a href="#" class="text-dark text-decoration-none pb-2">소셜게임</a></li>
      </ul>
    </aside>

   
      <!-- Cards -->
      <section class="flex-grow-1 ps-4">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
          <!-- 반복 카드 예시 -->
          <div class="col">
            <div class="card h-100">
              <img src="https://www.munto.kr/_next/image?url=http%3A%2F%2Fimages.munto.kr%2Fproduction-socialing%2F1749734559696-photo-5f7et-471758-0&w=1920&q=75" class="card-img-top">
              <div class="card-body">
                <h6 class="fw-bold mb-1">강사명</h6>
                <p class="card-text">설명 요약</p>
                <span class="fw-bold">35,000원</span>
              </div>
            </div>
          </div>
          <!-- 필요한 카드 col 계속 복사 -->
           <div class="col">
            <div class="card h-100">
              <img src="https://www.munto.kr/_next/image?url=http%3A%2F%2Fimages.munto.kr%2Fproduction-socialing%2F1749734559696-photo-5f7et-471758-0&w=1920&q=75" class="card-img-top">
              <div class="card-body">
                <h6 class="fw-bold mb-1">강사명</h6>
                <p class="card-text">설명 요약</p>
                <span class="fw-bold">35,000원</span>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100">
              <img src="https://www.munto.kr/_next/image?url=http%3A%2F%2Fimages.munto.kr%2Fproduction-socialing%2F1749734559696-photo-5f7et-471758-0&w=1920&q=75" class="card-img-top">
              <div class="card-body">
                <h6 class="fw-bold mb-1">강사명</h6>
                <p class="card-text">설명 요약</p>
                <span class="fw-bold">35,000원</span>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100">
              <img src="https://www.munto.kr/_next/image?url=http%3A%2F%2Fimages.munto.kr%2Fproduction-socialing%2F1749734559696-photo-5f7et-471758-0&w=1920&q=75" class="card-img-top">
              <div class="card-body">
                <h6 class="fw-bold mb-1">강사명</h6>
                <p class="card-text">설명 요약</p>
                <span class="fw-bold">35,000원</span>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100">
              <img src="https://www.munto.kr/_next/image?url=http%3A%2F%2Fimages.munto.kr%2Fproduction-socialing%2F1749734559696-photo-5f7et-471758-0&w=1920&q=75" class="card-img-top">
              <div class="card-body">
                <h6 class="fw-bold mb-1">강사명</h6>
                <p class="card-text">설명 요약</p>
                <span class="fw-bold">35,000원</span>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="card h-100">
              <img src="https://www.munto.kr/_next/image?url=http%3A%2F%2Fimages.munto.kr%2Fproduction-socialing%2F1749734559696-photo-5f7et-471758-0&w=1920&q=75" class="card-img-top">
              <div class="card-body">
                <h6 class="fw-bold mb-1">강사명</h6>
                <p class="card-text">설명 요약</p>
                <span class="fw-bold">35,000원</span>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </main>
 <%@ include file="../common/footer.jsp" %>

</body>
</html>
