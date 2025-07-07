<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>클래니티</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">

  <!-- Bootstrap, FontAwesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body class="d-flex flex-column min-vh-100" style="font-family: 'Noto Sans', sans-serif;">

<%@ include file="../common/header.jsp" %>

<main class="container flex-grow-1 py-5">
  <!-- 배너 -->
  <div class="mb-4">
    <img src="https://placehold.co/1200x200" class="img-fluid rounded" alt="배너">
  </div>

  <!-- 필터 버튼 -->
  <div class="mb-4 d-flex flex-wrap gap-2">
    <button class="btn btn-outline-danger rounded-pill">날짜 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">지역 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">나이 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">정원 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">카테고리 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">유형 <i class="fa-solid fa-caret-down ms-1"></i></button>
  </div>

  <!-- 카드 리스트 -->
  <div class="container my-5">
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:forEach var="c" items="${cardlist}">
				<!-- 카드 너비 줄이기 위해 w-100 대신 고정 -->
				<div class="col">
					<div
						class="card border-0 shadow-sm h-100 rounded-4 overflow-hidden mx-auto"
						style="width: 280px;">

						<!-- 이미지 영역 -->
						<div class="position-relative">
							<img src="${c.thumbnailImages}" class="card-img-top" alt="썸네일"
								style="width: 100%; height: 170px; object-fit: cover;"
								onerror="this.src='https://placehold.co/500x300?text=No+Image';">

							<!-- 찜 하트 -->
							<i
								class="bi bi-heart position-absolute top-0 end-0 m-2 fs-5 text-white"></i>
						</div>

						<!-- 이하 동일 -->


						<!-- 카드 내용 -->
						<div class="card-body px-3 py-3">
							<!-- 카테고리 정보 -->
							<div class="text-muted small mb-1">${c.region}·파티</div>

							<!-- 제목 -->
							<div class="fw-bold mb-2">
								<i class="bi bi-calendar-heart text-danger me-1"></i> ${c.title}
							</div>

							<!-- 태그 또는 부가설명 -->
							<div class="text-muted small">
								<div class="d-flex align-items-center mb-2">
									<img src="${c.instructorImageUrl}" class="rounded-circle me-2"
										width="24" height="24"
										onerror="this.src='https://placehold.co/24x24';" alt="강사">
									<span class="fw-medium small">${c.instructorName}</span>
									
								</div>
							</div>
						</div>

						<!-- 카드 하단 -->
						<div
							class="card-footer bg-white border-0 px-3 pb-3 small text-muted">
							<i class="bi bi-clock me-1"></i> ${c.scheduleDate}
							(${c.startTime} ~ ${c.endTime}) <strong
								class="float-end text-dark">${c.price}원</strong>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</main>

<%@ include file="../common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
