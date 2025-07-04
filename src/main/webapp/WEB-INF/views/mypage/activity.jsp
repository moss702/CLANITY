<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp"%>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main class="d-flex" style="min-height: 100vh;">
		<!-- 왼쪽 고정 사이드바 -->
		<%@ include file="./mypageSidebar.jsp"%>
		<!-- 오른쪽 콘텐츠 영역 -->
		<!-- 탭 메뉴 -->
		<div class="container-fluid px-4 pt-4">
			<!-- 1. 페이지 제목 -->
			<h4 class="fw-semibold mb-4">나의 활동</h4>

			<!-- 2. 탭 메뉴 -->
			<ul class="nav nav-tabs mb-4" id="activityTab">
				<li class="nav-item"><a class="nav-link active"
					data-bs-toggle="tab" href="#class">클래스</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
					href="#social">모임</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
					href="#post">게시글</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
					href="#reply">댓글</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
					href="#wishlist">위시리스트</a></li>
			</ul>

			<!-- 3. 탭 콘텐츠 -->
			<div class="tab-content">
				<div class="tab-pane fade show active" id="class">
					<!-- 카드 예시 -->
					<div class="card mb-4 shadow-sm">
						<div class="row g-0">
							<!-- 좌측 이미지 영역 -->
							<div
								class="col-md-3 d-flex align-items-center justify-content-center p-3">
								<img src="https://placehold.co/120x120?text=Img"
									class="img-fluid rounded" alt="썸네일">
							</div>
							<!-- 우측 콘텐츠 영역 -->
							<div class="col-md-9">
								<div class="card-body">
									<h5 class="card-title">클래스 제목 예시</h5>
									<p class="card-text text-muted mb-1">2025.07.10 (목) 14:00 ~
										16:00</p>
									<p class="card-text">
										이 클래스는 원예 기초부터 심화까지 배울 수 있는 프로그램입니다.<br> 실습 위주의 커리큘럼으로
										초보자도 쉽게 따라올 수 있습니다.<br> 모든 수업은 소규모로 진행되며, 개별 피드백이 주어집니다.<br>
										준비물은 별도로 제공됩니다. 자세한 내용은 상세페이지 참조 바랍니다.
									</p>
									<a href="#" class="btn btn-outline-primary btn-sm mt-2">상세
										보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane fade show active" id="post">
					<!-- 카드 예시 -->
					<div class="card mb-4 shadow-sm">
						<div class="row g-0">
							<!-- 좌측 이미지 영역 -->
							<div
								class="col-md-3 d-flex align-items-center justify-content-center p-3">
								<img src="https://placehold.co/120x120?text=Img"
									class="img-fluid rounded" alt="썸네일">
							</div>
							<!-- 우측 콘텐츠 영역 -->
							<div class="col-md-9">
								<div class="card-body">
									<h5 class="card-title">클래스 제목 예시</h5>
									<p class="card-text text-muted mb-1">2025.07.10 (목) 14:00 ~
										16:00</p>
									<p class="card-text">
										이 클래스는 원예 기초부터 심화까지 배울 수 있는 프로그램입니다.<br> 실습 위주의 커리큘럼으로
										초보자도 쉽게 따라올 수 있습니다.<br> 모든 수업은 소규모로 진행되며, 개별 피드백이 주어집니다.<br>
										준비물은 별도로 제공됩니다. 자세한 내용은 상세페이지 참조 바랍니다.
									</p>
									<a href="#" class="btn btn-outline-primary btn-sm mt-2">상세
										보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>