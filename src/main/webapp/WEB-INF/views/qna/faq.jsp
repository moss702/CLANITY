<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="../common/head.jsp" %>
  <title>자주 묻는 질문</title>
<link rel="stylesheet" href="${cp}/css/qna_style.css" />
</head>

<body>
<%@ include file="../common/header.jsp" %>
<div class="settings-wrapper">
  <div class="category-menu">
    <button class="pill-btn w-100">자주 묻는 질문</button>
  </div>

  <div class="flex-grow-1">
    <div class="container my-5" style="max-width: 1000px;">
      <!-- 헤더와 버튼 -->
      <div class="bg-white rounded shadow-sm p-4 mb-4">
        <div class="top-group">
          <div>
            <h2 class="fw-bold mb-1">자주 묻는 질문</h2>
            <p class="text-muted mb-0">클래니티 고객들이 가장 많이 궁금해하는 질문을 확인하세요.</p>
          </div>
          <button class="btn btn-outline-secondary btn-sm" onclick="location.href='${cp}/qna'">1:1 문의하기</button>
        </div>
      </div>

      <!-- 검색창 -->
      <div class="input-group search-bar mx-auto mb-3">
        <input type="text" class="form-control" id="faqSearchInput" placeholder="검색어를 입력하세요">
        <button class="btn btn-danger" id="faqSearchBtn">검색</button>
      </div>

      <!-- 카테고리 탭 -->
      <div class="d-flex flex-wrap gap-2 justify-content-center mb-4">
        <button type="button" class="round-filter-btn active filter-btn" data-filter="all">전체</button>
        <button type="button" class="round-filter-btn filter-btn" data-filter="class">클래스</button>
        <button type="button" class="round-filter-btn filter-btn" data-filter="community">커뮤니티</button>
        <button type="button" class="round-filter-btn filter-btn" data-filter="payment">결제 및 환불</button>
        <button type="button" class="round-filter-btn filter-btn" data-filter="etc">기타</button>
      </div>




      <!-- 질문 추가 버튼 (관리자용) -->
      <div class="mb-3 text-end admin-only">
        <button class="btn btn-danger btn-sm" onclick="toggleFaqForm()">+ 질문 등록</button>
      </div>

      <div id="faqFormAnchor"></div>
      <!-- 등록 폼 -->
      <form id="faqForm" class="faq-form" action="${cp}/faq" method="post">
        <input type="hidden" id="faqId" name="id" value="${faq.boardId}"/> <!-- 수정용정보 -->
		 <input type="hidden" id="faqMode" name="mode" value="write" />

	        <div class="mb-2">
	          <label class="form-label fw-semibold">카테고리 선택</label>
				<select class="form-select" id="faqCategory">
				  <option value="class">클래스</option>
				  <option value="community">커뮤니티</option>
				  <option value="payment">결제 및 환불</option>
				  <option value="etc">기타</option>
				</select>
	        </div>
	        <div class="mb-2">
	          <label class="form-label fw-semibold">질문</label>
	          <input type="text" class="form-control" id="faqQuestion" name="title" placeholder="질문 제목을 입력하세요" >
	        </div>
	        
	        <div class="mb-2">
	          <label class="form-label fw-semibold">답변</label>
	          <textarea class="form-control" id="faqAnswer" name="content" rows="3" placeholder="답변 내용을 입력하세요"></textarea>
	        </div>
	        
  			<button type="submit" class="btn btn-danger btn-sm">등록하기</button>
      </form>
      
      
      <!-- FAQ 목록 -->
<div class="accordion" id="faqAccordion">
<c:forEach items="${faqList}" var="faq" varStatus="status">
  <div class="card faq-card mt-3 mb-3">
    <div class="card-header">
      <button class="btn w-100 text-start d-flex justify-content-between align-items-center fw-semibold"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#faq${status.index}"
              aria-expanded="false"
              aria-controls="faq${status.index}"
              style="background: none; border: none; padding: 0;">
        <div><strong class="text-danger">[${faqCategory}]</strong> ${faq.title}</div>
        <small class="text-muted">
	    <fmt:formatDate value="${faq.createdAt}" pattern="yyyy.MM.dd"/>
        </small>
      </button>
    </div>

    <div id="faq${status.index}" class="collapse"
         data-bs-parent="#faqAccordion"
         aria-labelledby="faq${status.index}">
      <div class="faq-answer p-3">
        <p>${faq.content.replaceAll("\\n", "<br/>")}</p>
        <div class="faq-buttons d-flex gap-2 admin-only mt-2">
        
        
      <!-- 질문 수정 버튼 누르면 다시 입력폼 보임! -->
      <div class="mb-3 text-end admin-only">
		<button
		  class="btn btn-outline-secondary btn-sm btn-edit"
		  data-id="${faq.boardId}"
		  data-title="${fn:escapeXml(faq.title)}"
		  data-content="${fn:escapeXml(faq.content)}"
		  data-index="${status.index}" >
		  수정하기
		</button>
      </div>
		
		<form method="post" action="${cp}/faq" onsubmit="return confirm('삭제할까요?')">
		  <input type="hidden" name="id" value="${faq.boardId}" />
		  <input type="hidden" name="mode" value="delete" />
		  <button class="btn btn-outline-danger btn-sm">삭제</button>
		</form>
        </div>
      </div>
    </div>
  </div>
</c:forEach>
</div>
    </div>
  </div>
</div>

 <%@ include file="../common/footer.jsp" %>

<script>
  const isAdmin = true;
  if (isAdmin) $('.admin-only').show();

  $('.filter-btn').on('click', function () {
	  const filter = $(this).data('filter'); // ex) 'class', 'community'
	  $('.filter-btn').removeClass('active');
	  $(this).addClass('active');
	  
	  $('.faq-card').each(function () {
	    const category = $(this).data('category');
	    $(this).toggle(filter === 'all' || category === filter);
	  });
	  
	  //$("#faqCategory").val($(this).text());
	});
	
  $('#faqSearchBtn').on('click', function () {
    const keyword = $('#faqSearchInput').val().toLowerCase();
    $('.faq-card').each(function () {
      const text = $(this).text().toLowerCase();
      $(this).toggle(text.includes(keyword));
    });
  });
  

  $(document).on('click', '.btn-delete', function () {
    if (confirm('정말 삭제하시겠습니까?')) {
      $(this).closest('.faq-card').remove();
    }
  });

  function toggleFaqForm() {
	  
	  const faqForm = $('#faqForm');

	  $('#faqForm').detach().insertAfter('#faqFormAnchor');

	  faqForm.slideToggle();

	  $('#faqId').val('');
	  $('#faqMode').val('write');
	  $('#faqQuestion').val('');
	  $('#faqAnswer').val('');
	  
  }

  function submitFaq() {
    const category = $('#faqCategory').val();
    const categoryText = $('#faqCategory option:selected').text();
    const question = $('#faqQuestion').val().trim();
    const answer = $('#faqAnswer').val().trim();
    if (!question || !answer) return alert('질문과 답변을 모두 입력하세요.');
    const timestamp = Date.now();
    const newCard = `
    	  <div class="card faq-card mb-3" data-category="${category}">
        <div class="card-header d-flex justify-content-between align-items-center">
          <div><strong class="text-danger">[${categoryText}]</strong> ${question}</div>
          <small class="text-muted">방금전</small>
        </div>
        <div class="faq-answer p-3">
          <p>${answer}</p>
            <div class="faq-buttons d-flex gap-2 admin-only">
              <button class="btn btn-outline-secondary btn-sm">수정</button>
              <button class="btn btn-outline-danger btn-sm btn-delete">삭제</button>
            </div>
          </div>
        </div>
      </div>`;

    $('#faqAccordion').prepend(newCard);
    $('#faqForm').slideUp();
    $('#faqQuestion').val('');
    $('#faqAnswer').val('');
  }
  
  function editFaq(id, title, content, index) {
	  $('#faqId').val(id);
	  $('#faqMode').val('modify');
	  $('#faqQuestion').val(title);
	  $('#faqAnswer').val(content);

	  const targetCard = $('#faq' + index).closest('.faq-card');
	  if (targetCard.length > 0) {
	    $('#faqForm').hide(); // reset
	    $('#faqForm').detach().appendTo(targetCard);
	    $('#faqForm').slideDown();
	  }
	
  }
  
  $(document).on('click', '.btn-edit', function () {
	  const id = $(this).data('id');
	  const title = $(this).data('title');
	  const content = $(this).data('content');
	  const index = $(this).data('index');

	  editFaq(id, title, content, index);
	});
	  
</script>

</body>
</html>
