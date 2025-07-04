<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>커뮤니티 메인 페이지</title>
  <link rel="stylesheet" href="${cp}/css/qna_style.css"/>
</head>

<body>
<%@ include file="../common/header.jsp" %>
<main>
<div class="container-fluid mt-4">
  <div class="row">
    <div class="col-md-3">
		<%@ include file="../community/community_sidebar.jsp" %>
    </div>

    <!-- Main Content -->
    <div class="col-md-9 mb-5">
  <!-- 상단 배너 -->
  <div class="community-header">
    <img src="https://placehold.co/800x180/eee/888?text=community+banner+welcome" alt="배너 이미지">
    
    <div class="community-header-body d-flex justify-content-between align-items-center px-4 py-3">
      
      <!-- 사진 -->
      <div class="profile-thumbnail me-3">사진</div>

      <!-- 제목 + 정보 -->
      <div class="flex-grow-1">
        <h4 class="mb-1">클래스 커뮤니티 제목</h4>
        <p class="mb-0 small text-muted">강사 닉네임(이름) | 멤버 수 | 게시글 수 | 후기 수</p>
      </div>

		<!-- 버튼 2개 -->
		<div class="d-flex flex-column align-items-end gap-2 ms-3 text-nowrap">
		  <button class="btn btn-outline-success btn-sm text-center">
		    커뮤니티<br>가입하기
		  </button>
		  <button class="btn btn-outline-primary btn-sm text-center">
		    강사님께<br>문의하기
		  </button>
		</div>
	</div>
</div>

      <!-- 클래스 목록 섹션 -->
      <div>
        <div class="d-flex justify-content-between align-items-center mb-3">
          <h5 class="section-title">📚 클래스 목록</h5>
          <div>
            <button class="btn btn-outline-secondary btn-sm">전체</button>
            <button class="btn btn-outline-secondary btn-sm">진행중</button>
            <button class="btn btn-outline-secondary btn-sm">오픈예정</button>
            <button class="btn btn-outline-secondary btn-sm">마감</button>
          </div>
        </div>

                <div class="row">
          <div class="col-md-4">
            <div class="community-class-card">
              <div class="class-img-wrapper">
                <span class="badge bg-danger status-badge-overlay">진행중</span>
                <img src="https://placehold.co/300x200" alt="썸네일" class="img-fluid rounded mb-2">
              </div>
              <h6 class="mt-2">수채화 원데이 클래스</h6>
              <p class="small text-muted">서울 홍대 | 후기 12개</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="community-class-card">
              <div class="class-img-wrapper">
                <span class="badge bg-success status-badge-overlay">오픈예정</span>
                <img src="https://placehold.co/300x200" alt="썸네일" class="img-fluid rounded mb-2">
              </div>
              <h6 class="mt-2">나만의 마크라메 만들기</h6>
              <p class="small text-muted">서울 성수 | 후기 8개</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="community-class-card">
              <div class="class-img-wrapper">
                <span class="badge bg-secondary status-badge-overlay">마감</span>
                <img src="https://placehold.co/300x200" alt="썸네일" class="img-fluid rounded mb-2">
              </div>
              <h6 class="mt-2">드로잉 입문 클래스</h6>
              <p class="small text-muted">서울 종로 | 후기 25개</p>
            </div>
          </div>
        </div>
      </div>

 	</div>
  </div>
</div>
</main>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
