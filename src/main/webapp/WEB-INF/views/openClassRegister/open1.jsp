<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp"%>
<link rel="stylesheet" href="qna_style.css" />
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<main class="flex-fill py-5">
		<div class="container" style="max-width: 800px;">

			<!-- STEP 표시 -->
			<div class="mb-4">
				<h5 class="fw-bold text-secondary">STEP.1 클래스 소개</h5>
				<h3 class="fw-bold" style="color: #E63946;">제목 및 카테고리</h3>
				<p class="text-muted">클래스/모임 제목과 카테고리를 등록해주세요</p>
			</div>
			<form action="${cp}/openClassRegister/open1" method="post"
				class="p-0">
				<!-- 제목 입력 -->
				<div class="mb-4">
					<label for="title" class="form-label fw-semibold">클래스 명 <span
						class="text-danger">(필수)</span></label> <input type="text" id="title"
						class="form-control" maxlength="50" placeholder="제목을 입력해주세요">
					<div class="text-end small text-muted mt-1">0 / 50</div>
				</div>

				<!-- 1차 카테고리 -->
				<!-- <div class="mb-3">
					<label for="category1" class="form-label fw-bold">1차 카테고리</label> <select
						id="category1" name="category1" class="form-select" required>
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
				</div> -->

				<!-- 2차 카테고리 -->
				<!-- <div class="mb-3">
					<label for="category2" class="form-label fw-bold">2차 카테고리</label> <select
						id="category2" name="category2" class="form-select">
						<option value="">1차를 먼저 선택하세요</option>
					</select>
				</div>

				<input type="hidden" name="categoryId" id="categoryId"> -->


				<!-- 지역 + 주소 -->
				<div class="mb-3">
					<label class="form-label fw-semibold">클래스 주소 <span
						class="text-danger">(필수)</span></label>

					<!-- 지역 선택 + 주소 검색 -->
					<div class="d-flex gap-2 mb-2">
						<select class="form-select" name="region"
							style="max-width: 150px;">
							<option value="">지역</option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="부산">부산</option>
							<option value="인천">인천</option>
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="기타">기타</option>
						</select> 
						
					</div>

					<!-- 상세주소 -->
					<div class="d-flex gap-2">
					<button type="button" class="btn btn-dark" style="white-space: nowrap;">주소 검색</button>
					<input type="text" class="form-control" name="address"
						placeholder="상세 주소를 입력해주세요">
						</div>
				</div>
				<!-- 버튼 -->
				<div class="d-flex justify-content-between mt-5">
					<a href="${cp}/categoryMain" class="btn btn-outline-secondary px-4">이전</a>
					<button type="submit" class="btn text-white px-4"
						style="background-color: #E63946;">다음</button>
				</div>
			</form>
		</div>

	</main>

	<%@ include file="../common/footer.jsp"%>

	<!-- SCRIPT -->
	<script>
	const categoryMap = {
			  "전체": [],
			  "핸드메이드": [
			    "전체", "캔들·디퓨저", "향수", "비누·벼쎌밤", "위빙·소잉", "라탄·마크라메", "액세서리",
			    "가죽", "도자기", "목공", "레진", "디자인·굿즈", "업사이클링", "기타 공예"
			  ],
			  "쿠킹": [
			    "전체", "베이킹", "요리", "떡·앙금", "디저트·음료", "커피·바리스타", "기타 쿠킹"
			  ],
			  "플라워·가드닝": [],
			  "드로잉": [
			    "전체", "소묘", "펜화", "컬러그라피", "수채화", "동양화", "서양화", "민화",
			    "일러스트", "유화", "아크릴", "디지털 드로잉", "기타 드로잉"
			  ],
			  "음악": [
			    "전체", "피아노", "기타·우쿨렐레", "보컬", "작사·작곡", "프로듀싱", "기타 악기"
			  ],
			  "레저·스포츠": [
			    "전체", "피트니스", "실내 운동", "야외 운동", "댄스", "레저", "기타 스포츠"
			  ],
			  "뷰티": [
			    "전체", "메이크업", "헤어", "네일아트", "타투", "셀프케어"
			  ],
			  "반려동물": [
			    "전체", "펫 푸드", "펫 에티켓", "펫 액세서리", "펫 미용", "기타 펫 클래스"
			  ],
			  "체험": [],
			  "자기계발": [],
			  "로컬여행": []
			};



	const categoryIdMap = {
			  "드로잉>서양화": 10035,
			  "드로잉>민화": 10036,
			  "드로잉>일러스트": 10037,
			  "드로잉>유화": 10038,
			  "드로잉>아크릴": 10039,
			  "드로잉>디지털 드로잉": 10040,
			  "드로잉>기타 드로잉": 10041,
			  "음악>[NULL]": 10042,
			  "음악>전체": 10043,
			  "음악>피아노": 10044,
			  "음악>기타·우쿨렐레": 10045,
			  "음악>보컬": 10046,
			  "음악>작사·작곡": 10047,
			  "음악>프로듀싱": 10048,
			  "음악>기타 악기": 10049,
			  "레저·스포츠>[NULL]": 10050,
			  "레저·스포츠>전체": 10051,
			  "레저·스포츠>피트니스": 10052,
			  "레저·스포츠>실내 운동": 10053,
			  "레저·스포츠>야외 운동": 10054,
			  "레저·스포츠>댄스": 10055,
			  "레저·스포츠>레저": 10056,
			  "레저·스포츠>기타 스포츠": 10057,
			  "뷰티>[NULL]": 10058,
			  "뷰티>전체": 10059,
			  "뷰티>메이크업": 10060,
			  "뷰티>헤어": 10061,
			  "뷰티>네일아트": 10062,
			  "뷰티>타투": 10063,
			  "뷰티>셀프케어": 10064,
			  "반려동물>[NULL]": 10065,
			  "반려동물>전체": 10066,
			  "반려동물>펫 푸드": 10067,
			  "반려동물>펫 에티켓": 10068,
			  "반려동물>펫 액세서리": 10069,
			  "반려동물>펫 미용": 10070,
			  "반려동물>기타 펫 클래스": 10071,
			  "체험>[NULL]": 10072,
			  "자기계발>[NULL]": 10073,
			  "로컬여행>[NULL]": 10074
			};


  // 옵션 갱신 함수
  function updateSubCategoryOptions() {
    const selected = category1.value;
    const subcategories = categoryMap[selected] || [];

    category2.innerHTML = "";

    if (subcategories.length > 0) {
      category2.innerHTML = '<option value="">2차 카테고리 선택</option>';
      subcategories.forEach(item => {
        const option = document.createElement("option");
        option.value = item;
        option.textContent = item;
        category2.appendChild(option);
      });
    } else {
      category2.innerHTML = '<option value="">해당 없음</option>';
    }
  }
  
  const category1 = document.getElementById("category1");
  const category2 = document.getElementById("category2");
  const selectedCategory = document.getElementById("selectedCategory");

  function updateSubCategoryOptions() {
    const selected = category1.value;
    const subcategories = categoryMap[selected] || [];

    category2.innerHTML = "";

    if (subcategories.length > 0) {
      category2.innerHTML = '<option value="">2차 카테고리 선택</option>';
      subcategories.forEach(item => {
        const option = document.createElement("option");
        option.value = item;
        option.textContent = item;
        category2.appendChild(option);
      });
    } else {
      category2.innerHTML = '<option value="">해당 없음</option>';
    }
  }

  function updateSelectedCategory() {
    const cat1 = category1.value;
    const cat2 = category2.value;

    if (!cat1) {
      selectedCategory.textContent = "선택된 카테고리: >";
    } else if (!cat2 || category2.options.length <= 1 || !cat2) {
      selectedCategory.textContent = `선택된 카테고리: ${cat1}`;
    } else {
      selectedCategory.textContent = `선택된 카테고리: ${cat1} > ${cat2}`;
    }
  }

  category1.addEventListener("change", () => {
    updateSubCategoryOptions();
    updateSelectedCategory();
  });

  category2.addEventListener("change", updateSelectedCategory);

  window.addEventListener("DOMContentLoaded", () => {
    updateSubCategoryOptions();
    updateSelectedCategory();
  });

  // ✅ form 제출 시 categoryId 설정
  document.querySelector("form").addEventListener("submit", function (e) {
    const cat1 = category1.value;
    const cat2 = category2.value || "[NULL]";
    const key = `${cat1}>${cat2}`;
    const categoryId = categoryIdMap[key];

    if (!categoryId) {
      alert("선택한 카테고리에 대한 ID를 찾을 수 없습니다.");
      e.preventDefault();
      return;
    }

    document.getElementById("categoryId").value = categoryId;
  });
</script>

</body>
</html>
