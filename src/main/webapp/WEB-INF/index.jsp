<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="views/common/head.jsp"%>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f8f9fa;
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">

	<%@ include file="views/common/header.jsp"%>

	<main class="flex-grow-1 container p-4">

		<%-- <c:if test="${not empty member}">
    <h1>로그인 테스트, 로그인 되었습니다</h1>
    <span>${member.email} 님 환영합니다</span>
    <a href="${cp}/member/logout">로그아웃</a>
    <a href="${cp}/mypage">마이페이지</a>
    <h3>${member}</h3>
    <a href="${cp}/admin">관리자 페이지</a>
  </c:if> --%>

		<!-- ✅ 캐러셀 (main 영역 내 위치) -->
		<div id="mainCarousel" class=" carousel slide mb-5"
			data-bs-ride="carousel">
			<a class="text-dark text-decoration-none d-block"
				href="http://localhost:8080/CLANITY/categoryList?categoryId=10003">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F1749630156_pc_main_banner_summersweet.png&w=1920&q=75"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img
							src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F1749629821_pc_main_banner_summersea.png&w=1920&q=75"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img
							src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F17440769269_pc_main_banner_club.png&w=1920&q=75"
							class="d-block w-100" alt="...">
					</div>
				</div>
			</a>
		</div>
		
			<div class="d-flex align-items-center justify-content-center gap-4 m-2 p-2" >
			  <!-- 핸드메이드 -->
			  <div class="text-center" style="width:100px;">
			    <a href="${cp}/categoryList?categoryId=10004" class="text-decoration-none text-dark d-block mt-2 fw-semibold" style="font-size:13px;">
			      <i class="fa-solid fa-scissors fa-2x" style="color:#A8D5BA;"></i>
			      <div>핸드메이드</div>
			    </a>
			  </div>
			
			  <!-- 쿠킹 -->
			  <div class="text-center" style="width:100px;">
			    <a href="${cp}/categoryList?categoryId=10019" class="text-decoration-none text-dark d-block mt-2 fw-semibold" style="font-size:13px;">
			      <i class="fa-solid fa-utensils fa-2x" style="color:#FFCCB6;"></i>
			      <div>쿠킹</div>
			    </a>
			  </div>
			
			  <!-- 드로잉 -->
			  <div class="text-center" style="width:100px;">
			    <a href="${cp}/categoryList?categoryId=10028" class="text-decoration-none text-dark d-block mt-2 fw-semibold" style="font-size:13px;">
			      <i class="fa-solid fa-palette fa-2x" style="color:#D6C8FF;"></i>
			      <div>드로잉</div>
			    </a>
			  </div>
			
			  <!-- 레저스포츠 -->
			  <div class="text-center" style="width:100px;">
			    <a href="${cp}/categoryList?categoryId=10050" class="text-decoration-none text-dark d-block mt-2 fw-semibold" style="font-size:13px;">
			      <i class="fa-solid fa-person-running fa-2x" style="color:#A8DAFF;"></i>
			      <div>레저스포츠</div>
			    </a>
			  </div>
			
			  <!-- 자기계발 -->
			  <div class="text-center" style="width:100px;">
			    <a href="${cp}/categoryList?categoryId=10073" class="text-decoration-none text-dark d-block mt-2 fw-semibold" style="font-size:13px;">
			      <i class="fa-solid fa-book-open-reader fa-2x" style="color:#F7C1D9;"></i>
			      <div>자기계발</div>
			    </a>
			  </div>
			</div>
		</div>
		<div class="d-flex justify-content-between align-items-center p-2 m-2">
			  <div>
			    <h3 class="mb-0">Clanity의 다양한 클래스를 경험해 보세요!</h3>
			  </div>
			  <div>
			    <a href="${cp}/categoryList?categoryId=10003"
			       class="btn btn-outline-danger rounded-pill px-4 py-2 fw-semibold">
			       클래스 더 보러가기
			    </a>
			  </div>
			</div>

		<!-- 카드리스트  -->
		<div class="row row-cols-1 row-cols-md-4 g-4 m-2 " >
			<!-- 카드 1 -->
			<div class="col">
				<a class="text-dark text-decoration-none d-block"
					href="http://localhost:8080/CLANITY/classDetailedPage?classId=13049&openId=11480">
					<div class="card h-100 border border-2 rounded-4 shadow-sm mx-auto"
						style="width: 260px; border-color: #E63946;">
						<div class="position-relative">
							<img
								src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/5f68062d611d0f0d8d820e20/thumbnail_image/1.jpg"
								class="card-img-top" alt="썸네일"
								style="width: 100%; height: 140px; object-fit: cover;"> <span
								class="badge bg-warning text-dark position-absolute top-0 start-0 m-2 fw-bold px-2 py-1 small">원데이클래스</span>
							<i
								class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
						</div>
						<div class="card-body px-3 py-2">
							<div class="category-badges mb-1">
								<span class="badge bg-light text-dark border me-1">핸드메이드</span>
								<span class="badge bg-secondary text-white">전체</span>
							</div>
							<div class="fw-bold mb-2"
								style="font-size: 14px; line-height: 1.3; height: 2.6em; overflow: hidden;">
								<i class="bi bi-calendar-heart text-danger me-1"></i>앙금플라워 떡케이크
								원데이클래스 - 꽃비채케이크
							</div>
							<div class="d-flex align-items-center mb-1">
								<img
									src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/5f68062d611d0f0d8d820e20/thumbnail_image/1.jpg"
									class="rounded-circle me-2" width="22" height="22" alt="강사">
								<span class="fw-bold small">꽃비채케이크</span>
							</div>
							<div class="small mb-2">
								<span class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>중급</span> <span
									class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>부산</span>
							</div>
						</div>
						<div class="card-footer bg-white border-0 px-3 pb-2 small">
							<div class="d-flex">
								<div class="ms-auto">
									<span class="fw-bold fs-6" style="color: #E63946;">50,000원</span>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>

			<!-- 카드 2 -->
			<div class="col">
				<a class="text-dark text-decoration-none d-block"
					href="http://localhost:8080/CLANITY/classDetailedPage?classId=13051&openId=11482">
					<div class="card h-100 border border-2 rounded-4 shadow-sm mx-auto"
						style="width: 260px; border-color: #E63946;">

						<div class="position-relative">
							<img
								src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/5f51c67765c28a0d18e7354f/thumbnail_image/1.jpg"
								class="card-img-top" alt="썸네일"
								style="width: 100%; height: 140px; object-fit: cover;"> <span
								class="badge bg-warning text-dark position-absolute top-0 start-0 m-2 fw-bold px-2 py-1 small">원데이클래스</span>
							<i
								class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
						</div>
						<div class="card-body px-3 py-2">
							<div class="category-badges mb-1">
								<span class="badge bg-light text-dark border me-1">쿠킹</span> <span
									class="badge bg-secondary text-white">떡·앙금</span>
							</div>
							<div class="fw-bold mb-2"
								style="font-size: 14px; line-height: 1.3; height: 2.6em; overflow: hidden;">
								<i class="bi bi-calendar-heart text-danger me-1"></i>마크라메 네트백
								만들기 클래스
							</div>
							<div class="d-flex align-items-center mb-1">
								<img
									src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/5f51c67765c28a0d18e7354f/thumbnail_image/1.jpg"
									class="rounded-circle me-2" width="22" height="22" alt="강사">
								<span class="fw-bold small">이하연</span>
							</div>
							<div class="small mb-2">
								<span class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>초급</span> <span
									class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>부산</span>
							</div>
						</div>
						<div class="card-footer bg-white border-0 px-3 pb-2 small">
							<div class="d-flex">
								<div class="ms-auto">
									<span class="fw-bold fs-6" style="color: #E63946;">30,000원</span>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>

			<!-- 카드 3 -->
			<div class="col">
				<a class="text-dark text-decoration-none d-block"
					href="http://localhost:8080/CLANITY/classDetailedPage?classId=12907&openId=11338">
					<div class="card h-100 border border-2 rounded-4 shadow-sm mx-auto"
						style="width: 260px; border-color: #E63946;">
						<div class="position-relative">
							<img
								src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/61fc92a14bade14dcd62fcf0/thumbnail_image/1.jpg"
								class="card-img-top" alt="썸네일"
								style="width: 100%; height: 140px; object-fit: cover;"> <span
								class="badge bg-warning text-dark position-absolute top-0 start-0 m-2 fw-bold px-2 py-1 small">원데이클래스</span>
							<i
								class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
						</div>
						<div class="card-body px-3 py-2">
							<div class="category-badges mb-1">
								<span class="badge bg-light text-dark border me-1">핸드메이드</span>
								<span class="badge bg-secondary text-white">전체</span>
							</div>
							<div class="fw-bold mb-2"
								style="font-size: 14px; line-height: 1.3; height: 2.6em; overflow: hidden;">
								<i class="bi bi-calendar-heart text-danger me-1"></i>실크플라워 소품으로
								집꾸미기
							</div>
							<div class="d-flex align-items-center mb-1">
								<img
									src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/61fc92a14bade14dcd62fcf0/thumbnail_image/1.jpg"
									class="rounded-circle me-2" width="22" height="22" alt="강사">
								<span class="fw-bold small">마롤즈</span>
							</div>
							<div class="small mb-2">
								<span class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>초급</span> <span
									class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>부산</span>
							</div>
						</div>
						<div class="card-footer bg-white border-0 px-3 pb-2 small">
							<div class="d-flex">
								<div class="ms-auto">
									<span class="fw-bold fs-6" style="color: #E63946;">40,000원</span>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>

			<!-- 카드 4 -->
			<div class="col">
				<a class="text-dark text-decoration-none d-block"
					href="http://localhost:8080/CLANITY/classDetailedPage?classId=12980&openId=11411">
					<div class="card h-100 border border-2 rounded-4 shadow-sm mx-auto"
						style="width: 260px; border-color: #E63946;">
						<div class="position-relative">
							<img
								src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/60c42126ec431259ac6871c1/thumbnail_image/1.jpg"
								class="card-img-top" alt="썸네일"
								style="width: 100%; height: 140px; object-fit: cover;"> <span
								class="badge bg-warning text-dark position-absolute top-0 start-0 m-2 fw-bold px-2 py-1 small">원데이클래스</span>
							<i
								class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
						</div>
						<div class="card-body px-3 py-2">
							<div class="category-badges mb-1">
								<span class="badge bg-light text-dark border me-1">반려동물</span> <span
									class="badge bg-secondary text-white">전체</span>
							</div>
							<div class="fw-bold mb-2"
								style="font-size: 14px; line-height: 1.3; height: 2.6em; overflow: hidden;">
								<i class="bi bi-calendar-heart text-danger me-1"></i>양모펠트 / 반려동물
								/ 강아지 / 서울 / 원데이클래스
							</div>
							<div class="d-flex align-items-center mb-1">
								<img
									src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/60c42126ec431259ac6871c1/thumbnail_image/1.jpg"
									class="rounded-circle me-2" width="22" height="22" alt="강사">
								<span class="fw-bold small">초비야</span>
							</div>
							<div class="small mb-2">
								<span class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>초급</span> <span
									class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>서울</span>
							</div>
						</div>
						<div class="card-footer bg-white border-0 px-3 pb-2 small">
							<div class="d-flex">
								<div class="ms-auto">
									<span class="fw-bold fs-6" style="color: #E63946;">20,000원</span>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>
		
		<div class="col">
				<a class="text-dark text-decoration-none d-block"
					href="http://localhost:8080/CLANITY/classDetailedPage?classId=12870&openId=11301">
					<div class="card h-100 border border-2 rounded-4 shadow-sm mx-auto"
						style="width: 260px; border-color: #E63946;">
						<div class="position-relative">
							<img
								src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/6249ce672140cf7c76d9ae9e/thumbnail_image/1.jpg"
								class="card-img-top" alt="썸네일"
								style="width: 100%; height: 140px; object-fit: cover;"> <span
								class="badge bg-warning text-dark position-absolute top-0 start-0 m-2 fw-bold px-2 py-1 small">원데이클래스</span>
							<i
								class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
						</div>
						<div class="card-body px-3 py-2">
							<div class="category-badges mb-1">
								<span class="badge bg-light text-dark border me-1">쿠킹</span>
								<span class="badge bg-secondary text-white">전체</span>
							</div>
							<div class="fw-bold mb-2"
								style="font-size: 14px; line-height: 1.3; height: 2.6em; overflow: hidden;">
								<i class="bi bi-calendar-heart text-danger me-1"></i>좋은 재료로 직접 만드는 디저트 #제주베이킹클래스
							</div>
							<div class="d-flex align-items-center mb-1">
								<img
									src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/6249ce672140cf7c76d9ae9e/thumbnail_image/1.jpg"
									class="rounded-circle me-2" width="22" height="22" alt="강사">
								<span class="fw-bold small">코지베이킹랩</span>
							</div>
							<div class="small mb-2">
								<span class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>중급</span> <span
									class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>제주도</span>
							</div>
						</div>
						<div class="card-footer bg-white border-0 px-3 pb-2 small">
							<div class="d-flex">
								<div class="ms-auto">
									<span class="fw-bold fs-6" style="color: #E63946;">40,000원</span>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>

			<!-- 카드 2 -->
			<div class="col">
				<a class="text-dark text-decoration-none d-block"
					href="http://localhost:8080/CLANITY/classDetailedPage?classId=12979&openId=11410">
					<div class="card h-100 border border-2 rounded-4 shadow-sm mx-auto"
						style="width: 260px; border-color: #E63946;">
						<div class="position-relative">
							<img
								src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/60c7398439363c3540982687/thumbnail_image/1.jpg"
								class="card-img-top" alt="썸네일"
								style="width: 100%; height: 140px; object-fit: cover;"> <span
								class="badge bg-warning text-dark position-absolute top-0 start-0 m-2 fw-bold px-2 py-1 small">원데이클래스</span>
							<i
								class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
						</div>
						<div class="card-body px-3 py-2">
							<div class="category-badges mb-1">
								<span class="badge bg-light text-dark border me-1">핸드메이드</span> <span
									class="badge bg-secondary text-white">전체</span>
							</div>
							<div class="fw-bold mb-2"
								style="font-size: 14px; line-height: 1.3; height: 2.6em; overflow: hidden;">
								<i class="bi bi-calendar-heart text-danger me-1"></i>나만의 인테리어 힐링템 캔들 만들기
							</div>
							<div class="d-flex align-items-center mb-1">
								<img
									src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/60c7398439363c3540982687/thumbnail_image/1.jpg"
									class="rounded-circle me-2" width="22" height="22" alt="강사">
								<span class="fw-bold small">따숩</span>
							</div>
							<div class="small mb-2">
								<span class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>중급</span> <span
									class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>경상남도</span>
							</div>
						</div>
						<div class="card-footer bg-white border-0 px-3 pb-2 small">
							<div class="d-flex">
								<div class="ms-auto">
									<span class="fw-bold fs-6" style="color: #E63946;">45,000원</span>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>

			<!-- 카드 3 -->
			<div class="col">
				<a class="text-dark text-decoration-none d-block"
					href="http://localhost:8080/CLANITY/classDetailedPage?classId=12632&openId=11063">
					<div class="card h-100 border border-2 rounded-4 shadow-sm mx-auto"
						style="width: 260px; border-color: #E63946;">
						<div class="position-relative">
							<img
								src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/6370c9f2c0f7096cc6343ae0/thumbnail_image/1.jpg"
								class="card-img-top" alt="썸네일"
								style="width: 100%; height: 140px; object-fit: cover;"> <span
								class="badge bg-warning text-dark position-absolute top-0 start-0 m-2 fw-bold px-2 py-1 small">원데이클래스</span>
							<i
								class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
						</div>
						<div class="card-body px-3 py-2">
							<div class="category-badges mb-1">
								<span class="badge bg-light text-dark border me-1">뷰티</span>
								<span class="badge bg-secondary text-white">타투</span>
							</div>
							<div class="fw-bold mb-2"
								style="font-size: 14px; line-height: 1.3; height: 2.6em; overflow: hidden;">
								<i class="bi bi-calendar-heart text-danger me-1"></i>아쿠스 타투 아카데미
							</div>
							<div class="d-flex align-items-center mb-1">
								<img
									src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/6370c9f2c0f7096cc6343ae0/thumbnail_image/1.jpg"
									class="rounded-circle me-2" width="22" height="22" alt="강사">
								<span class="fw-bold small">김민석</span>
							</div>
							<div class="small mb-2">
								<span class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>입문</span> <span
									class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>서울</span>
							</div>
						</div>
						<div class="card-footer bg-white border-0 px-3 pb-2 small">
							<div class="d-flex">
								<div class="ms-auto">
									<span class="fw-bold fs-6" style="color: #E63946;">55,000원</span>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>

			<!-- 카드 4 -->
			<div class="col">
				<a class="text-dark text-decoration-none d-block"
					href="http://localhost:8080/CLANITY/classDetailedPage?classId=11694&openId=10126">
					<div class="card h-100 border border-2 rounded-4 shadow-sm mx-auto"
						style="width: 260px; border-color: #E63946;">
						<div class="position-relative">
							<img
								src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/679f6f70cf98b311f354ff5e/thumbnail_image/1.jpg"
								class="card-img-top" alt="썸네일"
								style="width: 100%; height: 140px; object-fit: cover;"> <span
								class="badge bg-warning text-dark position-absolute top-0 start-0 m-2 fw-bold px-2 py-1 small">원데이클래스</span>
							<i
								class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
						</div>
						<div class="card-body px-3 py-2">
							<div class="category-badges mb-1">
								<span class="badge bg-light text-dark border me-1">체험</span> <span
									class="badge bg-secondary text-white">전체</span>
							</div>
							<div class="fw-bold mb-2"
								style="font-size: 14px; line-height: 1.3; height: 2.6em; overflow: hidden;">
								<i class="bi bi-calendar-heart text-danger me-1"></i>[청주/1:1클래스] 나의 매력을 발견하는 퍼스널컬러 클래스
							</div>
							<div class="d-flex align-items-center mb-1">
								<img
									src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/class_images/679f6f70cf98b311f354ff5e/thumbnail_image/1.jpg"
									class="rounded-circle me-2" width="22" height="22" alt="강사">
								<span class="fw-bold small">kingbell</span>
							</div>
							<div class="small mb-2">
								<span class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>중급</span> <span
									class="badge bg-light text-dark px-2 py-1"><i
									class="bi bi-geo-alt me-1"></i>충청북도</span>
							</div>
						</div>
						<div class="card-footer bg-white border-0 px-3 pb-2 small">
							<div class="d-flex">
								<div class="ms-auto">
									<span class="fw-bold fs-6" style="color: #E63946;">20,000원</span>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</main>


	<%@ include file="views/common/footer.jsp"%>


</body>
</html>
