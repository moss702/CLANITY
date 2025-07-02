<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>알림 설정</title>
  <link rel="stylesheet" href="alarm_style.css" />
</head>

<body class="p-4">
<%@ include file="../common/header.jsp" %>
  <div class="settings-wrapper">
    <!-- 좌측 메뉴 -->
    <div class="category-menu">
      <button class="pill-btn w-100">알림 설정</button>
    </div>

    <!-- 우측 설정 -->
    <div class="flex-grow-1">
      <!-- 전체 알람 -->
      <div class="rounded-box d-flex justify-content-between align-items-center">
        <strong>모든 알람 켜기</strong>
        <div class="form-check form-switch">
          <input class="form-check-input" type="checkbox" id="toggle-all" checked>
        </div>
      </div>

      <!-- 그룹: 커뮤니티 -->
      <div class="rounded-box alert-group" data-target="group1">
        <div class="d-flex justify-content-between align-items-center">
          <strong>커뮤니티 알림 설정</strong>
          <span class="arrow"></span>
        </div>
        <div id="group1" class="alert-items mt-2" style="display: none;">
          <div class="sub-setting d-flex justify-content-between align-items-center">
            <span>새 게시글 알람</span>
            <div class="form-check form-switch">
              <input class="form-check-input toggle-item" type="checkbox" checked>
            </div>
          </div>
          <div class="sub-setting d-flex justify-content-between align-items-center">
            <span>내 게시글에 댓글 알람</span>
            <div class="form-check form-switch">
              <input class="form-check-input toggle-item" type="checkbox" checked>
            </div>
          </div>
        </div>
      </div>

      <!-- 그룹: 클래스 -->
      <div class="rounded-box alert-group" data-target="group2">
        <div class="d-flex justify-content-between align-items-center">
          <strong>클래스 알림 설정</strong>
          <span class="arrow"></span>
        </div>
        <div id="group2" class="alert-items mt-2" style="display: none;">
          <div class="sub-setting d-flex justify-content-between align-items-center">
            <span>클래스 일정 알림</span>
            <div class="form-check form-switch">
              <input class="form-check-input toggle-item" type="checkbox" checked>
            </div>
          </div>
        </div>
      </div>

      <!-- 그룹: 문의 -->
      <div class="rounded-box alert-group" data-target="group3">
        <div class="d-flex justify-content-between align-items-center">
          <strong>문의 알림 설정</strong>
          <span class="arrow"></span>
        </div>
        <div id="group3" class="alert-items mt-2" style="display: none;">
          <div class="sub-setting d-flex justify-content-between align-items-center">
            <span>문의 답변 알림</span>
            <div class="form-check form-switch">
              <input class="form-check-input toggle-item" type="checkbox" checked>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>

<%@ include file="../common/footer.jsp" %>

  <script>
    $(function () {
      // 모든 알람 켜기 토글
      $('#toggle-all').on('change', function () {
        const isChecked = $(this).prop('checked');
        $('.toggle-item').prop('checked', isChecked).trigger('change');
      });

      // 개별 토글 체크 시 전체 토글 상태도 갱신
      $('.toggle-item').on('change', function () {
        const allChecked = $('.toggle-item').length === $('.toggle-item:checked').length;
        $('#toggle-all').prop('checked', allChecked);
      });

      // 그룹 클릭 시 슬라이드 토글 + 화살표 회전
      $('.alert-group').on('click', function (e) {
        // 하위 토글 클릭은 제외
        if ($(e.target).is('input')) return;
            const targetId = $(this).data('target');
            const $target = $('#' + targetId);
            const $arrow = $(this).find('.arrow');
        $target.slideToggle(200);
        $arrow.toggleClass('open');
      });
    });
  </script>
</body>
</html>
