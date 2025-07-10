<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
	<link rel="stylesheet" href="${cp}/css/qna_style.css"/>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div class="settings-wrapper container">
	<div class="category-menu">
		<c:forEach items="${boardCategories}" var="cat">
			<c:if test="${cat.type == 'LIST'}">
				<a class="btn pill-btn w-100 my-3" href="${cp}/board/list?categoryId=${cat.categoryId}">${cat.name}</a>
			</c:if>
		</c:forEach>
	</div>

	<%-- 문의 하기 시작 --%>
	<div class="flex-grow-1">
		<div class="section-title">
			<h2>1:1 문의하기
			</h2>
			<p>궁금한 점이 있다면 언제든 문의해주세요.</p>
		</div>

		<div class="form-box">
			<form method="post" action="write">
				<!-- 문의 유형 -->
				<div class="mb-3">
					<label for="typeSelect" class="form-label fw-semibold">문의 유형</label>
					<select class="form-select" id="typeSelect" required="">
						<option selected="" disabled="">문의 유형 선택</option>
						<option>결제/환불</option>
						<option>클래스 정보</option>
						<option>회원/계정</option>
						<option>기타</option>
					</select>
				</div>

				<!-- 제목 -->
				<div class="mb-3">
					<label for="titleInput" class="form-label fw-semibold">문의 제목</label>
					<input type="text" name="title" class="form-control" id="titleInput" placeholder="예) 환불 요청 관련 문의드립니다." required="">
				</div>

				<!-- 내용 -->
				<div class="mb-3">
					<label for="contentTextarea" class="form-label fw-semibold">문의 내용</label>
					<textarea class="form-control" name="content" id="contentTextarea" rows="5" placeholder="내용을 자세히 작성해주세요." required=""></textarea>
				</div>

				<!-- 첨부파일 -->
				<div class="mb-4">
					<label for="fileInput" class="form-label fw-semibold">첨부파일</label>
					<input type="file" class="form-control" id="fileInput">
					<div class="form-text">첨부파일은 최대 10MB까지 업로드 가능합니다.</div>
				</div>

				<!-- 전송 버튼 -->
				<div class="d-grid">
					<button type="submit" class="btn btn-danger fw-bold">문의 전송하기</button>
				</div>
				<input type="hidden" name="memberId" value="${member.memberId}">
				<input type="hidden" name="categoryId" value="${cri.categoryId}">
				<input type="hidden" name="page" value="1" />
				<input type="hidden" name="amount" value="${cri.amount}" />
				<input type="hidden" name="encodedStr" value="">
			</form>
		</div>
	</div>
	<%-- 문의 하기 종료 --%>
</div>

	<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
        
    <script>
        $(function() {
            CKEDITOR.replace('editor1', {
                height:400
            });
        });        
    </script>

	<script>
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
		
			const files = this.files; //여기서 this는 input
			for(let i = 0; i < files.length; i++){
				formData.append("f1", files[i]);
			}
		
 		/* $("#uploadForm").submit(function() { //파일 업로드 버튼 클릭시
 			event.preventDefault();
			const formData = new FormData(this);
			const files = this.f1.files; */

			const valid = validateFiles([...files]);
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
					
					//확인용
					let str = "";
					let thumbStr = "";
					for(let a of data){
						// $(".container").append("<p>" + data[a].origin + "</p>");
						str += `<li class="list-group-item d-flex align-items-center justify-content-between"
							data-uuid="\${a.uuid}"
							data-origin="\${a.origin}"
							data-image="\${a.image}"
							data-path="\${a.path}"
							data-odr="\${a.odr}"
							data-size="\${a.size}"
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
					console.log(thumbStr);
					$(".attach-list").html(str);
					$(".attach-thumb").html(thumbStr);
					
				}
			});

		})
		$("#writeForm").submit(function(){
			event.preventDefault();
			const data = [];
			$(".attach-list li").each(function() {
				data.push({...this.dataset});
			});
			console.log(JSON.stringify(data));
			data.forEach((item, idx) => item.odr = idx);
			// attbut에 있던 속성들을 다시 덮어쓰기
			
			$("[name='encodedStr']").val(JSON.stringify(data));
			this.submit();
		})
	})
	</script>


<%@ include file="../common/footer.jsp" %>
</body>
</html>