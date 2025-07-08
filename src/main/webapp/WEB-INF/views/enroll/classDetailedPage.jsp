<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>CLANITY 클래스 상세페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap & Font -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
  
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
        <img src="https://placehold.co/800x400" class="img-fluid rounded w-100 mb-3" alt="클래스 대표 이미지">

        <!-- 썸네일 리스트 -->
        <div class="d-flex gap-2 overflow-auto mb-3">
          <img src="https://placehold.co/100x100" class="img-thumbnail" alt="썸네일1">
          <img src="https://placehold.co/100x100" class="img-thumbnail" alt="썸네일2">
          <img src="https://placehold.co/100x100" class="img-thumbnail" alt="썸네일3">
        </div>

        <!-- 태그 -->
        <div class="mb-3 d-flex flex-wrap gap-2">
          <span class="badge bg-warning-subtle text-dark">드로잉</span>
          <span class="badge bg-info-subtle text-dark">아크릴</span>
          <span class="badge bg-success-subtle text-dark">원데이</span>
        </div>

        <!-- 제목 및 정보 -->
        <h3 class="fw-bold">${title}</h3>
        <div class="d-flex align-items-center gap-3 mt-2 text-muted small">
          <span><i class="fa-regular fa-clock me-1"></i>2시간</span>
          <span><i class="fa-solid fa-location-dot me-1"></i>서울 마포구 연남동</span>
          <span><i class="fa-solid fa-user-group me-1"></i>1~6명</span>
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
            <p>초보자도 단계별로 명화 완성! 아크릴 페인팅 원데이 클래스입니다.</p>
          </section>
          <section id="curriculum" class="mb-5">
            <h5 class="fw-bold">커리큘럼</h5>
            <ul>
              <li>1단계: 밑그림</li>
              <li>2단계: 배경 채색</li>
              <li>3단계: 디테일</li>
            </ul>
          </section>
          <section id="host" class="mb-5">
            <h5 class="fw-bold">호스트 소개</h5>
            <p>미술 전공자이며 전시 경험이 풍부한 작가가 직접 진행합니다.</p>
          </section>
          <section id="location" class="mb-5">
            <h5 class="fw-bold">위치</h5>
            <p>서울 마포구 연남동 123-45, 홍대입구역 도보 5분</p>
          </section>
          <section id="review" class="mb-5">
            <h5 class="fw-bold">후기</h5>
            <p>“작품 완성도 높고, 피드백도 훌륭했어요!”</p>
          </section>
          <section id="qna" class="mb-5">
            <h5 class="fw-bold">문의</h5>
            <p>문의사항은 언제든지 남겨주세요.</p>
          </section>
          <section id="faq" class="mb-5">
            <h5 class="fw-bold">FAQ</h5>
            <p>재료 포함되나요? → 네, 모두 제공됩니다.</p>
          </section>
          <section id="notice">
            <h5 class="fw-bold">유의사항</h5>
            <p>수업 24시간 전까지 취소 가능합니다.</p>
          </section>
        </div>
      </div>

      <!-- 우측 예약 박스 -->
      <div class="col-lg-4 sticky-sidebar">
        <div class="border rounded p-4 mb-4">
          <h5 class="fw-bold">1. 클래스 일정</h5>
          <input type="date" id="classDate" class="form-control mb-2" value="2025-06-29">
          <div class="text-success small mb-2">✔ 당일 예약 가능 클래스 입니다</div>

          <label class="form-label fw-semibold">개설된 클래스</label>
          <select class="form-select mb-2" id="classTime">
            <option value="13:00">13:00 ~ 15:00</option>
            <option value="14:00">14:00 ~ 16:00</option>
            <option value="15:00">15:00 ~ 17:00</option>
          </select>

          <ul id="baseOptionList" class="list-unstyled small text-muted">
            <li>✔ 재료 포함</li>
            <li>✔ 다과 제공</li>
          </ul>

          <div class="mt-3">
            <span class="text-decoration-line-through text-muted">40,000원</span>
            <span class="fw-bold text-danger ms-2">30,000원</span>
            <span class="text-muted small ms-1">/ 1인</span>
          </div>
        </div>

        <div class="border rounded p-4">
          <h5 class="fw-bold">2. 세부 선택 사항</h5>

          <label class="form-label">추가 수업 구성</label>
          <select class="form-select mb-2" id="extraOption">
            <option value="">선택 없음</option>
            <option value="70ml 만들기 + 25,000원">70ml 만들기</option>
            <option value="기념 포토카드 + 10,000원">기념 포토카드</option>
          </select>

          <label class="form-label">인원 선택</label>
          <input type="number" class="form-control w-50 mb-2" value="1" min="1">

          <div id="optionSummary" class="mt-3 text-muted small">✔ 재료 포함 / ✔ 다과 제공</div>

          <form action="${cp}/enroll/classDetailedPage" method="post">
            <input type="hidden" name="openId" value="${classOpen.openId}" />
            <input type="hidden" name="memberId" value="1" />
            <button type="submit" class="btn btn-danger w-100">클래스 결제하기</button>
          </form>
        </div>
      </div>
    </div>
  </main>

  <%@ include file="../common/footer.jsp" %>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

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

  <script>
    

    document.getElementById('classDate').addEventListener('change', updateOptionSummary);
    document.getElementById('classTime').addEventListener('change', updateOptionSummary);
    document.getElementById('extraOption').addEventListener('change', updateOptionSummary);
  </script>
</body>
</html>
