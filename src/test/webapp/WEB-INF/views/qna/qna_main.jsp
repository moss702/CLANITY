<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="../common/head.jsp" %>
  <title>문의하기</title>
  <link rel="stylesheet" href="${cp}/css/qna_style.css">
</head>

<body>
<%@ include file="../common/header.jsp" %>

	<div id="category-qna" class="settings-wrapper">
	  <!-- 좌측 사이드바 -->
	  <div class="category-menu">
	    <button class="pill-btn">문의하기</button>
	  </div>
	
	  <!-- 우측 컨텐츠 -->
	  <div class="flex-grow-1">
	    <div class="section-title">
	      <h2>1:1 문의하기</h2>
	      <p>궁금한 점이 있다면 언제든 문의해주세요.</p>
	    </div>
	
	    <!-- FAQ 안내 -->
	    <a href="${cp}/faq" class="faq-box mb-4">
	      <strong>FAQ 바로가기</strong> 문의 전 자주 묻는 질문을 확인해보세요.
	    </a>
	
	    <!-- 버튼 섹션 -->
	    <div class="row g-3 mb-4">

		<div class="col-md-6">
		  <a href="${cp}/qna/toBusiness" class="big-button btn btn-outline-secondary w-100">
		    강사님께 문의하기
		  </a>
		</div>
	      <div class="col-md-6">
	        <button class="big-button btn btn-danger w-100" onclick="openQnaModal('toAdmin')">고객센터에 문의하기</button>
	      </div>
	    </div>
	
	    <!-- 내 문의내역 -->
	    <div class="text-center">
	      <a href="${cp}/qna/mylist" class="btn-outline-dark">내 문의내역 보기</a>
	    </div>
	  </div>
	<%@ include file="qna_modal.jsp" %>
	</div>
	
 <%@ include file="../common/footer.jsp" %>
</body>

<script>
function openQnaModal(mode, className = '', classId = '') {
  const modal = new bootstrap.Modal(document.getElementById('qnaModal'));
  modal.show();

  const typeSelectWrap = document.getElementById('typeSelectWrap');
  const classInfoWrap = document.getElementById('classInfoWrap');
  const classInfo = document.getElementById('classInfo');

  if (mode === 'toBusiness') {
    typeSelectWrap.style.display = 'none';
    classInfoWrap.style.display = 'block';
    classInfo.value = `${className} (No. ${classId})`;
  } else {
    typeSelectWrap.style.display = 'block';
    classInfoWrap.style.display = 'none';
    classInfo.value = '';
  }
}

window.addEventListener("DOMContentLoaded", () => {
	  const urlParams = new URLSearchParams(window.location.search);
	  const mode = urlParams.get("mode");
	  const className = urlParams.get("className");
	  const classId = urlParams.get("classId");

	  if (mode === "toBusiness" && className && classId) {
	    openQnaModal('toBusiness', decodeURIComponent(className), classId);
	  }
	});
</script>

</html>