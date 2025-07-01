<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>클래니티 - 클래스 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f8f9fa;
    }
    .category-icon img {
      width: 60px;
      height: 60px;
    }
    .card-img-top {
      object-fit: cover;
      height: 180px;
    }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">
  <%@ include file="../common/header.jsp" %>

  <main class="container py-5 flex-grow-1">
    <!-- 추천 이미지 배너 -->
    <div id="mainCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F1749630156_pc_main_banner_summersweet.png&w=1920&q=75" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F1749629821_pc_main_banner_summersea.png&w=1920&q=75" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F17440769269_pc_main_banner_club.png&w=1920&q=75" class="d-block w-100" alt="...">
        </div>
      </div>
    </div>

    <!-- 카테고리 아이콘 -->
    <div class="d-flex justify-content-center flex-wrap gap-4 mb-4">
      <div class="text-center category-icon">
        <a href="#" class="text-decoration-none text-secondary">
          <img src="https://images.munto.kr/meta/angle_weekend.svg" class="rounded mb-2">
          <div>추천 클래스</div>
        </a>
      </div>
      <div class="text-center category-icon">
        <a href="#" class="text-decoration-none text-secondary">
          <img src="https://images.munto.kr/meta/angle_recommendhost.svg" class="rounded mb-2">
          <div>추천 소셜링</div>
        </a>
      </div>
      <div class="text-center category-icon">
        <a href="#" class="text-decoration-none text-secondary">
          <img src="https://images.munto.kr/meta/1738802826_ic_angle_bigband_40px.svg" class="rounded mb-2">
          <div>커뮤니티</div>
        </a>
      </div>
      <div class="text-center category-icon">
        <a href="#" class="text-decoration-none text-secondary">
          <img src="https://images.munto.kr/meta/angle_space.svg?1" class="rounded mb-2">
          <div>내근처활동</div>
        </a>
      </div>
      <div class="text-center category-icon">
        <a href="#" class="text-decoration-none text-secondary">
          <img src="https://images.munto.kr/meta/1750388625_VOD_angle.svg" class="rounded mb-2">
          <div>카테고리</div>
        </a>
      </div>
    </div>

    <!-- 추천 키워드 태그 -->
    <div class="mb-4 text-center">
      <div class="d-inline-flex flex-wrap gap-2 justify-content-center">
        <a href="#" class="btn btn-sm rounded-pill" style="border: 1px solid #E63946; color: #E63946;">#단체</a>
        <a href="#" class="btn btn-sm rounded-pill" style="border: 1px solid #E63946; color: #E63946;">#혼자참여</a>
        <a href="#" class="btn btn-sm rounded-pill" style="border: 1px solid #E63946; color: #E63946;">#실내활동</a>
        <a href="#" class="btn btn-sm rounded-pill" style="border: 1px solid #E63946; color: #E63946;">#야외클래스</a>
        <a href="#" class="btn btn-sm rounded-pill" style="border: 1px solid #E63946; color: #E63946;">#주말추천</a>
        <a href="#" class="btn btn-sm rounded-pill" style="border: 1px solid #E63946; color: #E63946;">#소셜모임</a>
      </div>
    </div>

    <!-- 추천 클래스 섹션 -->
    <section class="mb-5">
      <div class="row row-cols-1 row-cols-md-3 row-cols-lg-5 g-4">
        <% for(int i=0; i<5; i++) { %>
          <div class="col">
            <a href="${pageContext.request.contextPath}/classDetailedPage" class="text-decoration-none text-dark">
              <div class="card h-100">
                <img src="https://www.munto.kr/_next/image?url=http%3A%2F%2Fimages.munto.kr%2Fproduction-socialing%2F1749734559696-photo-5f7et-471758-0&w=1920&q=75" class="card-img-top">
                <div class="card-body">
                  <h6 class="fw-bold">고양이선생님(강사)</h6>
                  <p class="card-text small">🦩너와나 &lt;이어지는 글 파티&gt;<br>글쓰기 과제는 선착순 8명만 진행!</p>
                  <span class="fw-bold" style="color: #E63946;">35,000원</span>
                </div>
              </div>
            </a>
          </div>
        <% } %>
      </div>
    </section>
  </main>

  <%@ include file="../common/footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
