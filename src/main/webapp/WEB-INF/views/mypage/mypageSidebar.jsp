<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside class="bg-light border-end p-3" style="width: 250px;">
  <!-- 프로필 -->
  <div class="text-center mb-4">
    <img src="https://via.placeholder.com/60" class="rounded-circle mb-2" alt="프로필">
    <div><strong>${member.nickname}</strong></div>
    <div class="text-muted small">${member.email}</div>
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

  <!-- 메뉴 -->
  <ul class="nav flex-column small">
  	<li class="nav-item"><a class="nav-link" href="${cp}/mypage/edit">정보수정하기</a></li>
	<li class="nav-item"><a class="nav-link" href="${cp}/mypage/activity">나의활동</a></li>
	<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>	
    <li class="nav-item"><a class="nav-link" href="#">문의하기</a></li>
    <li class="nav-item"><a class="nav-link" href="#">사업자신청</a></li>
    <li class="nav-item"><a class="nav-link" href="#">탈퇴 요청</a></li>
    <li class="nav-item"><a class="nav-link" href="${cp}/member/logout">로그아웃</a></li>
  </ul>
</aside>