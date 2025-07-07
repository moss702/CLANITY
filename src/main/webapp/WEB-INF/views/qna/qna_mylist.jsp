<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>내 문의내역</title>
  <link rel="stylesheet" href="${cp}/css/qna_style.css" />
</head>

<body>
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
		    ${qna.boardId}
  <!-- 문의 리스트 -->
  <div class="accordion" id="inquiryAccordion">
		<c:forEach var="qna" items="${myQnaList}">
		  <div class="card border-0 shadow-sm mb-3 inquiry-card" data-status="${qna.commentCount == 0 ? 'waiting' : 'done'}">

		    
		    <div class="card-header bg-white d-flex justify-content-between align-items-center"
			     role="button"
			     data-bs-toggle="collapse"
			     data-bs-target="#qna${qna.boardId}"
			     aria-expanded="false"
			     aria-controls="qna${qna.boardId}">
		      <div>
				<!-- 답변대기 카드 -->
		        <span class="badge ${qna.commentCount == 0 ? 'bg-danger' : 'bg-secondary'} me-2">
		          ${qna.commentCount == 0 ? '답변대기' : '답변완료'}
		        </span>
		        <span class="text-muted">
		          [${qna.receiverId == null ? '고객센터' : '강사'}]
		        </span>
		        <span class="fw-semibold ms-2">${qna.title}</span>
	              <small class="text-muted">
		            <fmt:formatDate value="${faq.createdAt}" pattern="yyyy.MM.dd"/>
	              </small>
		      </div>
		    </div>
		
		    <div id="qna${qna.boardId}" class="collapse" data-bs-parent="#inquiryAccordion">
		      <div class="card-body bg-white">
		        <p class="mb-3">${qna.content.replaceAll("\\n", "<br/>")}</p>
		        
   		        <!-- 첨부파일 영역 -->



		        
		        <!-- 답변이 달리지 않았다면 수정 및 삭제 가능 -->
		        <c:if test="${qna.commentCount == 0}">
		          <div class="d-flex gap-2 mt-2">
       					<!-- 수정 버튼 -->
					    <button
					      class="btn btn-outline-secondary btn-sm btn-edit"
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
		        
     		    <!-- 수정 입력 폼 -->
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
 document.addEventListener("DOMContentLoaded", function () {
	    const accordionItems = document.querySelectorAll('.inquiry-card');

	    accordionItems.forEach(item => {
	      const header = item.querySelector('.card-header');
	      const collapseTarget = item.querySelector('.collapse');

	      if (header && collapseTarget) {
	        header.addEventListener('click', function () {
	          const isShown = collapseTarget.classList.contains('show');

	          // 기존 열린 항목 닫기
	          document.querySelectorAll('#inquiryAccordion .collapse.show').forEach(el => {
	            el.classList.remove('show');
	          });

	          // 현재 항목 열기
	          if (!isShown) {
	            collapseTarget.classList.add('show');
	          }
	        });
	      }
	    });
	  });
 
 	// 답변이 안달렸다면 문의 수정, 삭제 가능
	  $(function () {
	    $('.edit-btn').on('click', function () {
	      const boardId = $(this).data('id');
	      const $card = $(this).closest('.card-body');
	      const $form = $card.find('.edit-form');
	      const $viewContent = $card.find('p.mb-3');
	
	      // 기존 텍스트 숨기고 form 보이기
	      $form.removeClass('d-none');
	      $viewContent.hide();
	
	      // 기존 데이터 불러오기
	      fetch(`/CLANITY/qna/update?boardId=${boardId}`)
	        .then(res => res.json())
	        .then(data => {
	          $form.find('input[name="title"]').val(data.title);
	          $form.find('textarea[name="content"]').val(data.content);
	        });
	    });
	    // 수정 취소
	    $(document).on('click', '.cancel-edit-btn', function () {
	      const $form = $(this).closest('.edit-form');
	      const $viewContent = $form.siblings('p.mb-3');
	      $form.addClass('d-none');
	      $viewContent.show();
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
  
  
</body>
</html>
