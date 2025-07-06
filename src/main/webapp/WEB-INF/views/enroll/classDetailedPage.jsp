<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
	background-color: white;
}

main {
	margin-top: 100px;
}

.fixed-payment-box {
	position: sticky;
	top: 100px;
}

header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1030;
}

body {
	padding-top: 110px; /* header 높이 고려 */
}

@media ( min-width : 992px) {
	.sticky-sidebar {
		position: sticky;
		top: 120px;
		z-index: 10;
	}
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f9f9f9;
}

.container-max {
	max-width: 1200px;
	margin: 60px auto;
}

.section-box {
	background: #fff;
	border: 1px solid #dee2e6;
	border-radius: 0.75rem;
	padding: 1.5rem;
	margin-bottom: 1.5rem;
}

.section-title {
	font-weight: bold;
	font-size: 1.1rem;
	margin-bottom: 1rem;
}

.text-danger-light {
	color: #E63946;
}

.text-primary-custom {
	color: #1a7cc7;
}

.bg-warning-light {
	background-color: #fff9e6;
}

.btn-danger {
	background-color: #E63946;
	border-color: #E63946;
}

.btn-danger:hover {
	background-color: #d12f3f;
	border-color: #d12f3f;
}

table th, table td {
	font-size: 14px;
	vertical-align: middle;
}
/* 기존 스타일들 생략 후 추가 또는 수정 */
@media ( min-width : 992px) {
	.sticky-sidebar {
		position: -webkit-sticky;
		position: sticky;
		top: 140px; /* header 높이에 맞춰 조정 */
		z-index: 2;
		align-self: start; /* flex 박스 내에서 위치 고정 */
	}
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<main class="container my-5">
		<div class="row g-4">
			<!-- 좌측 클래스 이미지 -->
			<div class="col-lg-8">
				<img
					src="https://www.munto.kr/_next/image?url=http%3A%2F%2Fimages.munto.kr%2Fproduction-socialing%2F1749734559696-photo-5f7et-471758-0&w=1920&q=75"
					class="img-fluid rounded w-100 mb-3" alt="클래스 대표 이미지">

				<div class="d-flex gap-2 overflow-auto">
					<img src="https://placehold.co/100x100" class="img-thumbnail"
						alt="썸네일1"> <img src="https://placehold.co/100x100"
						class="img-thumbnail" alt="썸네일2"> <img
						src="https://placehold.co/100x100" class="img-thumbnail"
						alt="썸네일3"> <img src="https://placehold.co/100x100"
						class="img-thumbnail" alt="썸네일4">
				</div>

				<!-- 태그 -->
				<div class="mt-4 d-flex flex-wrap gap-2">
					<span class="badge bg-warning-subtle text-dark">드로잉</span> <span
						class="badge bg-info-subtle text-dark">아크릴</span> <span
						class="badge bg-success-subtle text-dark">원데이</span> <span
						class="badge bg-secondary-subtle text-dark">기타</span>
				</div>

				<!-- 클래스 타이틀 -->
				<h3 class="mt-3 fw-bold">[홍대/연남] 초보자도 고퀄리티 그림 완성! 아크릴 원데이 클래스</h3>

				<!-- 정보 아이콘 -->
				<div class="d-flex align-items-center gap-3 mt-2 text-muted small">
					<span><i class="fa-regular fa-clock me-1"></i>2시간</span> <span><i
						class="fa-solid fa-location-dot me-1"></i>서울 마포구 연남동</span> <span><i
						class="fa-solid fa-user-group me-1"></i>수용인원 1~6명</span>
				</div>

				<!-- 탭 메뉴 -->
				<ul class="nav nav-tabs mt-4 " id="classTab">
					<li class="nav-item "><a class="nav-link active" href="#intro">클래스
							소개</a></li>
					<li class="nav-item"><a class="nav-link  text-dark"
						href="#curriculum">커리큘럼</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="#host">호스트 소개</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="#location">위치</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="#review">후기</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#qna">문의</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#faq">자주
							묻는 질문</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="#notice">유의사항</a></li>
				</ul>

				<!-- 상세 내용 -->
				<div class="pt-4">
					<section id="intro" class="mb-5">
						<h5 class="fw-bold">클래스 소개</h5>
						<p>이 클래스는 초보자도 쉽게 따라올 수 있는 단계별 아크릴 페인팅을 통해, 나만의 명화 작품을 만들어보는
							수업입니다.</p>
					</section>
					<section id="curriculum" class="mb-5">
						<h5 class="fw-bold">커리큘럼</h5>
						<ul>
							<li>1단계: 도안 선택 및 밑그림 그리기</li>
							<li>2단계: 배경 채색 및 레이어 쌓기</li>
							<li>3단계: 디테일 보완 및 마무리</li>
						</ul>
					</section>
					<section id="host" class="mb-5">
						<h5 class="fw-bold">호스트 소개</h5>
						<p>미술전공자이자 전시 경험이 있는 아티스트가 직접 진행합니다. 수업 중 피드백과 팁을 적극적으로 제공합니다.</p>
					</section>
					<section id="location" class="mb-5">
						<h5 class="fw-bold">위치</h5>
						<p>서울시 마포구 연남동 123-45 3층 (홍대입구역 도보 5분)</p>
					</section>
					<section id="review" class="mb-5">
						<h5 class="fw-bold">후기</h5>
						<p>참여자들의 만족도 5.0! “친절하고 재밌었어요”, “작품 완성도 최고였어요” 등 좋은 평가를 받고
							있습니다.</p>
					</section>
					<section id="qna" class="mb-5">
						<h5 class="fw-bold">문의</h5>
						<p>수업에 대한 궁금한 점이 있다면 언제든지 문의해주세요. 최대 24시간 이내 답변드립니다.</p>
					</section>
					<section id="faq" class="mb-5">
						<h5 class="fw-bold">자주 묻는 질문</h5>
						<p>재료는 제공되나요? → 네, 모든 재료가 포함되어 있습니다.</p>
					</section>
					<section id="notice">
						<h5 class="fw-bold">유의사항</h5>
						<p>예약 후 24시간 이전까지 취소 가능합니다. 이후 취소는 환불이 어렵습니다.</p>
					</section>
				</div>
			</div>

			<!-- 우측 예약 박스 -->
			<div class="col-lg-4 sticky-sidebar">
				<div class="border rounded p-4 mb-4">
					<h5 class="fw-bold">1. 클래스 일정</h5>
					<input type="date" id="classDate" class="form-control mb-2"
						value="2025-06-29">
					<div class="text-success small mb-2">✔ 당일 예약 가능 클래스 입니다</div>

					<!-- 시간 선택 -->
					<label class="form-label fw-semibold">개설된 클래스</label> <select
						class="form-select mb-2" id="classTime">
						<option value="13:00">오후 1:00 ~ 오후 3:00</option>
						<option value="14:00">오후 2:00 ~ 오후 4:00</option>
						<option value="15:00">오후 3:00 ~ 오후 5:00</option>
					</select>

					<!-- 기본 포함 안내 -->
					<ul id="baseOptionList" class="list-unstyled small text-muted">
						<li>✔ 재료 포함</li>
						<li>✔ 다과 제공</li>
					</ul>

					<!-- 가격 -->
					<div class="mt-3">
						<span class="text-decoration-line-through text-muted">40,000원</span>
						<span class="fw-bold text-danger ms-2">30,000원</span> <span
							class="text-muted small ms-1">/ 1인</span>
					</div>
				</div>

				<!-- 세부 옵션 -->
				<div class="border rounded p-4">
					<h5 class="fw-bold">2. 세부 선택 사항</h5>

					<!-- 추가 옵션 -->
					<label class="form-label">추가 수업 구성 선택</label> <select
						class="form-select mb-2" id="extraOption">
						<option value="">선택 없음</option>
						<option value="70ml 만들기 + 25,000원">70ml 만들기 + 25,000원</option>
						<option value="기념 포토카드 + 10,000원">기념 포토카드 + 10,000원</option>
					</select>

					<!-- 인원 -->
					<label class="form-label">인원 선택</label> <input type="number"
						class="form-control w-50 mb-2" value="1" min="1">

					<!-- 요약 표시 -->
					<div id="optionSummary" class="mt-3 text-muted small">✔ 재료 포함
						/ ✔ 다과 제공</div>

					<form
						action="${cp}/enroll/classDetailedPage"
						method="post">
						<input type="hidden" name="openId" value="${classOpen.openId}" />
						<input type="hidden" name="memberId" value="1" />
						<!-- 로그인 연동 시 세션에서 가져오도록 수정 -->
						<button type="submit"
							class="btn btn-danger text-white fw-bold w-100">클래스 결제하기</button>
					</form>
	</main>
	<!-- 푸터 -->

	<!-- 상세페이지 스크롤 내려가는 JS -->
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

	<!-- 우측클릭 박스 -->
	<script>
  const baseOptions = {
    '2025-06-29|13:00': ['✔ 재료 포함', '✔ 다과 제공'],
    '2025-06-29|14:00': ['✔ 재료 포함'],
    '2025-06-29|15:00': ['✔ 재료 포함', '✔ 간식 포함']
  };

  function updateOptionSummary() {
    const date = document.getElementById('classDate').value;
    const time = document.getElementById('classTime').value;
    const extra = document.getElementById('extraOption').value;
    const base = baseOptions[`${date}|${time}`] || [];
    const summary = [...base, extra && `+ ${extra}`].filter(Boolean).join(' / ');
    document.getElementById('optionSummary').textContent = summary;

    const baseList = document.getElementById('baseOptionList');
    baseList.innerHTML = base.map(opt => `<li>${opt}</li>`).join('');
  }

  document.getElementById('classDate').addEventListener('change', updateOptionSummary);
  document.getElementById('classTime').addEventListener('change', updateOptionSummary);
  document.getElementById('extraOption').addEventListener('change', updateOptionSummary);
</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>