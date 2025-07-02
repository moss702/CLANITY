<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>강사님께 문의하기</title>
  <link rel="stylesheet" href="qna_style.css">
</head>

<body>
<%@ include file="../common/header.jsp" %>

  <div class="settings-wrapper">
    <!-- 좌측 사이드바 -->
    <div class="category-menu">
      <button class="pill-btn mb-2">문의하기</button>
      <button class="pill-btn">문의 내역</button>
    </div>

    <!-- 우측 클래스 목록 -->
  <div class="flex-grow-1">
    <div class="section-title">
      <h2>1:1 문의하기</h2>
      <p>궁금한 점이 있다면 언제든 문의해주세요.</p>
      <hr>
    </div> 
      <p>클래스 강사님께 문의하기</p>

      <!-- 클래스 카드 -->
      <div class="class-card">
        <!-- 썸네일 -->
        <div class="thumbnail-wrapper" onclick="location.href='qna_write.html?classId=00001'">
          <span class="badge bg-danger text-white badge-status">수강신청중</span>
          <img src="https://placehold.co/160x100" alt="썸네일">
        </div>

        <!-- 정보 -->
        <div class="class-info">
          <div class="class-name" onclick="location.href='qna_write.html?classId=00001'">수채화 원데이 클래스</div>
          <p><strong>클래스 번호:</strong> class-00001</p>
          <p><strong>클래스 가격:</strong> 30,000원</p>
        </div>

        <!-- 버튼 -->
        <div>
          <button class="btn btn-outline-secondary btn-sm btn-inquire">강사님께 문의하기</button>
        </div>
      </div>

      <!-- 또 하나 예시 -->
      <div class="class-card">
        <div class="thumbnail-wrapper" onclick="location.href='qna_write.html?classId=00002'">
          <span class="badge bg-warning text-dark badge-status">오픈예정</span>
          <img src="https://placehold.co/160x100" alt="썸네일">
        </div>
        <div class="class-info">
          <div class="class-name" onclick="location.href='qna_write.html?classId=00002'">마크라메 만들기</div>
          <p><strong>클래스 번호:</strong> class-00002</p>
          <p><strong>클래스 가격:</strong> 40,000원</p>
        </div>
        <div>
          <button class="btn btn-outline-secondary btn-sm btn-inquire">강사님께 문의하기</button>
        </div>
      </div>

    </div>
  </div>
  
   <%@ include file="../common/footer.jsp" %>
</body>
</html>