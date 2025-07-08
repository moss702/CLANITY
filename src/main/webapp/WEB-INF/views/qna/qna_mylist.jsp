<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<script>const cp = '<c:out value="${pageContext.request.contextPath}" />';</script>

<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>내 문의내역</title>
  <link rel="stylesheet" href="${cp}/css/qna_style.css" />
</head>

<body data-context-path="${pageContext.request.contextPath}">


<%@ include file="../common/header.jsp" %>

  <div class="settings-wrapper">
    <!-- 좌측 메뉴 -->
    <div class="category-menu">
      <button class="pill-btn w-100">문의 내역</button>
    </div>


    <!-- 우측 콘텐츠 -->
    <div class="flex-grow-1">
 <!-- 타이틀 영역 -->
<div class="container my-5" style="max-width: 1000px;">
  <!-- 타이틀 -->
  <div class="bg-white rounded shadow-sm p-4 mb-4 d-flex justify-content-between align-items-center">
    <div>
      <h2 class="fw-bold mb-1">나의 문의내역</h2>
      <p class="text-muted mb-0">작성한 문의를 확인하고 답변을 받아보세요.</p>
      <p class="text-muted mb-0">답변이 등록되기 전까지 수정, 삭제가 가능합니다.</p>
    </div>
    <a href="${cp}/qna" class="btn btn-danger btn-sm px-3">1:1 문의하기</a>
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
		<c:forEach var="qna" items="${myQnaList}" varStatus="status">
		  <div class="card border-0 shadow-sm mb-3 inquiry-card" data-status="${qna.commentCount == 0 ? 'waiting' : 'done'}">
		
		    <!-- 문의 제목 / 상태 / 날짜 -->
		    <div class="card-header bg-white d-flex justify-content-between align-items-center"
		         role="button"
		         data-bs-toggle="collapse"
		         data-bs-target="#qna${qna.boardId}"
		         aria-expanded="false"
		         aria-controls="qna${qna.boardId}">
		      <div>
		        <span class="badge ${qna.commentCount == 0 ? 'bg-danger' : 'bg-secondary'} me-2">
		          ${qna.commentCount == 0 ? '답변대기' : '답변완료'}
		        </span>
		        <span class="text-muted">[${qna.receiverId == null ? '고객센터' : '강사'}]</span>
		        <span class="fw-semibold ms-2">${qna.title}</span>
		        <small class="text-muted">
		          <fmt:formatDate value="${qna.createdAt}" pattern="yyyy.MM.dd"/>
		        </small>
		      </div>
		    </div>
		
		    <!-- 문의 본문 + 첨부파일 + 답변/수정/삭제 -->
		    <div id="qna${qna.boardId}" class="collapse" data-bs-parent="#inquiryAccordion">
		      <div class="card-body bg-white">
		        <!-- 문의 내용 -->
		        <p class="mb-3">${qna.content.replaceAll("\\n", "<br/>")}</p>
		
		        <!-- ✅ 첨부파일 Ajax로 삽입될 자리 -->
		        <div class="attach-area" data-board-id="${qna.boardId}">
		        <p style="font-size:12px; color:#999;">boardId 디버깅: ${qna.boardId}</p>
		        </div>
		
		        <!-- 답변이 없을 경우에만 수정/삭제 가능 -->
		        <c:if test="${qna.commentCount == 0}">
		          <div class="d-flex gap-2 mt-2">
		            <!-- 수정 버튼 -->
		            <button class="btn btn-outline-secondary btn-sm btn-edit"
		                    data-id="${qna.boardId}"
		                    data-title="${fn:escapeXml(qna.title)}"
		                    data-content="${fn:escapeXml(qna.content)}"
		                    data-index="${status.index}">
		              수정
		            </button>
		
		            <!-- 삭제 버튼 -->
		            <form method="post" action="${cp}/qna" onsubmit="return confirm('삭제할까요?')">
		              <input type="hidden" name="id" value="${qna.boardId}" />
		              <input type="hidden" name="mode" value="delete" />
		              <button class="btn btn-outline-danger btn-sm">삭제</button>
		            </form>
		          </div>
		        </c:if>
		
		        <!-- 인라인 수정 폼 -->
		        <div class="edit-form d-none mt-3">
		          <form method="post" action="${cp}/qna/update" enctype="multipart/form-data">
		            <input type="hidden" name="boardId" value="${qna.boardId}">
		            <input type="text" name="title" class="form-control mb-2" placeholder="제목">
		            <textarea name="content" class="form-control mb-2" placeholder="내용" rows="5"></textarea>
		            <div class="d-flex gap-2">
		              <button type="submit" class="btn btn-danger btn-sm">수정 완료</button>
		              <button type="button" class="btn btn-secondary btn-sm cancel-edit-btn">취소</button>
		            </div>
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

  <!-- 스크립트 -->
 <script>
 window.onload = function () {
	  const cp = document.body.dataset.contextPath;

	  document.querySelectorAll('.attach-area[data-board-id]').forEach(div => {
	    const boardId = div.dataset.boardId;
	    console.log("💡 boardId:", boardId);
	    if (boardId) {
	      fetch(`${cp}/qna/attachList?boardId=${boardId}`)
	        .then(res => res.text())
	        .then(html => {
	          div.innerHTML = html;
	        })
	        .catch(err => console.error("첨부파일 로딩 실패", err));
	    } else {
	      console.warn("⚠️ boardId가 비어있어요!", div);
	    }
	  });
	};
  // 아코디언 클릭 이벤트
  document.querySelectorAll('.inquiry-card').forEach(item => {
    const header = item.querySelector('.card-header');
    const collapseTarget = item.querySelector('.collapse');

    if (header && collapseTarget) {
      header.addEventListener('click', function () {
        const isShown = collapseTarget.classList.contains('show');
        document.querySelectorAll('#inquiryAccordion .collapse.show').forEach(el => el.classList.remove('show'));
        if (!isShown) collapseTarget.classList.add('show');
      });
    }
  });

  // 필터 버튼 동작
  document.querySelectorAll('.filter-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      const filter = btn.dataset.filter;
      document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      document.querySelectorAll('.inquiry-card').forEach(card => {
        const status = card.dataset.status;
        card.style.display = (filter === 'all' || status === filter) ? '' : 'none';
      });
    });
  });

  // 수정 버튼
  document.querySelectorAll('.btn-edit').forEach(btn => {
    btn.addEventListener('click', function () {
      const boardId = this.dataset.id;
      const cardBody = this.closest('.card-body');
      const form = cardBody.querySelector('.edit-form');
      const content = cardBody.querySelector('p.mb-3');

      form.classList.remove('d-none');
      content.style.display = 'none';

      fetch(`${cp}/qna/update?boardId=${boardId}`)
        .then(res => res.json())
        .then(data => {
          form.querySelector('input[name="title"]').value = data.title;
          form.querySelector('textarea[name="content"]').value = data.content;
        });
    });
  });

  // 수정 취소 버튼
  document.querySelectorAll('.cancel-edit-btn').forEach(btn => {
    btn.addEventListener('click', function () {
      const form = this.closest('.edit-form');
      const content = form.previousElementSibling;
      form.classList.add('d-none');
      content.style.display = '';
    });
  });
});
</script>
  
  
</body>
</html>
