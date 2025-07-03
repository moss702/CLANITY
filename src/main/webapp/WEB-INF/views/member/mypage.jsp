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
   <aside class="bg-light border-end p-3" style="width: 250px;">
    <!-- 프로필 -->
    <div class="text-center mb-4">
      <img src="https://via.placeholder.com/60" class="rounded-circle mb-2" alt="프로필">
      <div><strong>Classmate975830h</strong></div>
      <div class="text-muted small">zyx_2@naver.com</div>
    </div>

    <!-- 구독 요약 -->
    <div class="mb-3">
      <div class="d-flex justify-content-between">
        <span>쿠폰</span><span>0장</span>
      </div>
      <div class="d-flex justify-content-between">
        <span>캐시</span><span>0</span>
      </div>
    </div>

    <!-- 버튼 -->
    <div class="d-grid gap-2 mb-3">
      <button class="btn btn-warning btn-sm">구독을 바로 시작해보세요!</button>
      <button class="btn btn-dark btn-sm">구독 관리</button>
    </div>

    <!-- 메뉴 -->
    <ul class="nav flex-column small">
      <li class="nav-item"><a class="nav-link" href="#">가입한 멤버십 관리</a></li>
      <li class="nav-item"><a class="nav-link" href="#">주문 및 배송</a></li>
      <li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
      <li class="nav-item"><a class="nav-link" href="#">결제 수단 관리</a></li>
      <li class="nav-item"><a class="nav-link" href="#">정기 결제 내역</a></li>
      <li class="nav-item"><a class="nav-link" href="#">친구 초대 <span class="badge bg-primary">쿠션 선택 받기</span></a></li>
      <li class="nav-item"><a class="nav-link" href="#">가입 문의</a></li>
      <li class="nav-item"><a class="nav-link" href="#">구독 이용권 등록하기</a></li>
      <li class="nav-item"><a class="nav-link" href="#">수강권 등록하기</a></li>
      <li class="nav-item"><a class="nav-link" href="#">크리에이터 지원</a></li>
      <li class="nav-item"><a class="nav-link" href="#">헬프센터</a></li>
      <li class="nav-item"><a class="nav-link" href="#">문의하기</a></li>
      <li class="nav-item"><a class="nav-link" href="#">설정</a></li>
      <li class="nav-item"><a class="nav-link" href="${cp}/member/logout">로그아웃</a></li>
    </ul>
  </aside>

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