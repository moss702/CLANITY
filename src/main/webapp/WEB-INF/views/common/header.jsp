<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="px-4 py-3 bg-white border-bottom sticky-top">
	<div
		class="container d-flex justify-content-between align-items-center flex-wrap gap-3">
		<div class="flex-shrink-0">
			<a href="${cp}/categoryMain"
				class="text-decoration-none fw-bold fs-2 text-danger">CLANITY</a>
		</div>
		<nav class="d-flex gap-3 align-items-center flex-shrink-0">
			<a class="text-dark text-decoration-none fw-semibold " href="${cp}/categoryList?categoryId=10003">클래스</a>
			<a class="text-dark text-decoration-none fw-semibold" href="${cp}/categoryAll">커뮤니티</a>
			
		</nav>
		<form action="/search" method="post" class="flex-grow-1"
			style="max-width: 600px; min-width: 200px;">
			<div
				class="d-flex align-items-center gap-2 px-4 py-2 rounded-pill border"
				style="border-color: #E63946;">
				<input type="text" name="query" id="searchInput"
					class="form-control border-0 p-0 bg-transparent fw-semibold text-danger"
					placeholder="#취미시작은클래니티 #클래니티라이프"
					style="font-size: 14px; outline: none;">
				<button type="button" class="bg-transparent border-0"
					id="toggleSearchFilter">
					<i class="fa-solid fa-magnifying-glass text-danger"></i>
				</button>
			</div>
		</form>
		<nav class="d-flex gap-3 align-items-center flex-shrink-0 text-danger">
			<i class="fa-solid fa-list fs-5"></i> <i
				class="fa-solid fa-heart fs-5"></i> <i class="fa-solid fa-bell fs-5"></i>
			<i class="fa-solid fa-circle-user fs-5"></i> <a
				class="text-dark text-decoration-none"
				href="${cp}/openClassRegister/open">열기</a>
			<c:if test="${empty member}">
				<a class="text-dark text-decoration-none" href="${cp}/member/login">로그인</a>
			</c:if>
			<c:if test="${not empty member}">
				<a class="text-dark text-decoration-none" href="${cp}/member/logout">로그아웃</a>
			</c:if>
		</nav>
		
	</div>
</header>


