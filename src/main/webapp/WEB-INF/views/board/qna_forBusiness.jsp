<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>내게 온 문의함_forBusiness</title>
  <link rel="stylesheet" href="qna_style.css" />
</head>

<body>
  <div class="settings-wrapper">
    <!-- 좌측 메뉴 -->
    <div class="category-menu">
      <button class="pill-btn w-100">클래스 QnA</button>
    </div>

    <!-- 우측 콘텐츠 -->
    <div class="flex-grow-1">
 <!-- 타이틀 영역 -->
<div class="container my-5" style="max-width: 1000px;">
  <!-- 타이틀 -->
  <div class="bg-white rounded shadow-sm p-4 mb-4">
    <h2 class="fw-bold mb-1">내게 온 문의함</h2>
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
</div>


  <!-- 스크립트 -->
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
            <img src="${profileImgUrl}" alt="프로필" />
            <strong>${nickname}</strong>
          </div>
          <p class="answer-text">${answer.replace(/\n/g, '<br>')}</p>
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
          ${profile}
          <form class="answer-edit-form">
            <div class="mb-3"><textarea class="form-control" rows="3">${text}</textarea></div>
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
          ${profile}
          <p class="answer-text">${text.replace(/\n/g, '<br>')}</p>
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
</body>
</html>