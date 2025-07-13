<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="../common/head.jsp" %>
	<title>자주 묻는 질문</title>
	<link rel="stylesheet" href="${cp}/css/qna_style.css"/>
</head>


<body>
<c:set var="loginMember" value="${member}"/>
<%@ include file="../common/header.jsp" %>

<c:forEach items="${boardCategories}" var="cat">
	<c:if test="${cat.categoryId == pageDto.cri.categoryId}">
		<c:set value="${cat}" var="c" />
	</c:if>
</c:forEach>

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
			<h2>1:1 문의하기</h2>
			<p>궁금한 점이 있다면 언제든 문의해주세요.</p>
		</div>

		<!-- FAQ 안내 -->
		<a href="${cp}/board/list?categoryId=1" class="faq-box mb-4">
			<strong>FAQ 바로가기</strong> 문의 전 자주 묻는 질문을 확인해보세요.
		</a>

		<!-- 버튼 섹션 -->
		<div class="row g-3 mb-4">
			<div class="col-md-6">
				<a href="${cp}/qna/toBusiness" class="big-button btn btn-outline-secondary w-100">클래스 강사에게 문의하기</a>
			</div>
			<div class="col-md-6">
				<a href="${cp}/board/write?${cri.qs2}" class="big-button btn btn-danger w-100">고객센터 문의하기</a>

			</div>
		</div>

		<!-- 내 문의내역 -->
		<div class="text-center">
			<a href="${cp}/board/list?${cri.qs2}" class="btn-outline-dark">내 문의내역 보기</a>
		</div>
	</div>
	<%-- 문의 하기 종료 --%>
</div>
	<%@ include file="../common/footer.jsp" %>

	<script>


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
