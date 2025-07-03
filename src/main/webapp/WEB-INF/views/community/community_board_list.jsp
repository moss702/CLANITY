<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>커뮤니티_List형태</title>
  <link rel="stylesheet" href="qna_style.css" />
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container-fluid mt-4">
  <div class="row">
    <div class="col-md-3 mb-3">
      <div class="community-sidebar">
        <h5>클래스 커뮤니티 홈(인포)</h5>
        <hr>
        <a href="#">카테고리 : 클래스 후기</a>
        <a href="#">카테고리 : 강사가 개설한 게시판</a>
        
       <!--  강사 또는 모임장 권한이 있을때만 visible -->
        <button class="btn btn-danger w-100">커뮤니티 관리</button>
        
        
      </div>
    </div>


       <!-- 게시글 목록 (우측 메인) -->
      <div class="col-md-9">
        <div class="board-header">
           <div class="d-flex align-items-baseline gap-2">
             <h5 class="fw-bold mb-0">📋 카테고리 이름</h5>
             <span></span>
             <p class="text-muted">카테고리에 대한 설명</p>
            </div>
            <button class="btn btn-danger btn-sm" style="height:35px">글쓰기</button>
        </div>
      
      <!-- 검색 & 글쓰기 영역 -->
      <div class="board-tools d-flex justify-content-center align-items-center">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Search">
          <button class="btn btn-danger btn-sm" style="width: 57px;">검색</button>
        </div>
      </div>

      <!-- 게시글 카드 -->
      <a href="#" class="board-link">
        <div class="board-card">
          <div class="board-title">[후기] 정말 유익한 시간이었어요!</div>
          <div class="board-meta">작성자: 홍길동 | 날짜: 2025-06-30 | 조회수: 132</div>
        </div>
      </a>

      <a href="#" class="board-link">
        <div class="board-card">
          <div class="board-title">[공지] 다음 클래스 일정 안내</div>
          <div class="board-meta">작성자: 강사김 | 날짜: 2025-06-28 | 조회수: 85</div>
        </div>
      </a>

      <a href="#" class="board-link">
        <div class="board-card">
          <div class="board-title">[후기] 아크릴화가 처음인데도 잘 따라갈 수 있었어요</div>
          <div class="board-meta">작성자: 박수정 | 날짜: 2025-06-26 | 조회수: 58</div>
        </div>
      </a>

      <a href="#" class="board-link">
        <div class="board-card">
          <div class="board-title">[문의] 재료는 제공되나요?</div>
          <div class="board-meta">작성자: 최예림 | 날짜: 2025-06-24 | 조회수: 44</div>
        </div>
      </a>

    </div>
  </div>
</div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>
