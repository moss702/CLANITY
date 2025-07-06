<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사이드바 -->
<aside class="col-md-2 sidebar p-3">
  <h4 class="flex-shrink-0">
		<a href="${cp}/categoryMain"
			class="text-decoration-none fw-bold fs-2 text-danger">CLANITY</a>
		</h4>
  <div class="mb-4">
    <div class="d-flex align-items-center">
      <img src="https://via.placeholder.com/50" class="rounded-circle me-2" alt="profile">
      <strong>포에틱/X</strong>
    </div>
    <button class="btn btn-outline-light btn-sm mt-2 w-100">관리자 프로필</button>
  </div>
  <ul class="nav flex-column">
    <li class="nav-item"><a class="nav-link active" href="${cp}/admin">회원관리</a></li>
    <li class="nav-item"><a class="nav-link" href="${cp}/admin/business">사업자 신청 처리</a></li>
    <li class="nav-item"><a class="nav-link" href="${cp}/admin/board">게시판 컨텐츠 관리</a></li>
    <li class="nav-item"><a class="nav-link" href="${cp}/admin/notice">공지사항 관리</a></li>
    <li class="nav-item"><a class="nav-link" href="#">상품 관리</a></li>
    <li class="nav-item"><a class="nav-link" href="#">마켓 관리</a></li>
    <!-- ...생략 가능 -->
  </ul>
</aside>