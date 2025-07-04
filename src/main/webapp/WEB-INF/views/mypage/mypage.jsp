<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<main class="d-flex" style="min-height: 100vh;">
  <!-- 왼쪽 고정 사이드바 -->
   <%@ include file="./mypageSidebar.jsp" %>
  <!-- 오른쪽 콘텐츠 영역 -->
   <div class="flex-grow-1 px-4 py-4">
    <h4 class="mb-3">다양한 클래스 구독으로 만나보세요</h4>
    <p class="text-muted">나에게 맞는 클래스를 추천받을 수 있어요.</p>

    <div class="mb-4">
      <button class="btn btn-warning">구독 시작하기</button>
    </div>

    <div class="mb-3">
      <a href="#" class="text-decoration-none">구독 혜택 알아보기 &rarr;</a>
    </div>

    <hr>

    <div class="text-muted small">
      <p>- 정기 구독 상품의 결제 주기에 따라 최초 결제일로부터 자동 결제됩니다. 입장이 예정일보다 늦는 경우 일정에 맞춰야 합니다.</p>
      <p>- 설정하신 지역에 따라, 서비스에서 지원하는 결제 수단이 다를 수 있습니다.</p>
    </div>
  </div>
	  
</main>
</body>
</html>