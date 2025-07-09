<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp"%>
<style>
    body {
      background-color: #f8f9fa;
    }
    .sidebar {
      min-height: 100vh;
      background-color: #1c1f23;
      color: white;
    }
    .sidebar a {
      color: white;
      text-decoration: none;
    }
    .sidebar .active {
      background-color: #343a40;
    }
    .card-title {
      font-size: 0.95rem;
      font-weight: bold;
    }
  </style>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <%@ include file="admin_sidebar.jsp"%>

    <!-- 메인 콘텐츠 -->
    <div class="col-md-10 p-4">
      <div class="container my-5" style="max-width: 85%;">
        <!-- 타이틀 -->
        <div class="bg-white rounded shadow-sm p-4 mb-4">
          <h2 class="fw-bold mb-1">관리자 문의 답변</h2>
          <p class="text-muted mb-0">수강생들이 보낸 문의를 확인하고 답변을 등록해 주세요.</p>
        </div>

        <!-- 상태 필터 탭 -->
        <div class="btn-group mb-4 w-100" role="group">
          <button type="button" class="btn btn-outline-secondary active filter-btn" data-filter="all">전체</button>
          <button type="button" class="btn btn-outline-secondary filter-btn" data-filter="waiting">답변대기</button>
          <button type="button" class="btn btn-outline-secondary filter-btn" data-filter="done">답변완료</button>
        </div>

        <!-- 문의 리스트 -->
        <div class="accordion" id="inquiryAccordion">
          <!-- 답변대기 카드 -->
          <div class="card border-0 shadow-sm mb-3 inquiry-card" data-status="waiting" style="border-radius: 12px;">
            <div class="card-header bg-white d-flex justify-content-between align-items-center rounded-top" style="cursor: pointer;" data-bs-toggle="collapse" data-bs-target="#inquiry1">
              <div>
                <span class="badge bg-danger me-2">답변대기</span>
                <span class="text-muted">[홍길동]</span>
                <span class="fw-semibold ms-2">강사님 환불해주세요</span>
              </div>
              <small class="text-muted">2025.06.23</small>
            </div>
            <div id="inquiry1" class="collapse" data-bs-parent="#inquiryAccordion">
              <div class="card-body bg-white rounded-bottom">
                <p class="mb-3">수업 시간 잘못봤어요ㅠㅠ 수강취소랑 환불 해주세요</p>
                <form class="answer-form">
                  <div class="mb-3">
                    <label class="form-label fw-semibold">답변 작성</label>
                    <textarea class="form-control" rows="3" placeholder="답변을 입력하세요" style="border-radius: 8px;"></textarea>
                  </div>
                  <button type="submit" class="btn btn-danger btn-sm px-3">답변 등록</button>
                </form>
              </div>
            </div>
          </div>

          <!-- 답변완료 카드 -->
          <div class="card border-0 shadow-sm mb-3 inquiry-card" data-status="done" style="border-radius: 12px;">
            <div class="card-header bg-white d-flex justify-content-between align-items-center rounded-top" style="cursor: pointer;" data-bs-toggle="collapse" data-bs-target="#inquiry2">
              <div>
                <span class="badge bg-secondary me-2">답변완료</span> <!-- 회색 뱃지로 변경 -->
                <span class="text-muted">[김수강]</span>
                <span class="fw-semibold ms-2">수업 문의 드립니다</span>
              </div>
              <small class="text-muted">2025.06.21</small>
            </div>
            <div id="inquiry2" class="collapse" data-bs-parent="#inquiryAccordion">
              <div class="card-body bg-white rounded-bottom">
                <p class="mb-3">준비물이 따로 필요한가요?</p>
                <hr>
                <div class="answer-section">
                  <div class="d-flex align-items-center mb-2">
                    <img src="https://i.pravatar.cc/32?u=admin" class="rounded-circle me-2" alt="관리자" />
                    <strong>관리자</strong>
                  </div>
                  <p class="mb-2">별도 준비물 없이 제공됩니다 :)</p>
                  <div class="d-flex gap-2">
                    <button class="btn btn-outline-secondary btn-sm btn-edit">수정</button>
                    <button class="btn btn-outline-danger btn-sm btn-delete">삭제</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
    </div>
  </div>
</div>
      <script>
        $(function (){
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
        });
      </script>
</body>

</html>