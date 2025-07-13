<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


		<!-- 검색 필터 박스 -->
		<form action="${cp}/searchcClass" method="post">
			<div id="searchFilterBox"
				class="d-none bg-white border rounded shadow p-4 w-100 position-absolute start-50 translate-middle-x"
				style="max-width: 1200px; top: 120px; z-index: 1050; color: #E63946;">
				<div class="mb-3 d-flex gap-2">
					<p class="text-white px-3 py-2 rounded"
						style="background-color: #E63946; margin: 0;">클래스</p>
					<p class="text-white px-3 py-2 rounded"
						style="background-color: #E63946; margin: 0;">소셜링</p>

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


					<div class="row">
						<div class="col-md-6">
							<div class="mb-3">
								<label class="form-label fw-semibold">지역</label> <select
									class="form-select">
									<option selected>전체</option>
									<option>서울</option>
									<option>인천</option>
									<option>부산</option>
									<option>대구</option>
									<option>울산</option>
									<option>광주</option>
									<option>대전</option>
									<option>세종</option>
									<option>기타</option>
									<!--지역 값 보내기 -->
								</select> <input type="hidden" name="region" id="dayInput">
							</div>
							<!-- 1차 카테고리 -->
							<div class="mb-3">
								<label for="category1" class="form-label fw-bold">1차
									카테고리</label> <select id="category1" name="category1"
									class="form-select" required>
									<option value="">선택해주세요</option>
									<option value="핸드메이드" selected>핸드메이드</option>
									<option value="쿠킹">쿠킹</option>
									<option value="플라워·가드닝">플라워·가드닝</option>
									<option value="드로잉">드로잉</option>
									<option value="음악">음악</option>
									<option value="레저·스포츠">레저·스포츠</option>
									<option value="뷰티">뷰티</option>
									<option value="반려동물">반려동물</option>
									<option value="체험">체험</option>
									<option value="자기계발">자기계발</option>
									<option value="로컬여행">로컬여행</option>
								</select>
							</div>

							<!-- 2차 카테고리 -->
							<div class="mb-3">
								<label for="category2" class="form-label fw-bold">2차
									카테고리</label> <select id="category2" name="category2"
									class="form-select">
									<option value="">1차를 먼저 선택하세요</option>
								</select>
							</div>

							<!-- <input type="hidden" name="categoryId" id="categoryId"> -->
							<div class="mb-3">
								<label class="form-label fw-semibold">요일</label>
								<div class="d-flex gap-2 flex-wrap">
									<button type="button" class="btn btn-light toggle-btn">평일</button>
									<button type="button" class="btn btn-light toggle-btn">토요일</button>
									<button type="button" class="btn btn-light toggle-btn">일요일</button>
								</div>
								<!--요일 값 보내기 -->
								<input type="hidden" name="day" id="dayInput">
							</div>
							<div class="mb-3">
								<label class="form-label fw-semibold">난이도</label>
								<div class="d-flex gap-2 flex-wrap">
									<button type="button" class="btn btn-light toggle-btn">입문</button>
									<button type="button" class="btn btn-light toggle-btn">중급</button>
									<button type="button" class="btn btn-light toggle-btn">고급</button>
								</div>
								<!--난이도 보내기 -->
								<input type="hidden" name="difficulty" id="dayInput">
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

					<div class="mt-4 d-flex justify-content-end gap-3">

						<button type="submit" class="btn btn-light"
							onclick="toggleSearchBox()">검색하기</button>
						<button type="submit" class="btn btn-light">닫기</button>
					</div>
				</div>
			</div>
		</form>

		<script>
const filterBox = document.getElementById('searchFilterBox');
const searchInput = document.getElementById('searchInput');


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


