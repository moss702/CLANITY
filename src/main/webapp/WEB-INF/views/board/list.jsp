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

	<%-- FAQ 시작 --%>
	<c:if test="${c.categoryId == 1}">
	<div class="flex-grow-1">
	<!-- 헤더와 버튼 -->
	<div class="bg-white rounded shadow-sm p-4 mb-4">
		<div class="top-group">
			<div>
				<h2 class="fw-bold mb-1">${c.name}</h2>
				<p class="text-muted mb-0">클래니티 고객들이 가장 많이 궁금해하는 질문을 확인하세요.</p>
			</div>
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
	<c:if test="${loginMember != null and loginMember.role == 'ADMIN'}">
		<div class="mb-3 text-end">
			<button class="btn btn-danger btn-sm" onclick="toggleFaqForm()">+ 질문 등록</button>
		</div>
	</c:if>

	<div id="faqFormAnchor"></div>
	<!-- 등록 폼 -->
	<form id="faqForm" class="faq-form" action="${cp}/board/write" method="post">
		<input type="hidden" id="faqId" name="id" value="${faq.boardId}"/> <!-- 수정용정보 -->
		<input type="hidden" id="faqMode" name="mode" value="write"/>

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
			<input type="text" class="form-control" id="faqQuestion" name="title" placeholder="질문 제목을 입력하세요">
		</div>

		<div class="mb-2">
			<label class="form-label fw-semibold">답변</label>
			<textarea class="form-control" id="faqAnswer" name="content" rows="3"
					  placeholder="답변 내용을 입력하세요"></textarea>
		</div>

		<button type="submit" class="btn btn-danger btn-sm">등록하기</button>
	</form>


	<!-- FAQ 목록 -->
	<div class="accordion" id="boardAccordion">
		<c:forEach items="${boards}" var="b" varStatus="status">
			<div class="card faq-card mt-3 mb-3">
				<div class="card-header">
					<button class="btn w-100 text-start d-flex justify-content-between align-items-center fw-semibold"
							type="button"
							data-bs-toggle="collapse"
							data-bs-target="#faq${status.index}"
							aria-expanded="false"
							aria-controls="faq${status.index}"
							style="background: none; border: none; padding: 0;">
						<div><strong class="text-danger">[FAQ]</strong> ${b.title}</div>
						<small class="text-muted">
							<fmt:parseDate value="${b.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
							<fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd"/>
						</small>
					</button>
				</div>

				<div id="faq${status.index}" class="collapse"
					 data-bs-parent="#boardAccordion"
					 aria-labelledby="faq${status.index}">
					<div class="faq-answer p-3">
						<p>${b.content.replaceAll("\\n", "<br/>")}</p>
						<c:if test="${member != null and member.role == 'ADMIN'}">
							<div class="faq-buttons d-flex gap-2 mt-2">

								<!-- 수정 버튼 -->
								<button
										class="btn btn-outline-secondary btn-sm btn-edit"
										data-id="${faq.boardId}"
										data-title="${fn:escapeXml(faq.title)}"
										data-content="${fn:escapeXml(faq.content)}"
										data-index="${status.index}">
									수정하기
								</button>

								<!-- 삭제 버튼 -->
								<form method="post" action="${cp}/faq" onsubmit="return confirm('삭제할까요?')">
									<input type="hidden" name="id" value="${faq.boardId}"/>
									<input type="hidden" name="mode" value="delete"/>
									<button class="btn btn-outline-danger btn-sm">삭제</button>
								</form>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</div>
	</c:if>
	<%-- FAQ 끝 --%>
	<c:if test="${c.categoryId == 2}">
	<%-- 문의 하기 시작 --%>
	<%--<div class="flex-grow-1">
		<div class="section-title">
			<h2>1:1 문의하기
			</h2>
			<p>궁금한 점이 있다면 언제든 문의해주세요.</p>
		</div>

		<div class="form-box">
			<form>
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
					<input type="text" class="form-control" id="titleInput" placeholder="예) 환불 요청 관련 문의드립니다." required="">
				</div>

				<!-- 내용 -->
				<div class="mb-3">
					<label for="contentTextarea" class="form-label fw-semibold">문의 내용</label>
					<textarea class="form-control" id="contentTextarea" rows="5" placeholder="내용을 자세히 작성해주세요." required=""></textarea>
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
			</form>
		</div>
	</div>--%>
		<div class="flex-grow-1">
			<!-- 타이틀 영역 -->
			<!-- 문의내역.html (수강생용) -->
			<div class="container my-5" style="max-width: 1000px;">
				<!-- 타이틀 -->
				<div class="bg-white rounded shadow-sm p-4 mb-4 d-flex justify-content-between align-items-center">
					<div>
						<h2 class="fw-bold mb-1">나의 문의내역</h2>
						<p class="text-muted mb-0">작성한 문의를 확인하고 답변을 받아보세요.</p>
					</div>
					<a href="${cp}/board/qna?${pageDto.cri.qs2}" class="btn btn-danger btn-sm px-3">1:1 문의하기</a>
				</div>

				<!-- 상태 필터 탭 -->
				<div class="btn-group mb-3 w-100" role="group">
					<button type="button" class="btn btn-outline-secondary active filter-btn" data-filter="all">전체</button>
					<button type="button" class="btn btn-outline-secondary filter-btn" data-filter="waiting">답변대기</button>
					<button type="button" class="btn btn-outline-secondary filter-btn" data-filter="done">답변완료</button>
				</div>

				<!-- 추가 필터링 -->
				<div class="mb-4 d-flex gap-2 justify-content-center">
					<button class="btn btn-outline-dark btn-sm rounded-pill px-3">전체</button>
					<button class="btn btn-outline-dark btn-sm rounded-pill px-3">고객센터</button>
					<button class="btn btn-outline-dark btn-sm rounded-pill px-3">강사</button>
				</div>

		<!-- 문의 리스트 -->
				<div class="accordion" id="inquiryAccordion">
					<!-- 답변대기 카드 -->
			<c:forEach items="${boards}" var="b" varStatus="status">
					<div class="card border-0 shadow-sm mb-3 inquiry-card" data-status="waiting">
						<div class="card-header bg-white d-flex justify-content-between align-items-center" data-bs-toggle="collapse" data-bs-target="#inquiry${status.index}">
							<div>
								<span class="badge bg-danger me-2">답변대기</span>
								<span class="text-muted">[고객센터]</span>
								<span class="fw-semibold ms-2">${b.title}</span>
							</div>
							<small class="text-muted">
								<fmt:parseDate value="${b.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
								<fmt:formatDate value="${parsedDate}" pattern="yy.MM.dd"/>
							</small>
						</div>
						<div id="inquiry${status.index}" class="collapse" data-bs-parent="#inquiryAccordion">
							<div class="card-body bg-white">
								<p class="mb-3">${b.content.replaceAll("\\n", "<br/>")}</p>

								<!-- 수정/삭제 버튼 -->
								<div class="d-flex gap-2">
									<button class="btn btn-outline-secondary btn-sm">수정</button>
									<button class="btn btn-outline-danger btn-sm">삭제</button>
								</div>
							</div>
						</div>
					</div>
			</c:forEach>
			</div>
		</div>

	<!-- 답변완료 카드 -->
	<%--				<div class="card border-0 shadow-sm mb-3 inquiry-card" data-status="done">
						<div class="card-header bg-white d-flex justify-content-between align-items-center" data-bs-toggle="collapse" data-bs-target="#inquiry2">
							<div>
								<span class="badge bg-secondary me-2">답변완료</span>
								<span class="text-muted">[강사]</span>
								<span class="fw-semibold ms-2">수업 준비물 질문</span>
							</div>
							<small class="text-muted">2025.06.20</small>
						</div>
						<div id="inquiry2" class="collapse" data-bs-parent="#inquiryAccordion">
							<div class="card-body bg-white">
								<p class="mb-2">재료를 따로 준비해야 하나요?</p>
								<hr>
								<div class="answer-section">
									<div class="d-flex align-items-center mb-2">
										<img src="https://i.pravatar.cc/32?u=admin" class="rounded-circle me-2">
										<strong>강사</strong>
									</div>
									<p class="mb-0">모든 재료는 현장에서 제공됩니다 :)</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
--%>

			<!-- 스크립트 -->
			<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
			<script>
                $(function () {
                    $('.answer-form').on('submit', function (e) {
                        e.preventDefault();
                        const $form = $(this);
                        const $answerSection = $form.closest('.answer-section');
                        const answer = $form.find('textarea').val().trim();

                        if (!answer) {
                            alert('답변을 입력해주세요.');
                            return;
                        }

                        const profileImgUrl = 'https://i.pravatar.cc/32?u=admin';
                        const nickname = '관리자';

                        const answerHtml = `
          <div class="answer-header">
            <img src="\${profileImgUrl}" alt="프로필" />
            <strong>\${nickname}</strong>
          </div>
          <p class="answer-text">\${answer.replace(/\n/g, '<br>')}</p>
          <div class="answer-buttons">
            <button class="btn btn-outline-secondary btn-sm btn-edit">수정</button>
            <button class="btn btn-outline-danger btn-sm btn-delete">삭제</button>
          </div>
        `;

                        $answerSection.html(answerHtml);
                        const $header = $answerSection.closest('.card-body').siblings('.card-header');
                        $header.find('.text-primary').removeClass('text-primary').addClass('text-success').text('답변완료');
                    });

                    $(document).on('click', '.btn-edit', function () {
                        const $section = $(this).closest('.answer-section');
                        const text = $section.find('.answer-text').html().replace(/<br>/g, '\n');
                        const profile = $section.find('.answer-header')[0].outerHTML;

                        $section.html(`
          \${profile}
          <form class="answer-edit-form">
            <div class="mb-3"><textarea class="form-control" rows="3">\${text}</textarea></div>
            <button class="btn btn-danger btn-sm" type="submit">수정 완료</button>
            <button class="btn btn-secondary btn-sm btn-cancel" type="button">취소</button>
          </form>
        `);
                    });

                    $(document).on('click', '.btn-cancel', () => location.reload());

                    $(document).on('submit', '.answer-edit-form', function (e) {
                        e.preventDefault();
                        const $form = $(this);
                        const $section = $form.closest('.answer-section');
                        const text = $form.find('textarea').val().trim();
                        if (!text) return alert('내용을 입력해주세요.');
                        const profile = $section.find('.answer-header')[0].outerHTML;
                        $section.html(`
          \${profile}
          <p class="answer-text">\${text.replace(/\n/g, '<br>')}</p>
          <div class="answer-buttons">
            <button class="btn btn-outline-secondary btn-sm btn-edit">수정</button>
            <button class="btn btn-outline-danger btn-sm btn-delete">삭제</button>
          </div>
        `);
                    });

                    $(document).on('click', '.btn-delete', function () {
                        if (!confirm('정말 삭제할까요?')) return;
                        const $section = $(this).closest('.answer-section');
                        $section.html(`
          <p class="text-muted"><strong>답변없음</strong></p>
          <form class="answer-form">
            <div class="mb-3">
              <label class="form-label">답변 작성</label>
              <textarea class="form-control" rows="3" placeholder="답변을 입력하세요"></textarea>
            </div>
            <button type="submit" class="btn btn-sm btn-danger">답변 등록</button>
          </form>
        `);
                        const $header = $section.closest('.card-body').siblings('.card-header');
                        $header.find('.text-success').removeClass('text-success').addClass('text-primary').text('답변대기');
                    });
                });

                // 문의 상태 필터 기능
                $('.filter-btn').on('click', function () {
                    const filter = $(this).data('filter');
                    $('.filter-btn').removeClass('active');
                    $(this).addClass('active');

                    $('.inquiry-card').each(function () {
                        const status = $(this).data('status');
                        if (filter === 'all' || status === filter) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                });

			</script>


		</div>
	<%-- 문의 하기 종료 --%>
	</c:if>
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
