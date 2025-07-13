<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="qnaModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold" id="qnaModalLabel">1:1 문의하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
      </div>
      
      <div class="modal-body">
        <form id="qnaForm" action="${cp}/qna" method="post" enctype="multipart/form-data">

          <!-- 수신자 ID 전달용 hidden 필드 -->
          <input type="hidden" name="receiverId" id="receiverIdInput" value="">

          <!-- 관리자 문의 : 문의유형 선택 -->
          <div class="mb-3" id="typeSelectWrap">
            <label for="typeSelect" class="form-label fw-semibold">문의 유형</label>
            <select class="form-select" id="typeSelect">
              <option selected disabled>문의 유형 선택</option>
              <option>결제/환불</option>
              <option>클래스 정보</option>
              <option>회원/계정</option>
              <option>기타</option>
            </select>
          </div>

          <!-- 강사 문의 : 클래스 정보 표시 -->
          <div class="mb-3" id="classInfoWrap" style="display: none;">
            <label class="form-label fw-semibold">문의 클래스</label>
            <input type="text" class="form-control" id="classInfo" disabled>
            <p class="text-secondary small mt-2">강사님이 답변하시면 알림을 보내드릴게요.</p>
          </div>

          <!-- 공통 입력 -->
          <div class="mb-3">
            <label for="titleInput" class="form-label fw-semibold">문의 제목</label>
            <input type="text" class="form-control" id="titleInput" name="title" required>
          </div>

          <div class="mb-3">
            <label for="contentTextarea" class="form-label fw-semibold">문의 내용</label>
            <textarea class="form-control" id="contentTextarea" rows="5" name="content" required></textarea>
          </div>

          <div class="mb-4">
            <label for="fileInput" class="form-label fw-semibold">첨부파일</label>
            <input type="file" class="form-control" id="fileInput" name="files[]" multiple>
            <div class="form-text">첨부파일은 최대 10MB까지 업로드 가능합니다.</div>
          </div>

          <div class="d-grid">
            <button type="submit" class="btn btn-danger fw-bold">문의 전송하기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
  window.addEventListener("DOMContentLoaded", function () {
    const teacherId = "${teacherId}";
    const className = "${className}";

    if (teacherId) {
      document.getElementById("receiverIdInput").value = teacherId;
      document.getElementById("classInfoWrap").style.display = "block";
      document.getElementById("classInfo").value = className;
    } else {
      document.getElementById("receiverIdInput").value = "";
      document.getElementById("classInfoWrap").style.display = "none";
    }
  });
</script>