<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<style>
  .centered-form {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 90vh;
    flex: 1;
  }

  .profile-form {
    width: 100%;
    max-width: 600px;
    padding: 2rem;
    background-color: #f8f9fa;
    border-radius: 12px;
    box-shadow: 0 0 12px rgba(0,0,0,0.1);
  }
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<main class="d-flex" style="min-height: 100vh;">
  <%@ include file="./mypageSidebar.jsp" %>

  <!-- 오른쪽 중앙 정렬된 콘텐츠 영역 -->
  <div class="centered-form">
    <form action="${cp}/mypage/edit" method="post" class="profile-form">
      <!-- 프로필 이미지 -->
      <div class="text-center mb-4">
        <img src="https://placehold.co/80" class="rounded-circle" alt="프로필 이미지">
      </div>

      <!-- 닉네임 -->
      <div class="mb-3">
        <label for="nickname" class="form-label">닉네임</label>
        <input type="text" class="form-control" id="nickname" name="nickname" value="${member.nickname}">
      </div>

      <!-- 휴대폰 번호 -->
      <div class="mb-3">
        <label for="phone" class="form-label">휴대폰 번호</label>
        <input type="text" class="form-control" id="phone" name="phone" value="${member.phone}">
      </div>

      <!-- 성별 선택 -->
		<div class="mb-3">
		  <label class="form-label">성별</label>
		  <br>
		  <div class="d-flex justify-content-center">
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="gender" id="male" value="MALE" <c:if test="${member.gender == 'MALE'}">checked</c:if>>
		    <label class="form-check-label" for="male">남</label>
		  </div>
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="gender" id="female" value="FEMALE" <c:if test="${member.gender == 'FEMALE'}">checked</c:if>>
		    <label class="form-check-label" for="female">여</label>
		  </div>
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="gender" id="unspecified" value="UNSPECIFIED"  <c:if test="${member.gender == 'UNSPECIFIED' or empty member.gender}">checked</c:if>>
		    <label class="form-check-label" for="unspecified">비공개</label>
		  </div>
		  </div>
		</div>

      <!-- 이메일 -->
      <div class="mb-3">
        <label for="email" class="form-label">이메일</label>
        <input type="email" class="form-control" id="email" name="email" value="${member.email}" disabled>
      </div>

      <!-- 사용자 인증 버튼 -->
      <div class="mb-3">
        <label class="form-label d-block">이메일 인증</label>
        <c:if test="${not member.emailVerified}">
        <button type="button" class="btn btn-dark w-100" id="sendVerifyBtn">이메일 인증을 해주세요</button>
        </c:if>
        <c:if test="${member.emailVerified}">
        <button type="button" class="btn btn-dark w-100" id="sendVerifyBtn" disabled>이메일 인증이 완료되었습니다</button>
        </c:if>
      </div>

      <!-- 저장 버튼 -->
      <div class="mb-3">
        <button type="submit" class="btn btn-primary w-100" >저장하기</button>
      </div>
      
      <input type="hidden" name="memberId" value="${member.memberId}">	
      <input type="hidden" name="memberId" value="${member.email}">	
      
    </form>
  </div>
</main>

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
<%@ include file="../common/footer.jsp" %>
</body>
</html>