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
   <form action="${cp}/member/update" method="post" class="p-4" style="max-width: 500px; margin: 0 auto;">
  <!-- 프로필 이미지 (변경 아이콘은 구현에 따라 JS 필요) -->
  <div class="text-center mb-4">
    <img src="https://via.placeholder.com/80" class="rounded-circle" alt="프로필 이미지">
  </div>

  <!-- 닉네임 -->
  <div class="mb-3">
    <label for="nickname" class="form-label">닉네임</label>
    <input type="text" class="form-control" id="nickname" name="nickname" value="Classmate975830h" required>
  </div>

  <!-- 휴대폰 번호 -->
  <div class="mb-3">
    <label for="phone" class="form-label">휴대폰 번호</label>
    <input type="text" class="form-control" id="phone" name="phone" value="01054614223" required>
  </div>

  <!-- 이메일 (수정 불가) -->
  <div class="mb-3">
    <label for="email" class="form-label">이메일</label>
    <input type="email" class="form-control" id="email" name="email" value="${member.email}" >
  </div>

  <!-- 사용자 이메일 인증 버튼 -->
  <div class="mb-3">
    <label class="form-label d-block">사용자 인증</label>
    <button type="button" class="btn btn-dark w-100" id="sendVerifyBtn">인증을 해주세요</button>
  </div>

  <!-- 저장 버튼 (비활성화된 경우) -->
  <div class="mb-3">
    <button type="submit" class="btn btn-secondary w-100" disabled>저장하기</button>
  </div>

  <!-- 회원 탈퇴 링크 -->
  <div class="text-center">
    <a href="${cp}/member/withdraw" class="text-muted small">회원 탈퇴</a>
  </div>
</form>

<script>
$(function() {
	
    $("#sendVerifyBtn").on("click", function() {
      const email = $("#email").val();

      $.ajax({
        type: "POST",
        url: "/CLANITY/member/send-email-verify",
        data: { email: email },
        success: function() {
          alert("메일이 성공적으로 전송되었습니다.");
        },
        error: function() {
          alert("메일 전송에 실패했습니다.");
        }
      });
    });
  });
</script>
</main>
</body>
</html>