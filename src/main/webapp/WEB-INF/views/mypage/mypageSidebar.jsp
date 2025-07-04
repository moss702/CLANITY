<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<aside class="bg-light border-end p-3" style="width: 250px;">
  <!-- 프로필 -->
  <div class="text-center mb-4">
    <img src="https://placehold.co/60?text=Img" class="rounded-circle mb-2" alt="프로필">
    
    <c:if test="${empty member}">
    <div><strong>익명의 참여자</strong></div>
    <div class="text-muted small">메일이 없습니다</div>
    </c:if>
    <c:if test="${not empty member}">
    <div><strong>${member.nickname}</strong></div>
    <div class="text-muted small">${member.email}</div>
    </c:if>
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
  	<li class="nav-item"><a class="nav-link" href="${cp}/mypage/edit">내정보수정</a></li>
	<li class="nav-item"><a class="nav-link" href="${cp}/mypage/activity">나의활동</a></li>
	<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>	
    <li class="nav-item"><a class="nav-link" href="#">문의하기</a></li>
    <li class="nav-item"><a class="nav-link" href="#">사업자신청</a></li>
    <li class="nav-item"><a class="nav-link" href="#">탈퇴 요청</a></li>
    <li class="nav-item"><a class="nav-link" href="${cp}/member/logout">로그아웃</a></li>
  </ul>
</aside>