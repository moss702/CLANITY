<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="views/common/head.jsp" %>
<style >
body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f8f9fa;
    }
</style>
</head>
<body class="d-flex flex-column min-vh-100">

<%@ include file="views/common/header.jsp" %>

<main class="flex-grow-1 container">

  <c:if test="${not empty member}">
    <h1>로그인 테스트, 로그인 되었습니다</h1>
    <span>${member.email} 님 환영합니다</span>
    <a href="${cp}/member/logout">로그아웃</a>
    <a href="${cp}/mypage">마이페이지</a>
    <h3>${member}</h3>
    <a href="${cp}/admin">관리자 페이지</a>
  </c:if>

  <!-- ✅ 캐러셀 (main 영역 내 위치) -->
  <div id="mainCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F1749630156_pc_main_banner_summersweet.png&w=1920&q=75"
             class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F1749629821_pc_main_banner_summersea.png&w=1920&q=75"
             class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F17440769269_pc_main_banner_club.png&w=1920&q=75"
             class="d-block w-100" alt="...">
      </div>
    </div>
  </div>
   <!-- 카드리스트  -->
  <div>
  <div class="col-md-9 col-lg-10 ">
				<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:forEach items="${cards}" var="c">
				<div class="col" title="${c.title}">
				<a href="${cp}/classDetailedPage?classId=${c.classId}&openId=${c.openId}"  class="text-decoration-none text-dark w-100 h-100"
				style="display: block;">
					<div class="card h-100 border border-2 rounded-4 shadow-sm mx-auto" style="width: 250px; border-color: #E63946;">
						<!-- 이미지 영역 -->
						<div class="position-relative">
							<c:if test="${empty c.thumbnailImages}">
								<c:set var="src" value="https://placehold.co/500x300?text=No+Image" />
							</c:if>
							<c:if test="${not empty c.thumbnailImages}">
								<c:set var="src" value="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/${c.attachs[0].path}/${c.attachs[0].uuid}" />
							</c:if>
							<img src="${src}" class="card-img-top" alt="썸네일" style="width: 100%; height: 170px; object-fit: cover;">
							<span class="badge bg-light text-dark position-absolute top-0 start-0 m-2 small fw-bold px-2 py-1 rounded-pill">${c.classType}</span> <i
								class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
						</div>
						<!-- 본문 -->
						<div class="card-body px-3 py-3">
							<!-- 카테고리 태그 -->
							<span class="badge bg-light text-dark mb-2 px-2 py-1">${c.categoryId}</span>
							<c:set var="category" value="${categoryById[c.categoryId]}" />

							<div class="category-badges mb-2">
							  	<span class="badge bg-light text-dark rounded-pill border me-1">
									  ${category.parentCategory}
							  	</span>
								<c:if test="${not empty category.childCategory}">
								<span class="badge bg-secondary text-white rounded-pill">
										${category.childCategory}
								</span>
								</c:if>
							</div>
							<!-- 클래스 제목 -->
							<div class="fw-bold mb-2 text-truncate" ><i class="bi bi-calendar-heart text-danger me-1"></i>${c.title}</div>
							<!-- 강사 정보 -->
							<div class="d-flex align-items-center mb-2">
								<c:if test="${empty c.instructorImageUrl}">
									<c:set var="instSrc"
										value="https://placehold.co/24x24?text=No+Image" />
								</c:if>
								<c:if test="${not empty c.instructorImageUrl}">
									<c:set var="instSrc" value="${c.instructorImageUrl}" />
								</c:if>
								<img src="${instSrc}" class="rounded-circle me-2" width="24" height="24" alt="강사"> <span class="fw-medium small">${c.instructorName}</span></div>
							<!-- 장소 -->
							<div class="small mb-2">
								<span class="badge bg-light text-dark px-2 py-1">
									<i class="bi bi-geo-alt me-1"></i> ${c.region}
								</span>
							</div>
						</div>

						<!-- 하단 가격 -->
						<div class="card-footer bg-white border-0 px-3 pb-3 small">
							<div class="d-flex justify-content-between align-items-center">
								<div class="text-danger fw-bold">${c.discount}%</div>
								<div>
									<span class="fw-bold" style="color: #E63946;">${c.discountPrice}원</span>
									<span class="text-muted text-decoration-line-through me-2 small">${c.price}원</span>
								</div>
							</div>
						</div>
					</div>
					</a>
				</div>
			</c:forEach>
  </div>
</main>


  <%@ include file="views/common/footer.jsp" %>


</body>
</html>
