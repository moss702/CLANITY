<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="community-sidebar">
  <!-- 커뮤니티 이름 -->
  <a href="${cp}/community" class="fw-bold d-block text-dark text-decoration-none mb-2 fs-5">
    클래스 커뮤니티 이름
  </a>
  <hr class="my-3">

  <!-- ✅ 기본 카테고리 (아이콘 포함) -->
  <div class="d-grid gap-0 mb-3">
		<a href="${cp}/community_view" class="category-list-btn d-block text-start">
		  <i class="fa-solid fa-comment-dots me-2"></i> 클래스 후기
		</a>
    <button class="category-list-btn">
      <i class="fa-regular fa-circle-question me-2"></i> 클래스 문의
    </button>
  </div>

  <!-- ✅ 구분선 -->
  <hr class="my-1 mb-2">

  <!-- ✅ 개설 카테고리 -->
  <div class="d-grid gap-0 mb-2">
    <button class="category-list-btn">
     후기 모음집
    </button>
    <button class="category-list-btn">
     교재 자료실
    </button>
  </div>

  <!-- ✅ 관리 버튼 -->
  <button class="btn btn-danger w-100">커뮤니티 관리</button>
</div>
