<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<%@ include file="../common/head.jsp"%>

</head>
<body>
	<c:forEach items="${cards}" var="c">
		<div class="col">
			<a
				href="${cp}/classDetailedPage?classId=${c.classId}&openId=${c.openId}"
				class="text-decoration-none text-dark w-100 h-100"
				style="display: block;">
				<div class="card h-100 w-100 border border-2 rounded-4 shadow-sm"
					style="border-color: #E63946; cursor: pointer;">

					<!-- 이미지 영역 -->
					<div class="position-relative">
						<c:if test="${empty c.thumbnailImages}">
							<c:set var="src"
								value="https://placehold.co/500x300?text=No+Image" />
						</c:if>
						<c:if test="${not empty c.thumbnailImages}">
							<c:set var="src" value="${c.thumbnailImages}" />
						</c:if>
						<img src="${src}" class="card-img-top" alt="썸네일"
							style="width: 100%; height: 170px; object-fit: cover;"> <span
							class="badge bg-light text-dark position-absolute top-0 start-0 m-2 small fw-bold px-2 py-1 rounded-pill">
							"${c.classType}" </span> <i
							class="bi bi-heart-fill position-absolute top-0 end-0 m-2 text-warning"></i>
					</div>

					<!-- 본문 -->
					<div class="card-body px-3 py-3">
						<span class="badge bg-light text-dark mb-2 rounded-pill px-2 py-1">${c.categoryId}</span>
						<span class="badge bg-light text-dark mb-2 rounded-pill px-2 py-1">${c.difficulty}</span>
						<div class="fw-bold mb-2 text-truncate">
							<i class="bi bi-calendar-heart text-danger me-1"></i> ${c.title}
						</div>
						<div class="d-flex align-items-center mb-2">
							<c:if test="${empty c.instructorImageUrl}">
								<c:set var="instSrc"
									value="https://placehold.co/24x24?text=No+Image" />
							</c:if>
							<c:if test="${not empty c.instructorImageUrl}">
								<c:set var="instSrc" value="${c.instructorImageUrl}" />
							</c:if>
							<img src="${instSrc}" class="rounded-circle me-2" width="24"
								height="24" alt="강사"> <span class="fw-medium small">${c.instructorName}</span>
						</div>
						<div class="small mb-2">
							<span class="badge bg-light text-dark rounded-pill px-2 py-1">
								<i class="bi bi-geo-alt me-1"></i> ${c.duration}
							</span>
						</div>
					</div>

					<!-- 하단 가격 -->
					<div class="card-footer bg-white border-0 px-3 pb-3 small">
						<i class="bi bi-calendar-heart text-danger me-1"></i>
						${c.description2} <span class="fw-bold" style="color: #E63946;">${c.price}원</span>
					</div>
				</div>
			</a>
		</div>

	</c:forEach>

</body>
</html>