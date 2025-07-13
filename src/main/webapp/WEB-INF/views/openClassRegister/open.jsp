<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp"%>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f8f9fa;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<main class="container p-2">

		<form id="frmClass1" action="${cp}/openClassRegister/open"
			method="post" enctype="multipart/form-data">
			<div class="container" style="max-width: 1000px;">
				<h3 class="mb-4 fw-bold">클래스 등록</h3>
				<div class="accordion" id="accordionExample">

					<!-- STEP 1 -->
					<div
						class="accordion-item border-0 mb-3 shadow-sm bg-white rounded-3">
						<h2 class="accordion-header">
							<button class="accordion-button bg-light text-dark fw-bold"
								type="button" data-bs-toggle="collapse" data-bs-target="#step1">
								STEP 1 - 제목 및 카테고리</button>
						</h2>
						<div id="step1" class="accordion-collapse collapse show">
							<div class="accordion-body px-4 py-4">
								<label class="form-label fw-bold">클래스 제목</label> <input
									type="text" class="form-control mb-2" name="title"
									placeholder="클래스 제목을 입력하세요"> <label
									class="form-label fw-bold">클래스 유형</label> <input type="hidden"
									name="classType" id="classTypeInput" value="">
								<div class="btn-group w-100 mb-3" role="group">
									<button type="button" class="btn btn-outline-danger"
										value="0">원데이 클래스</button>
									<button type="button" class="btn btn-outline-secondary"
										value="1">정기 클래스</button>
								</div>

								<label class="form-label fw-bold">1차 카테고리</label> <select
									id="pCategory" name="pCategory" class="form-select mb-2">
									<option value="">선택해주세요</option>
									<c:forEach items="${csc}" var="c">
										<c:if test="${empty c.childCategory && c.categoryId != 10003}">
											<option value="${c.categoryId}">${c.parentCategory}</option>
										</c:if>
									</c:forEach>
								</select> <label class="form-label fw-bold">2차 카테고리</label> <select
									id="cCategory" name="cCategory" class="form-select mb-2">
									<option value="">1차를 먼저 선택하세요</option>
								</select> <input type="hidden" name="categoryId" id="categoryId">

								<div class="row g-2 align-items-end mt-2">
									<div class="col-md-4">
										<label class="form-label fw-bold">우편번호</label> <input
											type="text" id="region" name="region" class="form-control"
											placeholder="우편번호" readonly>
									</div>
									<div class="col-md-6">
										<label class="form-label fw-bold">주소</label> <input
											type="text" name="address" id="address" class="form-control"
											placeholder="주소" readonly>
									</div>
									<div class="col-md-2 d-grid">
										<label class="form-label invisible">주소 검색</label>
										<button type="button" class="btn btn-outline-dark"
											onclick="execDaumPostcode()">주소 검색</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- STEP 2 -->
					<div
						class="accordion-item border-0 mb-3 shadow-sm bg-white rounded-3">
						<h2 class="accordion-header">
							<button
								class="accordion-button bg-light text-dark collapsed fw-bold"
								type="button" data-bs-toggle="collapse" data-bs-target="#step2">
								STEP 2 - 커리큘럼</button>
						</h2>
						<div id="step2" class="accordion-collapse collapse show">
							<div class="accordion-body px-4 py-4">
								<label class="form-label fw-bold">난이도</label>
								<div class="btn-group w-100 mb-3" role="group">
									<input type="radio" class="btn-check" name="difficulty"
										id="beginner" value="0"> <label
										class="btn btn-outline-secondary" for="beginner">입문</label> <input
										type="radio" class="btn-check" name="difficulty"
										id="intermediate" value="1"> <label
										class="btn btn-outline-secondary" for="intermediate">중급</label>
									<input type="radio" class="btn-check" name="difficulty"
										id="advanced" value="2"> <label
										class="btn btn-outline-secondary" for="advanced">고급</label>
								</div>

								<label class="form-label fw-bold">일정 선택</label>
								<div class="input-group mb-3">
									<input type="date" class="form-control" name="scheduleDate">
									<input type="time" class="form-control" name="startTime">
									<input type="time" class="form-control" name="endTime">
								</div>

								<label class="form-label fw-bold">소요시간</label> <input
									type="text" class="form-control mb-3" name="duration"
									placeholder="예: 120분 / 2시간"> <label
									class="form-label fw-bold">커리큘럼</label>
								<textarea class="form-control mb-2" name="curriculum"
									placeholder="커리큘럼을 작성해 주세요"></textarea>

								<label class="form-label fw-bold">클래스 상세 설명</label>
								<textarea class="form-control mb-2" name="description"
									placeholder="클래스 상세 설명을 작성해 주세요"></textarea>

								<label class="form-label fw-bold">이런 분들이 들으면 좋아요!</label>
								<textarea class="form-control" name="description2"></textarea>
							</div>
						</div>
					</div>

					<!-- STEP 3 -->
					<div
						class="accordion-item border-0 mb-3 shadow-sm bg-white rounded-3">
						<h2 class="accordion-header">
							<button
								class="accordion-button bg-light text-dark collapsed fw-bold"
								type="button" data-bs-toggle="collapse" data-bs-target="#step3">
								STEP 3 - 강사 소개</button>
						</h2>
						<div id="step3" class="accordion-collapse collapse show">
							<div class="accordion-body px-4 py-4">
								<label class="form-label fw-bold">호스트 이름</label> <input
									type="text" class="form-control mb-3" name="instructorName"
									maxlength="15"> <label class="form-label fw-bold">호스트
									소개</label>
								<textarea class="form-control" name="hostIntroduction" rows="4"
									placeholder="소개 문구를 적어주세요"></textarea>
							</div>
						</div>
					</div>

					<!-- STEP 4 -->
					<div
						class="accordion-item border-0 mb-3 shadow-sm bg-white rounded-3">
						<h2 class="accordion-header">
							<button
								class="accordion-button bg-light text-dark collapsed fw-bold"
								type="button" data-bs-toggle="collapse" data-bs-target="#step4">
								STEP 4 - 금액 설정</button>
						</h2>
						<div id="step4" class="accordion-collapse collapse show">
							<div class="accordion-body px-4 py-4">
								<label class="form-label fw-bold">1인 수강 금액</label> <input
									type="text" class="form-control price" name="price"
									placeholder="가격을 숫자로 입력해 주세요">
							</div>
						</div>
					</div>

					<!-- STEP 5 -->
					<div
						class="accordion-item border-0 mb-3 shadow-sm bg-white rounded-3">
						<h2 class="accordion-header">
							<button
								class="accordion-button bg-light text-dark collapsed fw-bold"
								type="button" data-bs-toggle="collapse" data-bs-target="#step5">
								STEP 5 - 인원 설정</button>
						</h2>
						<div id="step5" class="accordion-collapse collapse show">
							<div class="accordion-body px-4 py-4">
								<label class="form-label fw-bold">최소 인원</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control"
										name="minParticipants"> <span class="input-group-text">명</span>
								</div>

								<label class="form-label fw-bold">최대 인원</label>
								<div class="input-group mb-3">
									<input type="number" class="form-control"
										name="maxParticipants"> <span class="input-group-text">명</span>
								</div>
							</div>
						</div>
					</div>

				</div>

				<!-- 제출 버튼 -->
				<div class="text-center mt-4">
					<input type="hidden" name="encodedStr">
					<button type="submit" class="btn"
						style="background-color: #E63946; color: white;">클래스 등록하기</button>
				</div>
			</div>
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
