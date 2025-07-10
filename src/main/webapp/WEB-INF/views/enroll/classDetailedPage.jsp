<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>CLANITY 클래스 상세페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="../common/head.jsp" %>
</head>

<body class="bg-light">
<%@ include file="../common/header.jsp" %>

<main class="container" style="padding-top: 100px;">
  <div class="row g-4 align-items-start">
    
    <!-- 좌측 콘텐츠 -->
    <div class="col-lg-8">
      <div class="mb-3">
        <c:if test="${empty c.thumbnailImages}">
          <c:set var="src" value="https://placehold.co/500x500?text=No+Image" />
        </c:if>
        <c:if test="${not empty c.thumbnailImages}">
          <c:set var="src" value="${c.thumbnailImages}" />
        </c:if>
        <img src="${src}" class="img-fluid rounded w-100" alt="썸네일" style="height: 500px; object-fit: cover;">
      </div>

      <div class="d-flex gap-2 overflow-auto mb-3">
        <c:forEach items="${detailInfo.detailImages}" var="img">
          <img src="${img}" class="img-thumbnail" style="width:100px;height:100px;object-fit:cover;" alt="상세 이미지">
        </c:forEach>
      </div>

      <div class="mb-3 d-flex flex-wrap gap-2">
        <span class="badge bg-secondary text-light">${detailInfo.categoryId}</span>
      </div>

      <h3 class="fw-bold">${detailInfo.title}</h3>
      <div class="d-flex align-items-center gap-3 mt-2 text-muted small">
        <span><i class="fa-regular fa-clock me-1"></i>${detailInfo.duration}</span>
        <span><i class="fa-solid fa-location-dot me-1"></i>${detailInfo.address}</span>
      </div>

      <ul class="nav nav-tabs mt-4" id="classTab">
        <li class="nav-item"><a class="nav-link active text-dark" href="#intro">클래스 소개</a></li>
        <li class="nav-item"><a class="nav-link text-dark" href="#curriculum">커리큘럼</a></li>
        <li class="nav-item"><a class="nav-link text-dark" href="#host">호스트 소개</a></li>
        <li class="nav-item"><a class="nav-link text-dark" href="#location">위치</a></li>
        <li class="nav-item"><a class="nav-link text-dark" href="#review">후기</a></li>
        <li class="nav-item"><a class="nav-link text-dark" href="#qna">문의</a></li>
        <li class="nav-item"><a class="nav-link text-dark" href="#faq">FAQ</a></li>
        <li class="nav-item"><a class="nav-link text-dark" href="#notice">유의사항</a></li>
      </ul>

      <div class="pt-4">
        <section id="intro" class="mb-5">
          <h5 class="fw-bold">클래스 소개</h5>
          <p>${detailInfo.description}</p>
          <h5 class="fw-bold">추천해요!</h5>
          <p>${detailInfo.description2}</p>
        </section>
        <section id="curriculum" class="mb-5">
          <h5 class="fw-bold">커리큘럼</h5>
          <p>${detailInfo.curriculum}</p>
        </section>
        <section id="host" class="mb-5">
          <h5 class="fw-bold">호스트 소개</h5>
          <p>${detailInfo.hostIntroduction}</p>
        </section>
        <section id="location" class="mb-5">
          <h5 class="fw-bold">위치</h5>
          <p>${detailInfo.address}</p>
        </section>
        <section id="review" class="mb-5">
          <h5 class="fw-bold">후기</h5>
          <p>나중에 넣기</p>
        </section>
        <section id="qna" class="mb-5">
          <h5 class="fw-bold">문의</h5>
          <p>나중에 넣기</p>
        </section>
        <section id="faq" class="mb-5">
          <h5 class="fw-bold">FAQ</h5>
          <p>나중에 넣기</p>
        </section>
        <section id="notice">
          <h5 class="fw-bold">유의사항</h5>
          <p>나중에 넣기</p>
        </section>
      </div>
    </div>

    <!-- 우측 결제 박스 -->
    <div class="col-lg-4">
      <div class="sticky-top" style="top: 120px;">
        <div class="border rounded p-4 bg-white shadow-sm">
          <div class="border p-3 mb-3 bg-light rounded">
            <div class="fw-semibold mb-1">개설된 클래스</div>
            <div class="small text-muted mb-2">구매 후 문의를 통해 일정 조율이 필요해요</div>
            <button type="button" class="btn btn-outline-secondary w-100">신청 후 일정 조율</button>
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold mb-1">인원 선택</label>
            <div class="input-group w-75">
              <button class="btn btn-outline-secondary" type="button" onclick="decreaseQuantity()">-</button>
              <input type="number" class="form-control text-center" min="1" max="100" id="quantityInput" value="1">
              <button class="btn btn-outline-secondary" type="button" onclick="increaseQuantity()">+</button>
            </div>
          </div>

          <div class="mb-3">
            <span class="fw-bold fs-5 text-danger">${detailInfo.discountPrice}</span>
            <span class="small text-muted">원/1인</span>
          </div>

          <div class="d-flex gap-2 mb-3">
            <button class="btn btn-outline-secondary w-50">
              <i class="bi bi-heart"></i> 위시리스트
            </button>
            <button class="btn btn-outline-secondary w-50">
              <i class="bi bi-chat-dots"></i> 문의하기
            </button>
          </div>

          <form action="${cp}/classEnrollPage" method="post">
            <input type="hidden" name="classId" value="${detailInfo.classId}" />
            <input type="hidden" name="openId" value="${detailInfo.openId}" />
            <input type="hidden" name="memberId" value="${member.memberId}" />
            <button type="submit" class="btn w-100 fw-bold text-white" style="background-color:#E63946; border-color:#E63946;">클래스 신청하기</button>
          </form>
        </div>
      </div>
    </div>

  </div>
</main>

<%@ include file="../common/footer.jsp" %>

<script>
  document.querySelectorAll("#classTab a").forEach(tab => {
    tab.addEventListener("click", function(e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute("href"));
      if (target) {
        const offset = 100;
        const position = target.getBoundingClientRect().top + window.scrollY - offset;
        window.scrollTo({ top: position, behavior: "smooth" });
      }
    });
  });

  function decreaseQuantity() {
    const input = document.getElementById("quantityInput");
    if (input.value > 1) input.value--;
  }

  function increaseQuantity() {
    const input = document.getElementById("quantityInput");
    if (input.value < 100) input.value++;
  }
</script>
</body>
</html>
