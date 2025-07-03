<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>알림 발송</title>
  <link rel="stylesheet" href="qna_style.css" />
</head>

<body>
<%@ include file="../common/header.jsp" %>

  <div class="settings-wrapper">
    <!-- 좌측 메뉴 -->
    <div class="category-menu">
      <button class="pill-btn w-100">알림 보내기</button>
    </div>

    <!-- 우측 콘텐츠 -->
    <div class="flex-grow-1">
 <!-- 타이틀 영역 -->
<div class="container my-5" style="max-width: 1000px;">
  <!-- 타이틀 -->
  <div class="bg-white rounded shadow-sm p-4 mb-4">
    <h2 class="fw-bold mb-1">알림 보내기</h2>
    <p class="text-muted mb-0">클래스 커뮤니티에 소속된 수강생들에게 알림을 보냅니다</p>
  </div>



<!-- 상태 필터 탭 -->
<div class="btn-group mb-4 w-100" role="group" id="tabButtons">
  <button type="button" class="btn btn-outline-secondary active" data-tab="send">알림 보내기</button>
  <button type="button" class="btn btn-outline-secondary" data-tab="history">보낸 알림 기록</button>
</div>

<!-- 알림 보내기 -->
<div id="tab-send" class="tab-section">
  <form class="bg-white p-4 rounded shadow-sm">
    <div class="mb-3">
      <label class="form-label fw-semibold">알림 제목</label>
      <input type="text" class="form-control" maxlength="20" placeholder="20자 이내로 입력" required>
    </div>
    <div class="mb-3">
      <label class="form-label fw-semibold">알림 내용</label>
      <textarea class="form-control" rows="5" placeholder="내용을 입력하세요" required></textarea>
    </div>

<div class="d-flex justify-content-end gap-2 align-items-start flex-wrap">
  <button type="reset" class="btn btn-outline-secondary me-auto">취소</button>
  <button type="button" class="btn btn-danger" id="btn-schedule">예약발송</button>
  <button type="submit" class="btn text-white" style="background-color:#E63946;">발송</button>
</div>
  </form>
  <!-- 예약발송 날짜·시간 선택 폼 (처음엔 숨김) -->
<div id="schedule-form" class="mt-3" style="display: none;">
  <div class="row g-2">
    <div class="col-md-6">
      <label class="form-label fw-semibold">예약 날짜</label>
      <input type="date" class="form-control" />
    </div>
    <div class="col-md-6">
      <label class="form-label fw-semibold">예약 시간</label>
      <input type="time" class="form-control" />
    </div>
  </div>
</div>
</div>

<!-- 보낸 알림 기록 -->
<div id="tab-history" class="tab-section" style="display:none;">
  <div class="accordion" id="alertAccordion">
    <div class="card border-0 shadow-sm mb-3" style="border-radius: 12px;">
      <div class="card-header bg-white d-flex justify-content-between align-items-center rounded-top" data-bs-toggle="collapse" data-bs-target="#alert1" style="cursor:pointer;">
        <div class="fw-semibold">🎉 클래스 일정 변경 안내</div>
        <small class="text-muted">2025.06.28</small>
      </div>
      <div id="alert1" class="collapse" data-bs-parent="#alertAccordion">
        <div class="card-body">
          안녕하세요! 클래스 일정이 7월 1일로 변경되었습니다. 참고 부탁드립니다.
        </div>
      </div>
    </div>

    <div class="card border-0 shadow-sm mb-3" style="border-radius: 12px;">
      <div class="card-header bg-white d-flex justify-content-between align-items-center rounded-top" data-bs-toggle="collapse" data-bs-target="#alert2" style="cursor:pointer;">
        <div class="fw-semibold">📝 수강 전 유의사항</div>
        <small class="text-muted">2025.06.25</small>
      </div>
      <div id="alert2" class="collapse" data-bs-parent="#alertAccordion">
        <div class="card-body">
          준비물을 꼭 확인해 주세요. 앞치마와 물티슈 지참 부탁드립니다.
        </div>
      </div>
    </div>
  </div>
</div>
  </div>
</div></div>

<%@ include file="../common/footer.jsp" %>

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


  const tabs = document.querySelectorAll('#tabButtons button');
  tabs.forEach(btn => {
    btn.addEventListener('click', () => {
      tabs.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      document.querySelectorAll('.tab-section').forEach(sec => sec.style.display = 'none');
      document.querySelector(`#tab-${btn.dataset.tab}`).style.display = 'block';
    });
  });
// 예약발송 버튼 클릭 시 폼 표시 토글
document.getElementById('btn-schedule').addEventListener('click', () => {
  const form = document.getElementById('schedule-form');
  form.style.display = form.style.display === 'none' ? 'block' : 'none';
});

  </script>
  
</body>
</html>
