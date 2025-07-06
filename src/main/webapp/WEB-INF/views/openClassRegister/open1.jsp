<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<main class="flex-fill py-5">
  <div class="container" style="max-width: 800px;">

    <!-- STEP 표시 -->
    <div class="mb-4">
      <h5 class="fw-bold text-secondary">STEP.1 클래스 소개</h5>
      <h3 class="fw-bold" style="color: #E63946;">제목 및 카테고리</h3>
      <p class="text-muted">클래스/모임 제목과 카테고리를 등록해주세요</p>
    </div>

    <!-- 제목 입력 -->
    <div class="mb-4">
      <label for="title" class="form-label fw-semibold">클래스 명 <span class="text-danger">(필수)</span></label>
      <input type="text" id="title" class="form-control" maxlength="50" placeholder="제목을 입력해주세요">
      <div class="text-end small text-muted mt-1">0 / 50</div>
    </div>

    <form action="/your-servlet" method="GET" class="p-0">
      <!-- 1차 카테고리 -->
      <div class="mb-3">
        <label for="category1" class="form-label fw-bold">1차 카테고리</label>
        <select id="category1" name="category1" class="form-select" required>
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
        <label for="category2" class="form-label fw-bold">2차 카테고리</label>
        <select id="category2" name="category2" class="form-select">
          <option value="">1차를 먼저 선택하세요</option>
        </select>
      </div>

      <!-- 선택된 카테고리 -->
      <div class="mb-4">
        <label class="form-label fw-bold">선택된 카테고리</label>
        <div id="selectedCategory" class="form-control bg-light text-secondary">선택된 카테고리: ></div>
      </div>

      <!-- 버튼 -->
       <div class="d-flex justify-content-between mt-5">
      <a href="${cp}/categoryMain" class="btn btn-outline-secondary px-4">이전</a>
      <a href="${cp}/openClassRegister/open2" class="btn text-white px-4" style="background-color: #E63946;">다음</a>
    </div>

    </form>
  </div>
</main>

<%@ include file="../common/footer.jsp" %>

<!-- SCRIPT -->
<script>
  const categoryMap = {
    "핸드메이드": ["가죽", "도자기", "목공", "레진", "디자인·굿즈", "업사이클링", "기타 공예"],
    "쿠킹": ["전체", "베이킹", "요리", "떡·앙금", "디저트·음료", "커피·바리스타", "기타 쿠킹"],
    "플라워·가드닝": [],
    "드로잉": ["전체", "소묘", "펜화", "컬러그라피", "수채화", "동양화", "서양화", "민화", "일러스트", "유화", "아크릴", "디지털 드로잉", "기타 드로잉"],
    "음악": ["전체", "피아노", "기타·우쿨렐레", "보컬", "작사·작곡", "프로듀싱", "기타 악기"],
    "레저·스포츠": ["전체", "피트니스", "실내 운동", "야외 운동", "댄스", "레저", "기타 스포츠"],
    "뷰티": ["전체", "메이크업", "헤어", "네일아트", "타투", "셀프케어"],
    "반려동물": ["전체", "펫 푸드", "펫 에티켓", "펫 액세서리", "펫 미용", "기타 펫 클래스"],
    "체험": [],
    "자기계발": [],
    "로컬여행": []
  };

  const category1 = document.getElementById("category1");
  const category2 = document.getElementById("category2");
  const selectedCategory = document.getElementById("selectedCategory");

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

  // 이벤트 연결
  category1.addEventListener("change", () => {
    updateSubCategoryOptions();
    updateSelectedCategory();
  });

  category2.addEventListener("change", updateSelectedCategory);

  // 페이지 최초 로드시 초기화
  window.addEventListener("DOMContentLoaded", () => {
    updateSubCategoryOptions(); // category2 자동 구성
    updateSelectedCategory();   // 선택된 카테고리 표시
  });
</script>

</body>
</html>
