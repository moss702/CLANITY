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
    <form action="${cp}/member/update" method="post" class="profile-form">
      <!-- 프로필 이미지 -->
      <div class="text-center mb-4">
        <img src="https://placehold.co/80" class="rounded-circle" alt="프로필 이미지">
      </div>

      <!-- 닉네임 -->
      <div class="mb-3">
        <label for="nickname" class="form-label">닉네임</label>
        <input type="text" class="form-control" id="nickname" name="nickname" value="Classmate975830h">
      </div>

      <!-- 휴대폰 번호 -->
      <div class="mb-3">
        <label for="phone" class="form-label">휴대폰 번호</label>
        <input type="text" class="form-control" id="phone" name="phone" value="01054614223">
      </div>

      <!-- 성별 선택 -->
      <div class="mb-3">
        <label class="form-label">성별</label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gender" id="male" value="MALE">
          <label class="form-check-label" for="male">남</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gender" id="female" value="FEMALE">
          <label class="form-check-label" for="female">여</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gender" id="private" value="NONE" checked>
          <label class="form-check-label" for="private">비공개</label>
        </div>
      </div>

      <!-- 이메일 -->
      <div class="mb-3">
        <label for="email" class="form-label">이메일</label>
        <input type="email" class="form-control" id="email" name="email" value="${member.email}" readonly>
      </div>

      <!-- 사용자 인증 버튼 -->
      <div class="mb-3">
        <label class="form-label d-block">사용자 인증</label>
        <button type="button" class="btn btn-dark w-100" id="sendVerifyBtn">인증을 해주세요</button>
      </div>

      <!-- 저장 버튼 -->
      <div class="mb-3">
        <button type="submit" class="btn btn-secondary w-100" disabled>저장하기</button>
      </div>
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
</body>
</html>