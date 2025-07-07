<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<main class="container py-5">
  <form id="frmClass1" action="${cp}/openClassRegister/open1" method="post" >
  <div class="row">
  
   
      
      <!-- STEP 1: 제목 및 카테고리 -->
      <div class="mb-4">
        <button class="btn btn-outline-dark w-100" type="button" data-bs-toggle="collapse" data-bs-target="#step1">
          STEP 1 - 제목 및 카테고리
        </button>
        <div class="collapse mt-2" id="step1">
          <div class="card card-body">
            <label class="form-label fw-bold">클래스 제목</label>
            <input type="text" class="form-control mb-2" name="title" placeholder="클래스 제목을 입력하세요">

            <label class="form-label fw-bold">1차 카테고리</label>
            <select id="pCategory" name="pCategory" class="form-select mb-2">
              <option value="">선택해주세요</option>
              <c:forEach items="${csc}" var="c">
                <c:if test="${empty c.childCategory && c.categoryId != 10003}">
                  <option value="${c.categoryId}">${c.parentCategory}</option>
                </c:if>
              </c:forEach>
            </select>

            <label class="form-label fw-bold">2차 카테고리</label>
            <select id="cCategory" name="cCategory" class="form-select">
              <option value="">1차를 먼저 선택하세요</option>
            </select>
            <input type="hidden" name="categoryId" id="categoryId">
            
		     	

        <div id="searchWrapper" class=" d-flex" >
			  <input type="text" id="region" name="region" placeholder="우편번호" readonly>
			  <br>
			  <input type="text"  name="address" id="address" placeholder="주소" readonly>
			  <br>
			  <button type="button" onclick="execDaumPostcode()">주소 검색</button>
			</div>
     
    </div>
  </div>
</div>
      <!-- STEP 2: 이미지 등록 -->
      <div class="mb-4">
        <button class="btn btn-outline-dark w-100" type="button" data-bs-toggle="collapse" data-bs-target="#step2">
          STEP 2 - 이미지 등록
        </button>
        <div class="collapse mt-2" id="step2">
          <div class="card card-body">
            <label class="form-label fw-bold">대표 이미지 링크</label>
            <input type="text" class="form-control mb-2" name="thumbnailImages" oninput="previewThumbnail(this.value)">
            <img id="thumbnailPreview" src="" class="img-fluid border rounded" style="max-height: 300px; display: none;">
            <label class="form-label fw-semibold">클래스 이미지 링크들 <span
						class="text-muted small">(선택/최대 8개, 쉼표로 구분)</span></label>
					<textarea id="detailImages" name="detailImages" rows="3"
						class="form-control" placeholder="상세 이미지 URL 입력 (여러 개는 ,로 구분)"
						oninput="previewDetails(this.value)"></textarea>
          </div>
        </div>
      </div>
    </div>

      <!-- STEP 3: 커리큘럼 -->
      <div class="mb-4">
        <button class="btn btn-outline-dark w-100" type="button" data-bs-toggle="collapse" data-bs-target="#step3">
          STEP 3 - 커리큘럼
        </button>
        <div class="collapse mt-2" id="step3">
          <div class="card card-body">
            <label class="form-label fw-bold">난이도</label>
            <div class="btn-group w-100 mb-3" role="group">
              <input type="radio" class="btn-check" name="difficulty" id="beginner" value="0" autocomplete="off">
              <label class="btn btn-outline-secondary" for="beginner">입문</label>
              <input type="radio" class="btn-check" name="difficulty" id="intermediate" value="1" autocomplete="off">
              <label class="btn btn-outline-secondary" for="intermediate">중급</label>
              <input type="radio" class="btn-check" name="difficulty" id="advanced" value="2" autocomplete="off">
              <label class="btn btn-outline-secondary" for="advanced">고급</label>
            </div>

            <label class="form-label fw-bold">소요시간</label>
            <input type="text" class="form-control mb-3" name="duration" placeholder="예: 120분/ 2시간">

            <label class="form-label fw-bold">커리큘럼</label>
            <textarea class="form-control mb-2" name="curriculum" rows="5" placeholder="최소 40자 이상 작성"></textarea>

            <label class="form-label fw-bold">클래스 상세 설명</label>
            <textarea class="form-control" name="description" rows="5" placeholder="강의 내용을 자세히 작성해주세요"></textarea>
            <label class="form-label fw-bold">이런 분들이 들으면 좋아요!</label>
            <textarea class="form-control" name="description2" rows="5" placeholder="강의 내용을 자세히 작성해주세요"></textarea>
          </div>
        </div>
      </div>

      <!-- STEP 4: 강사 소개 -->
      <div class="mb-4">
        <button class="btn btn-outline-dark w-100" type="button" data-bs-toggle="collapse" data-bs-target="#step4">
          STEP 4 - 강사 소개
        </button>
        <div class="collapse mt-2" id="step4">
          <div class="card card-body">
            <label class="form-label fw-bold">강사 닉네임</label>
            <input type="text" class="form-control mb-3" name="instructorName" maxlength="15">
            
				<!-- 강사 사진 업로드 -->
				<div class="mb-4">
					<label class="form-label fw-semibold">강사님 사진 <span
						class="text-danger">(필수)</span></label>
					<div class="d-flex align-items-center mb-2">
						<img id="preview" src="https://placehold.co/200x200"
							class="image-preview me-3" alt="강사 사진 미리보기"> 
					</div>
					<input type="file" class="form-control" name="instructorImageUrl2"
						accept="image/*" onchange="previewImage(event)">
				</div>

            <label class="form-label fw-bold">강사 소개</label>
            <textarea class="form-control" name="hostIntroduction" rows="4" placeholder="강사에 대한 소개글을 입력해주세요"></textarea>
          </div>
        </div>
      </div>

      <!-- STEP 5: 금액 설정 -->
      <div class="mb-4">
        <button class="btn btn-outline-dark w-100" type="button" data-bs-toggle="collapse" data-bs-target="#step5">
          STEP 5 - 금액 설정
        </button>
        <div class="collapse mt-2" id="step5">
          <div class="card card-body">
            <label class="form-label fw-bold">1인 수강 금액</label>
            <div class="input-group mb-3">
              <input type="number" class="form-control" name="price" placeholder="">
          
            </div>

            <label class="form-label fw-bold">할인 비율</label>
            <div class="input-group mb-3">
              <input type="number" class="form-control" name="discount" placeholder="">
              
            </div>

            <label class="form-label fw-bold">할인가</label>
            <div class="input-group">
              <input type="number" class="form-control" name="discountPrice" placeholder="">
            
            </div>
          </div>
        </div>
      </div>
      <!-- STEP 6: 인원 설정 -->
      <div class="mb-4">
        <button class="btn btn-outline-dark w-100" type="button" data-bs-toggle="collapse" data-bs-target="#step6">
         STEP 6: 인원 설정
        </button>
        <div class="collapse mt-2" id="step6">
          <div class="card card-body">
            <label class="form-label fw-bold">최소 인원</label>
            <div class="input-group mb-3">
              <input type="number" class="form-control" name="minParticipants" placeholder="예: 1명">
              <span class="input-group-text">명</span>
            </div>
            
            <label class="form-label fw-bold">최대 인원</label>

            <div class="input-group mb-3">
              <input type="number" class="form-control" name="maxParticipants" placeholder="예: 100명">
              <span class="input-group-text">명</span>
            </div>
          </div>
        </div>
      </div>
    <button type="submit" class="btn btn-secondary w-30"> 제출 </button>
	</form>
</main>

<%@ include file="../common/footer.jsp"%>

<script>
const cJson = `${cscJson}`;
  const categories = JSON.parse(cJson);
  $("#pCategory").change(function () {
	  const pName = $(this).find(":selected").text().trim();
	  const result = categories.filter(c => c.parentCategory === pName);
	  console.log("선택된 categoryId:", $("#categoryId").val());

	  if (result.length > 0) {
		    $("#cCategory").html(
		      result.map(r => {
		        const label = r.childCategory ?? '전체';
		        return `<option value="\${r.categoryId}">\${label}</option>`;
		      }).join("")
		    );
		  } else {
		    $("#cCategory").html(`<option value="">2차 카테고리가 없습니다</option>`);
		  }
  });
  $("#frmClass1").submit(function (event) {
	    event.preventDefault();
	    $("#categoryId").val($("#cCategory").val());
	    this.submit();
	});

  
  $("#cCategory").change(function () {
	  
    $("#categoryId").val($(this).val());
	  console.log("카테고리 JSON:", categoryId);
  });
  

  function execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function(data) {
        console.log(data);
        // 선택한 주소를 가져와서 input에 넣기
        document.getElementById('region').value = data.zonecode;  // 우편번호
        document.getElementById('address').value = data.roadAddress || data.jibunAddress;  // 주소
      }
    }).open();
  }
  
</script>

	
</body>
</html>
