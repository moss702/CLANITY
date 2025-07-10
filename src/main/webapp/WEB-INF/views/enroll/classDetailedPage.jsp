<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>CLANITY 클래스 상세페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="../common/head.jsp" %>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f9f9f9;
      padding-top: 110px;
    }
    header {
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 1030;
      background-color: white;
    }
    main {
      margin-top: 0;
    }
    .sticky-sidebar {
      position: sticky;
      top: 140px;
      z-index: 2;
      align-self: start;
    }
    .btn-danger {
      background-color: #E63946;
      border-color: #E63946;
    }
    .btn-danger:hover {
      background-color: #d12f3f;
      border-color: #d12f3f;
    }
  </style>
</head>

<body>
  <%@ include file="../common/header.jsp" %>

  <main class="container my-5">
    <div class="row g-4">
      <!-- 좌측 클래스 콘텐츠 -->
      <div class="col-lg-8">
        <img src="${detailInfo.thumbnailImage}" class="img-fluid rounded w-100 mb-3" alt="클래스 대표 이미지">

        <!-- 썸네일 리스트 (필요 시 반복문으로) -->
        <div class="d-flex gap-2 overflow-auto mb-3">
          <img src="https://placehold.co/100x100" class="img-thumbnail" alt="썸네일1">
          <img src="https://placehold.co/100x100" class="img-thumbnail" alt="썸네일2">
          <img src="https://placehold.co/100x100" class="img-thumbnail" alt="썸네일3">
        </div>

        <!-- 태그 -->
        <div class="mb-3 d-flex flex-wrap gap-2" name="categoryId">
          <span class="badge bg-warning-subtle text-dark">${detailInfo.categoryId}</span>
        </div>

        <!-- 제목 및 정보 -->
        <h3 class="fw-bold">${detailInfo.title}</h3>
        <div class="d-flex align-items-center gap-3 mt-2 text-muted small">
          <span><i class="fa-regular fa-clock me-1"></i>${detailInfo.duration}</span>
          <span><i class="fa-solid fa-location-dot me-1"></i>${detailInfo.address}</span>
          <span><i class="fa-solid fa-user-group me-1"></i>${detailInfo.minParticipants} ~ ${detailInfo.maxParticipants}</span>
        </div>

        <!-- 탭 -->
        <ul class="nav nav-tabs mt-4" id="classTab">
          <li class="nav-item"><a class="nav-link active" href="#intro">클래스 소개</a></li>
          <li class="nav-item"><a class="nav-link text-dark" href="#curriculum">커리큘럼</a></li>
          <li class="nav-item"><a class="nav-link text-dark" href="#host">호스트 소개</a></li>
          <li class="nav-item"><a class="nav-link text-dark" href="#location">위치</a></li>
          <li class="nav-item"><a class="nav-link text-dark" href="#review">후기</a></li>
          <li class="nav-item"><a class="nav-link text-dark" href="#qna">문의</a></li>
          <li class="nav-item"><a class="nav-link text-dark" href="#faq">FAQ</a></li>
          <li class="nav-item"><a class="nav-link text-dark" href="#notice">유의사항</a></li>
        </ul>

        <!-- 상세 정보 -->
        <div class="pt-4">
          <section id="intro" class="mb-5">
            <h5 class="fw-bold">클래스 소개</h5>
            <p>${detailInfo.description}</p>
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

      <!-- 우측 예약 박스 -->
      <div class="col-lg-4 sticky-sidebar">
        <div class="border rounded p-4 mb-4">
          <h5 class="fw-bold">1. 클래스 일정</h5>
          <input type="date" id="classDate" class="form-control mb-2" value="2025-06-29">

          <label class="form-label fw-semibold">개설된 클래스</label>
          <select class="form-select mb-2" id="classTime">
            <option value="13:00">13:00 ~ 15:00</option>
          </select>

          <div class="mt-3">
            <span class="text-decoration-line-through text-muted">${detailInfo.price}</span>
            <span class="fw-bold text-danger ms-2">${detailInfo.discountPrice}</span>
          </div>
          <label class="form-label">인원 선택</label>
          <span class="text-muted small ms-1">나중에 인원수 체크</span>
          <input type="number" class="form-control w-50 mb-2" value="1" min="1">
        </div>

        <form action="${cp}/enroll/classDetailedPage" method="post">
          <input type="hidden" name="classId" value="${detailInfo.classId}" />
          <input type="hidden" name="openId" value="${detailInfo.openId}" />
          <input type="hidden" name="memberId" value="${loginMember.memberId}" />
          <input type="hidden" name="price" value="${detailInfo.price}" />
          <input type="hidden" name="discountPrice" value="${detailInfo.discountPrice}" />
          <input type="hidden" name="selectedDate" value="${selectedDate}" />
          <input type="hidden" name="selectedTime" value="${selectedTime}" />
          <input type="hidden" name="quantity" value="1" id="quantityInput" />
          <button type="submit" class="btn btn-danger w-100">클래스 결제하기</button>
        </form>
      </div>
    </div>
  </main>

  <%@ include file="../common/footer.jsp" %>

  <!-- 탭 스크롤 이동 -->
  <script>
    document.querySelectorAll("#classTab a").forEach(tab => {
      tab.addEventListener("click", function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute("href"));
        if (target) {
          window.scrollTo({
            top: target.offsetTop - 100,
            behavior: 'smooth'
          });
        }
      });
    });
  </script>
</body>
</html>
