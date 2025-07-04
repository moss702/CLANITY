<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>커뮤니티_Feed형태</title>
  <link rel="stylesheet" href="${cp}/css/qna_style.css" />
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container-fluid mt-4">
  <div class="row">
    <div class="col-md-3">
		<%@ include file="../community/community_sidebar.jsp" %>
    </div>

    <!-- Main Content -->
    <div class="col-md-9">

       <!-- 게시글 목록 (우측 메인) -->
      <div class="col-md-9">
        <div class="board-header">
           <div class="d-flex align-items-baseline gap-2">
             <h5 class="fw-bold mb-0">📋 카테고리 이름</h5>
             <span></span>
             <p class="text-muted">카테고리에 대한 설명</p>
            </div>
        </div>
      
      <!-- 검색 & 글쓰기 영역 -->
      <div class="board-tools d-flex justify-content-center align-items-center">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Search">
          <button class="btn btn-danger btn-sm" style="width: 57px;">검색</button>
        </div>
      </div>
      <!-- 글쓰기 폼 -->
      <div class="post-form">
        <div class="mb-2 fw-bold">✍️ 글쓰기</div>
        <textarea class="form-control mb-2" rows="3" placeholder="무엇이든 자유롭게 작성해보세요."></textarea>
        <div class="d-flex justify-content-between align-items-center">
          <input type="file" class="form-control form-control-sm w-50">
          <button class="btn btn-danger btn-sm">게시하기</button>
        </div>
      </div>

      <!-- 피드 카드 -->
      <div class="feed-card">
        <div class="delete-btn">삭제</div> <!-- 본인 글일 경우만 노출 -->
        <div class="feed-header"><strong>_misisb</strong> · 13시간 전</div>
        <div class="feed-content">Family Dinner ✨</div>
        <div class="feed-images">
          <img src="https://placehold.co/150x150" alt="img1" />
          <img src="https://placehold.co/150x150" alt="img2" />
          <img src="https://placehold.co/150x150" alt="img3" />
        </div>
        <div class="feed-actions">❤️ 14</div>
      </div>

      <div class="feed-card">
        <div class="feed-header"><strong>박수정</strong> · 2일 전</div>
        <div class="feed-content">정말 즐거운 클래스였습니다! 다음에도 또 참여하고 싶어요 💕</div>
        <div class="feed-images">
          <img src="https://placehold.co/150x150" alt="후기이미지" />
        </div>
        <div class="feed-actions">❤️ 6</div>
      </div>

      <div class="feed-card">
        <div class="delete-btn">삭제</div> <!-- 본인 글이라면 -->
        <div class="feed-header"><strong>최예림</strong> · 3일 전</div>
        <div class="feed-content">혹시 클래스 준비물은 무엇이 필요한가요?</div>
        <div class="feed-actions">❤️ 3</div>
      </div>

    </div>
  </div>
</div>
    </div>
  </div>
</div>

<!-- Bootstrap Icons (for 아이콘들) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</body>
</html>

