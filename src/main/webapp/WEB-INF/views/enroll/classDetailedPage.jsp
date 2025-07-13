<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>CLANITY 클래스 상세페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="../common/head.jsp" %>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
  <style>
    .bx-wrapper {margin-bottom: 0;}

	body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f8f9fa;
    }

  </style>
</head>

<body class="bg-light">
<%@ include file="../common/header.jsp" %>

<main class="container" style="padding-top: 100px;">
  <div class="row g-4 align-items-start">
    <!-- 좌측 콘텐츠 -->
    <div class="col-lg-8">
      <div class="mb-3">
        <c:if test="${empty detailInfo.attachs}">
          <img src="https://placehold.co/500x500?text=No+Image" class="img-fluid rounded w-100" alt="썸네일" style="height: 500px; object-fit: cover;">
        </c:if>
        <c:if test="${not empty detailInfo.attachs}">
          <div >
            <ul class="bxslider-main d-flex mb-0" >
          <c:forEach var="img" items="${detailInfo.attachs}">
          <c:if test="${fn:contains(img.path, 'thumb')}">
            <li>
            <img src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/${img.path}/${img.origin}" class="img-thumbnail" style="object-fit: cover; width: 100%; height: 100%" alt="상세 이미지">
            </li>
          </c:if>
          </c:forEach>
            </ul>
          </div>
        </c:if>

      </div>

      <div class="d-flex gap-2 overflow-auto mb-3 bxslider-thumb-wrapper">
        <ul class="bxslider-thumb">
        <c:forEach var="img" items="${detailInfo.attachs}">
          <c:if test="${fn:contains(img.path, 'thumb')}">
            <li>
              <img src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/${img.path}/${img.origin}" class="img-thumbnail" style="width:100px;height:100px;object-fit:cover;" alt="상세 이미지">
            </li>
          </c:if>
        </c:forEach>
        </ul>
      </div>

      <script>
        $(function() {
          var mainSlider = $('.bxslider-main').bxSlider({
            pager: false,
            controls: true,
            adaptiveHeight: false
          });

          var thumbSlider = $('.bxslider-thumb').bxSlider({
            minSlides: 3,
            maxSlides: 8,
            slideWidth: 100,
            slideMargin: 10,
            pager: false,
            controls: true,
            infiniteLoop: false
          });

          // 썸네일 클릭 → 메인 슬라이더 이동
          $('.bxslider-thumb li').on('click', function() {
            var index = $(this).index();
            $('.bxslider-thumb li').removeClass('active');
            $(this).addClass('active');
            mainSlider.goToSlide(index);
          });

          // 초기 active 표시
          $('.bxslider-thumb li').first().addClass('active');
        });
      </script>

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
     
      </div>
    </div>
    <!-- 우측 결제 박스 -->
    <div class="col-lg-4 sticky-top" style="top: 90px;">
      <div >
        <div class="border rounded p-4 bg-white shadow-sm">
          <div class="border p-3 mb-3 bg-light rounded">
            <div class="fw-semibold mb-1">개설된 클래스</div>
            <div class="schedule-card p-3 rounded shadow-sm border bg-light-subtle">
              <div class="d-flex justify-content-between text-secondary fw-bold small mb-2 px-1">
                <div class="text-center">날짜</div>
                <span>신청 현황</span>
              </div>
              <div class="d-flex justify-content-between align-items-center px-1">
                <span class="small text-dark">
                  ${detailInfo.scheduleDate} <br class="d-sm-none" />
                  ${detailInfo.startTime} ~ ${detailInfo.endTime}
                </span>
                <hr>
                <span class="small text-dark">
                  <span class="fw-semibold">${detailInfo.currentParticipants}</span> / ${detailInfo.maxParticipants}
                </span>
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold mb-1">인원 선택</label>
            <div class="input-group">
              <button class="btn btn-outline-secondary" type="button" onclick="decreaseQuantity()">-</button>
              <input type="number" class="form-control text-center" min="1" max="100" id="quantityInput" value="1">
              <button class="btn btn-outline-secondary" type="button" onclick="increaseQuantity()">+</button>
            </div>
          </div>

          <div class="mb-3 text-end">
            <%--<span class="fw-bold fs-5 text-danger">${detailInfo.discountPrice}</span>--%>
            <span class="text-black fw-bold"><span class="price-result">${detailInfo.price}</span> <span class="small text-muted"> 원/<span class="part-result">1</span>인</span></span>
          </div>

          <div class="d-flex gap-2 mb-3">
            <button class="btn btn-outline-secondary w-50">
              <i class="bi bi-heart"></i> 위시리스트
            </button>
            <button class="btn btn-outline-secondary w-50">
              <i class="bi bi-chat-dots"></i> 문의하기
            </button>
          </div>

          <form action="${cp}/classEnrollPage" method="get" id="enrollForm">
            <input type="hidden" name="classId" value="${detailInfo.classId}" />
            <input type="hidden" name="openId" value="${detailInfo.openId}" />
             <%-- <input type="hidden" name="part" value="${detailInfo.currentParticipants}"/>  --%>
            <button type="submit" class="btn w-100 fw-bold text-white" style="background-color:#E63946; border-color:#E63946;">클래스 신청하기</button>
          </form>
        </div>
      </div>
    </div>
    <script>
      $("#enrollForm").submit(function (e) {
          e.preventDefault();
          $(this).find("[name=part]").val($(".part-result").text());
          console.log($(this).find("[name=part]").val());
          this.submit();
      });
    </script>
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
    const price = '${detailInfo.price}'
    if (input.value > 1) {
      input.value--;
      $(".price-result").text(input.value * price);
      $(".part-result").text(input.value);
    }
  }

  function increaseQuantity() {
    const max = '${detailInfo.maxParticipants}' / 1;
    const curr = '${detailInfo.currentParticipants}' / 1;
    const price = '${detailInfo.price}'
    console.log(max)
    const input = document.getElementById("quantityInput");
    console.log(input.value);
    if (input.value < max-curr) {
      input.value++;
      $(".price-result").text(input.value * price);
      $(".part-result").text(input.value);

    }
  }
</script>
</body>
</html>
