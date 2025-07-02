<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <button class="btn btn-outline-secondary btn-sm" onclick="location.href='/qna_main'">1:1 문의하기</button>
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

      <!-- 등록 폼 -->
      <div class="faq-form mb-4" id="faqForm">
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
          <input type="text" class="form-control" id="faqQuestion" placeholder="질문 제목을 입력하세요">
        </div>
        <div class="mb-2">
          <label class="form-label fw-semibold">답변</label>
          <textarea class="form-control" id="faqAnswer" rows="3" placeholder="답변 내용을 입력하세요"></textarea>
        </div>
        <button class="btn btn-danger btn-sm" onclick="submitFaq()">등록하기</button>
      </div>

      <!-- FAQ 목록 -->
      <div class="accordion" id="faqAccordion">
        <div class="card faq-card mb-3" data-category="class">
          <div class="card-header d-flex justify-content-between align-items-center" data-bs-toggle="collapse" data-bs-target="#faq1">
            <div><strong class="text-danger">[클래스]</strong> 재료는 직접 준비해야 하나요?</div>
            <small class="text-muted">2025.06.22</small>
          </div>
          <div id="faq1" class="collapse" data-bs-parent="#faqAccordion">
            <div class="faq-answer">
              <p>아니요, 모든 수업 재료는 클래스에서 제공됩니다.</p>
              <div class="faq-buttons d-flex gap-2 admin-only">
                <button class="btn btn-outline-secondary btn-sm">수정</button>
                <button class="btn btn-outline-danger btn-sm btn-delete">삭제</button>
              </div>
            </div>
          </div>
        </div>

        <!-- 추가 항목은 동일한 구조 반복 -->
      </div>
    </div>
  </div>
</div>

 <%@ include file="../common/footer.jsp" %>

<script>
  const isAdmin = true;
  if (isAdmin) $('.admin-only').show();

  $('.filter-btn').on('click', function () {
    const filter = $(this).data('filter');
    $('.filter-btn').removeClass('active');
    $(this).addClass('active');
    $('.faq-card').each(function () {
      const category = $(this).data('category');
      $(this).toggle(filter === 'all' || category === filter);
    });
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
    $('#faqForm').slideToggle();
  }

  function submitFaq() {
    const category = $('#faqCategory').val();
    const question = $('#faqQuestion').val().trim();
    const answer = $('#faqAnswer').val().trim();
    if (!question || !answer) return alert('질문과 답변을 모두 입력하세요.');

    const timestamp = Date.now();
    const newCard = `
      <div class="card faq-card mb-3" data-category="${category}">
        <div class="card-header d-flex justify-content-between align-items-center" data-bs-toggle="collapse" data-bs-target="#newFaq${timestamp}">
            <div><strong class="text-danger">[${selectedCategory}]</strong> ${question}</div>
          <small class="text-muted">방금전</small>
        </div> 
        <div id="newFaq${timestamp}" class="collapse" data-bs-parent="#faqAccordion">
          <div class="faq-answer">
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
</script>

</body>
</html>
