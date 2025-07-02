<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>알림 전체보기</title>
  <link rel="stylesheet" href="qna_style.css" />
</head>

<body class="p-4">
<%@ include file="../common/header.jsp" %>
  <div class="settings-wrapper">
    <!-- 좌측 메뉴 -->
    <div class="category-menu">
      <button class="pill-btn w-100">알림 기록</button>
    </div>

    <!-- 우측 설정 -->
    <div class="flex-grow-1">
        <!-- 알림 기록 보기 -->
        <div class="mt-4">
        <h5 class="mb-3">알림 기록 보기</h5>

        <!-- 필터 버튼 -->
        <div class="mb-3 d-flex gap-2 flex-wrap">
            <button class="pill-btn active" data-category="all">전체</button>
            <button class="pill-btn" data-category="notice">공지</button>
            <button class="pill-btn" data-category="class">클래스</button>
            <button class="pill-btn" data-category="community">소셜링</button>
            <button class="pill-btn" data-category="inquiry">문의</button>
        </div>

        <!-- 알림 리스트 -->
        <div id="notification-list">
            <!-- 예시 알림 -->
            <div class="rounded-box mb-2 notification-item" data-category="notice">
            <div class="d-flex justify-content-between">
                <div>
                <strong>[공지]</strong> 시스템 점검 안내
                <div class="text-muted small">2025-06-28 14:30</div>
            </div>
            <button class="btn btn-sm btn-outline-secondary">읽음</button>
            </div>
            </div>

            <div class="rounded-box mb-2 notification-item" data-category="class">
            <div class="d-flex justify-content-between">
                <div>
                <strong>[클래스]</strong> 내일 예정된 클래스가 있어요.
                <div class="text-muted small">2025-06-28 10:15</div>
                </div>
                <button class="btn btn-sm btn-outline-secondary">읽음</button>
            </div>
            </div>

            <div class="rounded-box mb-2 notification-item" data-category="community">
            <div class="d-flex justify-content-between">
                <div>
                <strong>[커뮤니티]</strong> 새 댓글이 달렸어요.
                <div class="text-muted small">2025-06-27 18:00</div>
                </div>
                <button class="btn btn-sm btn-outline-secondary">읽음</button>
            </div>
            </div>
  </div>

  <div class="text-center mt-3">
  <a id="load-more" class="btn btn-sm">10개 더보기</a>
</div>
</div>
</div>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>