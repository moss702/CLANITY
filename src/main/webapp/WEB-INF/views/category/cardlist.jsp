<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>클래스 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
</head>
<body>
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
</body>
</html>
