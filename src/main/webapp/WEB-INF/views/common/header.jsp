<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>CLANITY 검색 헤더</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="d-flex flex-column min-vh-100">

	<header class="px-4 py-3 bg-white border-bottom">
		<div
			class="container d-flex justify-content-between align-items-center flex-wrap gap-3">
			<div class="flex-shrink-0">
				<a href="${pageContext.request.contextPath}/categoryMain"
					class="text-decoration-none fw-bold fs-2 text-danger">CLANITY</a>
			</div>
			<nav class="d-flex gap-3 align-items-center flex-shrink-0">
				<a class="text-dark text-decoration-none fw-semibold" href="#">클래스</a>
				<a class="text-dark text-decoration-none fw-semibold" href="#">소셜링</a>
				<div class="dropdown">
					<a href="#"
						class="text-dark text-decoration-none fw-semibold dropdown-toggle"
						data-bs-toggle="dropdown">카테고리</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">전체</a></li>
						<li><a class="dropdown-item" href="#">클래스</a></li>
						<li><a class="dropdown-item" href="#">소셜링</a></li>
					</ul>
				</div>
			</nav>
			<form action="/search" method="GET" class="flex-grow-1"
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
			<nav
				class="d-flex gap-3 align-items-center flex-shrink-0 text-danger">
				<i class="fa-solid fa-list fs-5"></i> <i
					class="fa-solid fa-heart fs-5"></i> <i
					class="fa-solid fa-bell fs-5"></i> <i
					class="fa-solid fa-circle-user fs-5"></i> 
					<a
					class="text-dark text-decoration-none" href="${cp}/openClass/open">열기</a> 
					<a
					class="text-dark text-decoration-none" href="${cp}/member/login">로그인</a>
			</nav>
		</div>
	</header>

	<!-- 검색 필터 박스 -->
	<div class="container my-4 flex-grow-1 position-relative">
		<div id="searchFilterBox"
			class="d-none bg-white border rounded shadow p-4 w-100 position-absolute start-50 translate-middle-x"
			style="max-width: 1200px; top: 120px; z-index: 1050; color: #E63946;">
			<div class="mb-3 d-flex gap-2">
				<button type="button" class="btn btn-danger text-white">클래스</button>
				<button type="button" class="btn btn-danger text-white">소셜링</button>
			</div>
			<!-- 검색어 입력 추가 (기존 filterBox 안 최상단에 위치) -->
			<div class="mb-4">
				<label for="filterKeyword" class="form-label fw-semibold">검색어</label>
				<div
					class="d-flex align-items-center gap-2 px-4 py-2 rounded-pill border"
					style="border-color: #E63946;">
					<input type="text" id="filterKeyword" name="filterKeyword"
						class="form-control border-0 p-0 bg-transparent fw-semibold text-danger"
						placeholder="#취미시작은클래니티 #클래니티라이프"
						style="font-size: 14px; outline: none;">
					<button type="button" class="bg-transparent border-0">
						<i class="fa-solid fa-magnifying-glass text-danger"></i>
					</button>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="mb-3">
						<label class="form-label fw-semibold">지역</label> <select
							class="form-select">
							<option selected>전체</option>
							<option>서울</option>
							<option>부산</option>
						</select>
					</div>
					<div class="mb-3">
						<label class="form-label fw-semibold">카테고리</label> <select
							class="form-select">
							<option selected>전체</option>
							<option>요리</option>
							<option>미술</option>
						</select>
					</div>
					<div class="mb-3">
						<label class="form-label fw-semibold">요일</label>
						<div class="d-flex gap-2 flex-wrap">
							<button type="button" class="btn btn-light toggle-btn">평일</button>
							<button type="button" class="btn btn-light toggle-btn">토요일</button>
							<button type="button" class="btn btn-light toggle-btn">일요일</button>
						</div>
					</div>
					<div class="mb-3">
						<label class="form-label fw-semibold">난이도</label>
						<div class="d-flex gap-2 flex-wrap">
							<button type="button" class="btn btn-light toggle-btn">입문</button>
							<button type="button" class="btn btn-light toggle-btn">중급</button>
							<button type="button" class="btn btn-light toggle-btn">고급</button>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="mb-3">
						<label class="form-label fw-semibold">인원</label> <select
							class="form-select">
							<option selected>선택 안함</option>
							<option>1~2명</option>
							<option>3~5명</option>
							<option>6명 이상</option>
						</select>
					</div>
					<div class="mb-3">
						<label class="form-label fw-semibold">시간</label>
						<div class="d-flex gap-2 align-items-center">
							<input type="time" class="form-control" name="start_time"
								style="max-width: 120px;"> <span class="text-muted">~</span>
							<input type="time" class="form-control" name="end_time"
								style="max-width: 120px;">
						</div>
					</div>
					<div class="mb-3">
						<label class="form-label fw-semibold">금액</label>
						<div class="d-flex gap-2 align-items-center">
							<input type="number" class="form-control text-center"
								name="min_price" placeholder="0원" style="max-width: 100px;">
							<span class="text-muted">~</span> <input type="number"
								class="form-control text-center" name="max_price"
								placeholder="1,000,000원" style="max-width: 140px;">
						</div>
					</div>
				</div>
			</div>
			<div class="mt-4">
				<label class="form-label fw-semibold">추천 검색어</label>
				<div class="d-flex flex-wrap gap-2">
					<button class="btn btn-light toggle-btn">단체</button>
					<button class="btn btn-light toggle-btn">베이킹</button>
					<button class="btn btn-light toggle-btn">반지</button>
					<button class="btn btn-light toggle-btn">드로잉</button>
					<button class="btn btn-light toggle-btn">선물</button>
					<button class="btn btn-light toggle-btn">데이트</button>
					<button class="btn btn-light toggle-btn">향수</button>
					<button class="btn btn-light toggle-btn">스포츠</button>
					<button class="btn btn-light toggle-btn">목공</button>
					<button class="btn btn-light toggle-btn">도자기</button>
					<button class="btn btn-light toggle-btn">캔들</button>
				</div>
			</div>
			<div class="mt-4 d-flex gap-3">
				<button class="btn btn-light" onclick="toggleSearchBox()">닫기</button>
				<button class="btn btn-danger text-white">검색하기</button>
			</div>
		</div>
	</div>

	<script>
  const filterBox = document.getElementById('searchFilterBox');
  const searchInput = document.getElementById('searchInput');
  const toggleBtn = document.getElementById('toggleSearchFilter');

  function toggleSearchBox() {
    filterBox.classList.toggle('d-none');
    if (!filterBox.classList.contains('d-none')) {
      searchInput.placeholder = '';
    } else {
      searchInput.placeholder = '#취미시작은클래니티 #클래니티라이프';
    }
  }

  toggleBtn.addEventListener('click', toggleSearchBox);
  searchInput.addEventListener('click', toggleSearchBox);

  document.querySelectorAll('.toggle-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      btn.classList.toggle('btn-danger');
      btn.classList.toggle('text-white');
      btn.classList.toggle('btn-light');
    });
  });
</script>

</body>
</html>