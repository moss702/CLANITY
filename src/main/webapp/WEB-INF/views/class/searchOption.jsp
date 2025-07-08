<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>클래스 신청 폼</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="p-4">

  

    <!-- 검색창 -->
    <form action="${cp}/search" method="get" class="flex-grow-1" style="max-width: 600px;">
      <div class="d-flex align-items-center gap-2 px-4 py-2 rounded-pill border" style="border-color: #E63946;">
        <input type="text" name="filterKeyword" id="searchInput" class="form-control border-0 p-0 bg-transparent fw-semibold text-danger" placeholder="#취미시작은클래니티 #클래니티라이프" style="font-size: 14px; outline: none;">
        <button type="button" class="bg-transparent border-0" id="toggleSearchFilter">
          <i class="fa-solid fa-magnifying-glass text-danger"></i>
        </button>
      </div>
    </form>

  <!-- 필터 폼 -->
  <form action="${cp}/search" method="get">
    <div id="searchFilterBox" class=" bg-white border rounded shadow p-4 w-100 position-absolute start-50 translate-middle-x" style="max-width: 1200px; top: 120px; z-index: 1050;">
      <div class="row">
        <!-- 왼쪽 -->
        <div class="col-md-6">
          <!-- 지역 -->
          <div class="mb-3">
            <label class="form-label fw-semibold">지역</label>
            <select class="form-select" name="region">
              <option value="">전체</option>
              <option>서울</option>
              <option>부산</option>
              <option>광주</option>
              <option>대전</option>
              <option>인천</option>
              <option>기타</option>
            </select>
          </div>

          <!-- 1차 카테고리 -->
          <div class="mb-3">
            <label class="form-label fw-semibold">1차 카테고리</label>
            <select id="category1" class="form-select">
              <option value="">선택해주세요</option>
              <option>드로잉</option>
              <option>음악</option>
              <option>레저·스포츠</option>
              <option>뷰티</option>
              <option>반려동물</option>
              <option>체험</option>
              <option>자기계발</option>
              <option>로컬여행</option>
            </select>
          </div>

          <!-- 2차 카테고리 -->
          <div class="mb-3">
            <label class="form-label fw-semibold">2차 카테고리</label>
            <select id="category2" class="form-select">
              <option value="">1차를 먼저 선택하세요</option>
            </select>
            <!-- <input type="hidden" name="categoryId" id="categoryId"> -->
          </div>

          <!-- 요일 -->
          <div class="mb-3">
            <label class="form-label fw-semibold">요일</label>
            <div class="d-flex gap-2 flex-wrap">
              <button type="button" class="btn btn-light toggle-btn">평일</button>
              <button type="button" class="btn btn-light toggle-btn">토요일</button>
              <button type="button" class="btn btn-light toggle-btn">일요일</button>
            </div>
            <input type="hidden" name="day" id="dayInput">
          </div>

          <!-- 난이도 -->
          <div class="mb-3">
            <label class="form-label fw-semibold">난이도</label>
            <div class="d-flex gap-2 flex-wrap">
              <button type="button" class="btn btn-light toggle-btn">입문</button>
              <button type="button" class="btn btn-light toggle-btn">중급</button>
              <button type="button" class="btn btn-light toggle-btn">고급</button>
            </div>
            <input type="hidden" name="difficulty" id="difficultyInput">
          </div>
        </div>

        <!-- 오른쪽 -->
        <div class="col-md-6">
          <!-- 인원 -->
          <div class="mb-3">
            <label class="form-label fw-semibold">인원</label>
            <select class="form-select" name="people">
              <option value="">선택 안함</option>
              <option>1~2명</option>
              <option>3~5명</option>
              <option>6명 이상</option>
            </select>
               <input type="hidden" name="people" id="people">
          </div>

          <!-- 시간 -->
          <div class="mb-3">
            <label class="form-label fw-semibold">시간</label>
            <div class="d-flex gap-2 align-items-center">
              <input type="time" class="form-control" name="startTime" style="max-width: 120px;">
              <span class="text-muted">~</span>
              <input type="time" class="form-control" name="endTime" style="max-width: 120px;">
            </div>
          </div>

          <!-- 금액 -->
          <!-- <div class="mb-3">
            <label class="form-label fw-semibold">금액</label>
            <div class="d-flex gap-2 align-items-center">
              <input type="number" class="form-control text-center" name="min_price" placeholder="0원" style="max-width: 100px;">
              <span class="text-muted">~</span>
              <input type="number" class="form-control text-center" name="max_price" placeholder="1,000,000원" style="max-width: 140px;">
            </div> -->
          <!-- </div> -->
        </div>
      </div>

      <!-- 버튼 -->
      <div class="mt-4 d-flex justify-content-end gap-3">
        <button type="submit" class="btn btn-light" onclick="toggleSearchBox()">검색하기</button>
        <button type="button" class="btn btn-light" onclick="toggleSearchBox()">닫기</button>
      </div>
    </div>
  </form>
  
  <script>
  

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
