<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>CLANITY 카테고리 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../common/head.jsp"%>
</head>
<body style="font-family: 'Noto Sans', sans-serif;">
<%@ include file="../common/header.jsp"%>

<main class="container px-4 py-5">
	<div class="row justify-content-center">
<aside class="col-md-3 col-lg-2 mb-4">
    <h6 class="fw-bold mb-3">카테고리 전체</h6>
	<div class="accordion" id="categoryAccordion">
		<c:forEach var="parent" items="${parentCategories}">
			<c:set var="groupId" value="cat${parent.categoryId}" />
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading${groupId}">
					<button class="accordion-button collapsed fw-bold" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#collapse${groupId}"
							aria-expanded="false"
							aria-controls="collapse${groupId}">
							${parent.parentCategory}
					</button>
				</h2>
				<div id="collapse${groupId}" class="accordion-collapse collapse"
					 aria-labelledby="heading${groupId}" data-bs-parent="#categoryAccordion">
					<div class="accordion-body p-0">
						<ul class="list-group list-group-flush">
							<c:forEach var="child" items="${categoryMap[parent.parentCategory]}">
								<li class="list-group-item text-secondary small"><a href="${cp}/categoryList?categoryId=${child.categoryId}" class="text-decoration-none text-dark">${child.childCategory}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

</aside>
<!-- 카드 리스트 -->
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
				<!-- 페이지 번호 -->
		</div>
				<div class="d-flex justify-content-center mt-4">
					<ul class="pagination pt-4">

						<c:if test="${pageDto.doubleLeft}">
							<li class="page-item">
								<a class="page-link border border-light text-danger"
								   href="${cp}/categoryList?page=1&${pageDto.cri.qs}">
									<i class="fa-solid fa-angles-left"></i>
								</a>
							</li>
						</c:if>

						<c:if test="${pageDto.left}">
							<li class="page-item">
								<a class="page-link border border-light text-danger"
								   href="${cp}/categoryList?page=${pageDto.start - 1}&${pageDto.cri.qs}">
									<i class="fa-solid fa-angle-left"></i>
								</a>
							</li>
						</c:if>

						<c:forEach begin="${pageDto.start}" end="${pageDto.end}" var="i">
							<li class="page-item ${pageDto.cri.page == i ? 'active' : ''}">
								<a class="page-link border border-light
		            ${pageDto.cri.page == i ? 'bg-danger text-white' : 'text-danger'}"
								   href="${cp}/categoryList?page=${i}&${pageDto.cri.qs}">
										${i}
								</a>
							</li>
						</c:forEach>

						<c:if test="${pageDto.right}">
							<li class="page-item">
								<a class="page-link border border-light text-danger"
								   href="${cp}/categoryList?page=${pageDto.end + 1}&${pageDto.cri.qs}">
									<i class="fa-solid fa-angle-right"></i>
								</a>
							</li>
						</c:if>

						<c:if test="${pageDto.doubleRight}">
							<li class="page-item">
								<a class="page-link border border-light text-danger"
								   href="${cp}/categoryList?page=${pageDto.realEnd}&${pageDto.cri.qs}">
									<i class="fa-solid fa-angles-right"></i>
								</a>
							</li>
						</c:if>

					</ul>
				</div>
			</div>
	</div>
  </main>

<%@ include file="../common/footer.jsp"%>
</body>
</html>
