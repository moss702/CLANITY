<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<main class="container p-2">
	<form id="frmClass1" action="${cp}/openClassRegister/open" method="post" enctype="multipart/form-data">
<div class="container " style="max-width: 1000px;">
  <h3 class=" mb-4 fw-bold ">클래스 등록</h3>
    <div class="accordion" id="accordionExample">
      <!-- STEP 1 -->
      <div class="accordion-item border-0 mb-3 shadow-sm">
        <h2 class="accordion-header">
          <button class="accordion-button bg-light text-dark fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#step1">
            STEP 1 - 제목 및 카테고리
          </button>
        </h2>
        <div id="step1" class="accordion-collapse collapse show">
          <div class="accordion-body">
            <label class="form-label fw-bold">클래스 제목</label>
            <input type="text" class="form-control mb-2" name="title" placeholder="클래스 제목을 입력하세요">
            <label class="form-label fw-bold">클래스 유형</label>
      <button type="button" class="form-control mb-3" name="classType" value="0" >정기 클래스</button>
      <button type="button" class="form-control mb-3" name="classType" value="1">원데이 클래스</button>
            

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
            <select id="cCategory" name="cCategory" class="form-select mb-2">
              <option value="">1차를 먼저 선택하세요</option>
            </select>
            <input type="hidden" name="categoryId" id="categoryId">

            <div class="row g-2 align-items-end mt-2">
		  <div class="col-md-4">
		    <label class="form-label fw-bold">우편번호</label>
		    <input type="text" id="region" name="region" class="form-control" placeholder="우편번호" readonly>
		  </div>
		  <div class="col-md-6">
		    <label class="form-label fw-bold">주소</label>
		    <input type="text" name="address" id="address" class="form-control" placeholder="주소" readonly>
		  </div>
		  <div class="col-md-2 d-grid">
		    <label class="form-label invisible">주소 검색</label>
		    <button type="button" class="btn btn-outline-dark" onclick="execDaumPostcode()">주소 검색</button>
		  </div>
</div>
          </div>
        </div>
      </div>

      <!-- STEP 2 -->
      <div class="accordion-item border-0 mb-3 shadow-sm">
        <h2 class="accordion-header">
          <button class="accordion-button bg-light text-dark collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#step2">
            STEP 2 - 이미지 등록
          </button>
        </h2>
        <div id="step2" class="accordion-collapse collapse show">
          <div class="accordion-body">
            <label class="form-label fw-bold">대표 이미지 링크</label>
            <input type="text" class="form-control mb-2" name="thumbnailImages" oninput="previewThumbnail(this.value)">
            <img id="thumbnailPreview" src="" class="img-fluid border rounded" style="max-height: 300px; display: none;">
            
            <label class="form-label fw-bold">클래스 이미지 링크들</label>
            <textarea id="detailImages" name="detailImages" rows="3" class="form-control" placeholder="상세 이미지 URL 입력 (여러 개는 ,로 구분)" oninput="previewDetails(this.value)"></textarea>
          </div>
        </div>
      </div>

      <!-- STEP 3 -->
      <div class="accordion-item border-0 mb-3 shadow-sm">
        <h2 class="accordion-header">
          <button class="accordion-button bg-light text-dark collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#step3">
            STEP 3 - 커리큘럼
          </button>
        </h2>
        <div id="step3" class="accordion-collapse collapse show">
          <div class="accordion-body">
            <label class="form-label fw-bold">난이도</label>
            <div class="btn-group w-100 mb-3" role="group">
              <input type="radio" class="btn-check" name="difficulty" id="beginner" value="0">
              <label class="btn btn-outline-secondary" for="beginner">입문</label>

              <input type="radio" class="btn-check" name="difficulty" id="intermediate" value="1">
              <label class="btn btn-outline-secondary" for="intermediate">중급</label>

              <input type="radio" class="btn-check" name="difficulty" id="advanced" value="2">
              <label class="btn btn-outline-secondary" for="advanced">고급</label>
            </div>
			<div id="dateContainer" class="mb-3">
			  <label class="form-label fw-bold">일정 날짜 추가</label>
			  <div class="input-group mb-2">
			    <input type="date" class="form-control date-input" name="scheduleDate" placeholder="날짜 선택">
			    <input type="number" class="form-control date-input" name="startTime" placeholder="시작시간">
			    <input type="number" class="form-control date-input" name="endTime" placeholder="종료시간">
			    <button type="button" class="btn btn-outline-secondary" id="addDateBtn">추가</button>
			  </div>
			</div> 
            <label class="form-label fw-bold">소요시간</label>
            <input type="text" class="form-control mb-3" name="duration" placeholder="예: 120분 / 2시간">

            <label class="form-label fw-bold">커리큘럼</label>
            <textarea class="form-control mb-2" name="curriculum"  placeholder="커리큘럼을 작성해 주세요"></textarea>

            <label class="form-label fw-bold">클래스 상세 설명</label>
            <textarea class="form-control mb-2" name="description"  placeholder="클래스 상세 설명을 작성해 주세요"></textarea>
            <div class="d-grid my-2 attach-area">
					<div class="small my-1 border-bottom border-1 border-muted p-0 pb-2"><i class="fa-solid fa-paperclip"></i> 첨부파일</div>
					<label class="btn btn-danger">파일 첨부<input type="file" multiple class="d-none" id="f1" name="f1"></label>
					<ul class="list-group my-2 attach-list">
					</ul>  
					<div class="row justify-content-around w-75 mx-auto attach-thumb">
					</div> 
				</div>

            <label class="form-label fw-bold">이런 분들이 들으면 좋아요!</label>
            <textarea class="form-control" name="description2"  ></textarea>
          </div>
        </div>
      </div>

      <!-- STEP 4 -->
      <div class="accordion-item border-0 mb-3 shadow-sm">
        <h2 class="accordion-header">
          <button class="accordion-button bg-light text-dark collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#step4">
            STEP 4 - 강사 소개
          </button>
        </h2>
        <div id="step4" class="accordion-collapse collapse show">
          <div class="accordion-body">
            <label class="form-label fw-bold">호스트 닉네임</label>
            <input type="text" class="form-control mb-3" name="instructorName" maxlength="15">
            <label class="form-label fw-bold">호스트 사진</label>
			<div>
           <div class="d-grid my-2 attach-area">
					<div class="small my-1 border-bottom border-1 border-muted p-0 pb-2"><i class="fa-solid fa-paperclip"></i> 첨부파일</div>
					<label class="btn btn-danger ">파일 첨부<input type="file" multiple class="d-none" id="f1" name="f1"></label>
					<ul class="list-group my-2 attach-list">
					</ul>  
					<div class="row justify-content-around w-75 mx-auto attach-thumb">
					</div> 
				</div>
			</div>
            <label class="form-label fw-bold">호스트 소개</label>
            <textarea class="form-control" name="hostIntroduction" rows="4"  placeholder="소개 문구를 적어주세요"></textarea>
          </div>
        </div>
      </div>

     <!-- STEP 5 - 금액 설정 -->
<div class="accordion-item border-0 mb-3 shadow-sm">
  <h2 class="accordion-header">
    <button class="accordion-button bg-light text-dark collapsed fw-bold" type="button"
      data-bs-toggle="collapse" data-bs-target="#step5" aria-expanded="false" aria-controls="step5">
      STEP 5 - 금액 설정
    </button>
  </h2>
  <div id="step5" class="accordion-collapse collapse show">
    <div class="accordion-body">
      <div class="mb-3">
        <label class="form-label fw-bold">1인 수강 금액</label>
        <input type="text" class="form-control price" name="price" placeholder="가격을 숫자로 입력해 주세요">
      </div>

      

      <div class="mb-3">
        <label class="form-label fw-bold">할인가</label>
         <input type="text" class="form-control price" name="discountPrice" placeholder="가격을 숫자로 입력해 주세요">
      </div>
    </div>
  </div>
</div>

      <!-- STEP 6 -->
      <div class="accordion-item border-0 mb-3 shadow-sm">
        <h2 class="accordion-header">
          <button class="accordion-button bg-light text-dark collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#step6">
            STEP 6 - 인원 설정
          </button>
        </h2>
        <div id="step6" class="accordion-collapse collapse show">
          <div class="accordion-body">
            <label class="form-label fw-bold">최소 인원</label>
            <div class="input-group mb-3">
              <input type="number" class="form-control" name="minParticipants">
              <span class="input-group-text">명</span>
            </div>

            <label class="form-label fw-bold">최대 인원</label>
            <div class="input-group mb-3">
              <input type="number" class="form-control" name="maxParticipants">
              <span class="input-group-text">명</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="text-center mt-4">
      <button type="submit" class="btn" style="background-color: #E63946; color: white;">클래스 등록하기</button>
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
  
  // 첨부파일
 $(function() {
		$(".attach-list").sortable();
		//return true / false
		function validateFiles(files) {
			const MAX_COUNT = 5;
			const MAX_FILE_SIZE = 10 * 1024 * 1024; //10mb
			const MAX_TOTAL_SIZE = 50 * 1024 * 1024; //50mb
			const BLOCK_EXT = ['exe', 'sh', 'jsp', 'java', 'class', 'html', 'js'];		

			//파일 개수 체크
			if(files.length > MAX_COUNT){
				alert('파일은 최대 5개만 업로드 가능합니다');
				return false;
			}
			 
			//파일 확장자 체크 & 파일들의 총 용량제한 체크
			let totalSize = 0;
			const isValid = files.every(f => {
				const ext = f.name.split(".").pop().toLowerCase(); //확장자 추출 및 소문자 변환
				totalSize += f.size;
				return !BLOCK_EXT.includes(ext) && f.size <= MAX_FILE_SIZE; //위에서 명시한 확장자가 아닐경우
			}) && totalSize <= MAX_TOTAL_SIZE

			if(!isValid) {
				alert('다음 파일 확장자는 업로드가 불가합니다.\n - [exe, sh, jsp, java, class, html, js] \n 또한 각 파일은 10MB 이하, 전체 합계는 50MB 이하여야 합니다.')
			}
			return isValid;
		}
		
		// x 버튼 클릭시 삭제
		$(".attach-area").on("click", "i", function(){
			const uuid = $(this).closest("[data-uuid]").data("uuid");
			$('[data-uuid="' + uuid + '"]').remove();
		});

		$("#f1").change(function() {
 			event.preventDefault();
			const formData = new FormData();
		
			const files = this.files; //여기서 this는 input type
			
			const data = []; // 기존 파일목록이 들어갈 곳
			$(".attach-list li").each(function(){
				//console.log({...this.dataset});
				data.push({...this.dataset});
			});
			
			console.log('기존', data);
			console.log('신규', [...files]);
			
			const mixedFiles = [...data.map(d => { return {name:d.origin, size:d.size/1} }), ...files];
			console.log(mixedFiles);

			for(let i = 0; i < files.length; i++){
				formData.append("f1", files[i]);
			}
		
 		/* $("#uploadForm").submit(function() { //파일 업로드 버튼 클릭시
 			event.preventDefault();
			const formData = new FormData(this);
			const files = this.f1.files; */

			const valid = validateFiles(mixedFiles);
			/* console.log(formData, valid); */
			if(!valid) {
				return;
			}
			
			$.ajax({
				url : '${cp}/upload',
				method : 'POST',
				data : formData,
				processData : false, //data를 queryString으로 쓰지 않겠다
				contentType : false, 
				//multipart/form-data;가 들어가야 하지만, false:내가 정의하지않겠다.
				//이후에 나오게 될 브라우저 정보도 포함시키겠다. == 즉 기본 브라우저 설정을 따르겠다는 옵션
				success : function(data){
					console.log(data);
					
					//확인용 * 비동기처리를 한 이후에 보여져야 할 동적 데이터
					let str = "";
					let thumbStr = "";
					for(let a of data){
						// $(".container").append("<p>" + data[a].origin + "</p>");
						str += `<li class="list-group-item d-flex align-items-center justify-content-between"
							data-uuid="\${a.uuid}"
							data-origin="\${a.origin}"
							data-image="\${a.image}"
							data-path="\${a.path}"
							data-size="\${a.size}"
							data-odr="\${a.odr}"
						>
							<a href="${cp}/download?uuid=\${a.uuid}&origin=\${a.origin}&path=\${a.path}">\${a.origin}</a>
							<i class="fa-solid fa-xmark float-end text-danger"></i>
						</li>`;
						
						
						//이미지인 경우(썸네일 표시)
						if(a.image){
							thumbStr += `<div class="my-2 col-12 col-sm-4 col-lg-2"
											data-uuid="\${a.uuid}" >
								<div class="my-2 bg-primary" 
									style="height: 150px; background-size: cover; background-image:url('${cp}/display?uuid=t_\${a.uuid}&path=\${a.path}')">
									<i class="fa-solid fa-xmark float-end text-danger m-2"></i>
									</div>
								</div>`
						}
					}
					$(".attach-list").append(str);
					$(".attach-thumb").append(thumbStr);
				}
			})
		})
	$('#modifyForm').submit(function(){
		event.preventDefault();
		if(!confirm('수정하시겠습니까?')){
			return;
		}
		
		const data = [];
		$(".attach-list li").each(function(){
			//console.log({...this.dataset});
			data.push({...this.dataset});
		});
		console.log(JSON.stringify(data));
		data.forEach((item, idx) => item.odr = idx);
		$("[name='encodedStr']").val(JSON.stringify(data));
		this.submit();
	})
})

	   
	    
</script>

	
</body>
</html>
