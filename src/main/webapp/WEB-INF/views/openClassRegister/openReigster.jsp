<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp"%>
</head>
<body>


	<main class="flex-fill py-5">
		<div class="container" style="max-width: 800px;">

			<button class="btn btn-outline-danger" data-bs-toggle="collapse" data-bs-target="#step1">STEP.1 클래스 소개 열기/닫기</button>
<div class="collapse show" id="step1">
			<div class="mb-4">
				<h5 class="fw-bold text-secondary">STEP.1 클래스 소개</h5>
				<h3 class="fw-bold" style="color: #E63946;">제목 및 카테고리</h3>
				<p class="text-muted">클래스/모임 제목과 카테고리를 등록해주세요</p>
			</div>
			<form action="${cp}/openClassRegister/open1" method="post"
				id="frmClass1" class="p-0">
				<!-- 제목 입력 -->
				<div class="mb-4">
					<label for="title" class="form-label fw-semibold" >클래스 명 <span
						class="text-danger">(필수)</span></label> <input type="text" id="title"
						class="form-control" maxlength="50" placeholder="제목을 입력해주세요" name="title">
					<div class="text-end small text-muted mt-1">0 / 50</div>
				</div>

				<!-- 1차 카테고리 -->
				<div class="mb-3">
					<label for="category1" class="form-label fw-bold">1차 카테고리</label> <select
						id="pCatrgory" class="form-select" required>
						<option value="">선택해주세요</option>
						<c:forEach items="${csc}" var="c">
							<c:if test="${empty c.childCategory && c.categoryId != 10003}">
								<option value=" ${c.categoryId}" data-p="${c.parentCategory}">${c.parentCategory}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>



				<!-- 2차 카테고리 -->
				<div class="mb-3">
					<label for="category2" class="form-label fw-bold">2차 카테고리</label> <select
						id="cCategory" name="categoryId" class="form-select">
						<option value="">1차를 먼저 선택하세요</option>
					</select>
				</div>

				<input type="hidden" name="categoryId" id="categoryId">


</div>


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
						<button type="button" class="btn btn-dark"
							style="white-space: nowrap;">주소 검색</button>
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
		<div class="container" style="max-width: 800px;">

			<!-- STEP 표시 -->
			<div class="mb-4">
				<h5 class="fw-bold text-secondary">STEP.1 클래스 소개</h5>
				<h3 class="fw-bold" style="color: #E63946;">이미지</h3>
				<p class="text-muted">클래스를 대표하는 이미지(썸네일)에 사용될 이미지를 등록해주세요</p>
			</div>
			
			<form action="${cp}/openClassRegister/open2" method="post"
				enctype="multipart/form-data">
				<!-- 대표 이미지 등록 (링크 입력용) -->
				<p>넘어가는 것 확인</p>
				<div class="mb-5">
					<label class="form-label fw-semibold">대표 이미지 링크 <span
						class="text-danger">(필수)</span></label> <input type="text"
						id="thumbnailImages" name="thumbnailImages"
						class="form-control mb-2" placeholder="대표 이미지 URL 입력"
						oninput="previewThumbnail(this.value)">
					<div class="text-center">
						<img id="thumbnailPreview" src="" class="img-fluid rounded border"
							style="max-height: 300px; display: none;">
					</div>
				</div>

				<!-- 클래스 이미지 링크 입력 (콤마로 구분) -->
				<div class="mb-5">
					<label class="form-label fw-semibold">클래스 이미지 링크들 <span
						class="text-muted small">(선택/최대 8개, 쉼표로 구분)</span></label>
					<textarea id="detailImages" name="detailImages" rows="3"
						class="form-control" placeholder="상세 이미지 URL 입력 (여러 개는 ,로 구분)"
						oninput="previewDetails(this.value)"></textarea>

					<div id="classImagesPreview"
						class="row row-cols-2 row-cols-md-4 g-2 mt-3"></div>
				</div>

				<div class="mb-5">
					<label class="form-label fw-semibold">대표 이미지 <span
						class="text-danger">(필수)</span></label>
					<div class="d-flex justify-content-center">
						<label for="thumbnailImage"
							class="d-flex flex-column align-items-center justify-content-center text-center border border-2 border-secondary rounded p-3 mb-2"
							style="width: 500px; height: 300px; border-style: dashed; cursor: pointer; position: relative;">

							<i class="fa-solid fa-image fa-2x mb-3 text-muted"></i> <strong
							class="mb-2">이미지 추가하기</strong> <span class="text-muted small">클릭
								후 이미지를 추가해 주세요</span> <input type="file" id="thumbnailImage"
							name="thumbnailImage" accept="image/*" hidden> <img
							id="thumbnailPreview"
							class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover rounded"
							style="display: none; object-fit: cover; z-index: 2;" />
						</label>
					</div>

					<ul class="text-muted small list-unstyled mt-2 text-center">
						<li>• 용량은 3MB 이하로 사용해 주세요</li>
						<li>• 이미지 사이즈는 500px × 500px (3:2)이에요 (비율이 맞지 않으면 이미지가 잘릴 수
							있어요)</li>
					</ul>
				</div>

				<!-- 클래스 이미지 등록 -->
				<div class="mb-5">
					<label class="form-label fw-semibold">클래스 이미지 <span
						class="text-muted small">(선택/최대 8개 등록 가능)</span></label>
					<div class="d-flex justify-content-center">
						<label for="classImages"
							class="d-flex flex-column align-items-center justify-content-center text-center border border-2 border-secondary rounded p-3 mb-2"
							style="width: 500px; height: 300px; border-style: dashed; cursor: pointer; position: relative;">
							<i class="fa-solid fa-image fa-2x mb-3 text-muted"></i> <strong
							class="mb-2">이미지 추가하기</strong> <span class="text-muted small">클릭
								후 이미지를 추가해 주세요</span> <input type="file" id="classImages"
							name="classImages" accept="image/*" multiple hidden>
						</label>
					</div>

					<!-- 미리보기 썸네일 영역 -->
					<div id="classImagesPreview"
						class="row row-cols-2 row-cols-md-4 g-2 mt-3"></div>

					<div class="form-text text-center">• 클래스/모임 이미지가 많을수록 클래스/모임을
						신청할 확률이 올라가요</div>
				</div>

				<!-- 하단 버튼 -->
				<div class="d-flex justify-content-between mt-5">
					<a href="${cp}/openClassRegister/open1"
						class="btn btn-outline-secondary px-4">이전</a>
					<button type="submit" class="btn text-white px-4"
						style="background-color: #E63946;">다음</button>
				</div>
			</form>
		</div>
		
		<div class="form-text mt-2">* 커리큘럼을 자유롭게 작성해 주세요</div>
				</div>

				<!-- 난이도 -->
				<div class="mb-4">
					<label class="form-label fw-bold">난이도</label>
					<div class="btn-group w-100" role="group">
						<input type="radio" class="btn-check" name="difficulty"
							id="beginner" value="입문" autocomplete="off"> <label
							class="btn btn-outline-secondary" for="beginner">입문</label> <input
							type="radio" class="btn-check" name="difficulty"
							id="intermediate" value="중급" autocomplete="off"> <label
							class="btn btn-outline-secondary" for="intermediate">중급</label> <input
							type="radio" class="btn-check" name="difficulty" id="advanced"
							value="고급" autocomplete="off"> <label
							class="btn btn-outline-secondary" for="advanced">고급</label>
					</div>
				</div>

				<!-- 소요시간 -->
				<div class="mb-4">
					<label for="duration" class="form-label fw-bold">소요시간</label> <input
						type="text" class="form-control" id="duration" name="duration"
						placeholder="소요 시간/기간을 입력 해주세요">
				</div>

				<!-- 커리큘럼 텍스트 -->
				<div class="mb-4">
					<label for="curriculum" class="form-label fw-bold">커리큘럼</label>
					<textarea class="form-control " id="curriculum" name="curriculum"
						rows="6" maxlength="600"
						placeholder="커리큘럼을 자유롭게 작성해 주세요&#10;최소 40자 이상"></textarea>
					<div class="text-end text-muted small mt-1">
						<span id="curriculumCount">0</span> / 600
					</div>
				</div>


				<!-- 클래스 상세 내용 -->
				<div class="mb-4">
					<label for="description" class="form-label fw-semibold">클래스
						상세 내용 <span class="text-danger">(필수)</span>
					</label>
					<textarea id="description"  name="description" class="form-control" rows="10"
						placeholder="강사의 클래스를 최소 5줄 이상 자세하게 설명해 주세요
복사하기 + 붙여넣기의 경우 내용이 올라가게 보이지 않을 수 있어요
원하시면 이미지나 영상 링크를 추가하실 수 있어요"
						required></textarea>
					<div class="text-end small text-muted mt-1">최소 40자 이상</div>
				</div>
				<!-- 추천 대상 -->
				<div class="mb-4">
					<label for="description2" class="form-label fw-bold">이런 분들이
						들으면 좋아요!</label>
					<textarea class="form-control" id="description2"
						name="description2" rows="6" maxlength="600"
						placeholder="자유롭게 작성해 주세요"></textarea>
					<div class="text-end text-muted small mt-1">
						<span id="description2Count">0</span> / 600
					</div>
				</div>

				
			<!-- 하단 버튼 -->
			<div class="d-flex justify-content-between mt-5">
				<a href="${cp}/openClassRegister/open2" class="btn btn-outline-secondary px-4">이전</a>
				<button type="submit" class="btn text-white px-4" style="background-color: #E63946;">다음</button>
			</div>
		</form>
	</div>
	<div class="container" style="max-width: 800px;">
	
    <!-- STEP 표시 -->
    <div class="mb-4">
      <h5 class="fw-bold text-secondary">STEP.3 금액 및 일정</h5>
      <h3 class="fw-bold" style="color: #E63946;">클래스 금액 및 예약 방식</h3>
      <p class="text-muted">클래스 수강료 및 결제 방식을 설정해주세요</p>
    </div>

<form action="${cp}/openClassRegister/open5" method="post" enctype="multipart/form-data">
  <!-- 금액 입력 -->
  <div class="mb-3">
    <label class="form-label fw-semibold">1인 수강 금액</label>
    <div class="input-group">
      <input type="number" id="price" name="price"  class="form-control" placeholder="예: 30000">
      <span class="input-group-text">원</span>
    </div>
  </div>

  <!-- 할인 비율 입력 -->
  <div class="mb-3">
    <label class="form-label fw-semibold">할인 비율</label>
    <div class="input-group">
      <input type="number" id="discount" name="discount" class="form-control" placeholder="예: 10">
      <span class="input-group-text">%</span>
    </div>
  </div>

 <!--  <!-- 할인 금액 직접 입력 -->
   <div class="mb-3">
    <label class="form-label fw-semibold">할인된 금액</label>
    <div class="input-group">
      <input type="number" id="discountPrice" name="discountPrice" class="form-control" placeholder="자동 계산 or 직접 입력">
      <span class="input-group-text">원</span>
    </div>
  </div> 

 

  <hr>

  <!-- 인원 설정 -->
  <div class="mb-3 d-flex gap-2">
    <div class="flex-grow-1">
      <label class="form-label fw-semibold">최소 인원</label>
      <input type="number" name="minParticipants" class="form-control" placeholder="예: 2">
    </div>
    <div class="flex-grow-1">
      <label class="form-label fw-semibold">최대 인원</label>
      <input type="number" name="maxParticipants" class="form-control" placeholder="예: 10">
    </div>
  </div>
      <!-- 버튼 -->
       <div class="d-flex justify-content-between mt-5">
					<a href="${cp}/openClassRegister/open4"
						class="btn btn-outline-secondary px-4">이전</a>
					<button type="submit" class="btn text-white px-4"
						style="background-color: #E63946;">다음</button>
				</div>
    </form>

  

<!-- JS 로직 나중에 확인하고 계산기 돌리기 적용 안됨-->


   

  </div>

	</main>


<script>
	const cJson = `${cscJson}`;
	const categories = JSON.parse(categories);
	$("#pCatrgory").change(function(){
		const pName = $(this).find(":selected").text();
		categories.forEach(console.log);
		const result = categorories.filter(c => c.parentCatrgoty === pName)
		console.log(result);
		if(result.length ==! 0) {
		$("#cCatrgory").html(result.map(r => {
			return  `<optipn value = "\${r.catrgoryId"}>\${r.childCategory} ?? '전체'}</option>
		</optipn>`))
		}
		else {
			$("#cCatrgory").html(`<optipn value = "" 1차를 먼저 선택해주세요`</optipn> )
			
		}
		}));
		$("#frmClass1").submit(function (event) {
			event.preventDefault();
			$("#catrgoryId").val($("#cCatrgory").val());
			this.submit();
		})
		
		})
	</script>
	<%@ include file="../common/footer.jsp"%>


</body>
</html>
