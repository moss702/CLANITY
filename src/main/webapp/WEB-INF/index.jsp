<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="views/common/head.jsp"%>
</head>
<body>

<%@ include file="views/common/header.jsp" %>


<main>
일부러 화면 잠깐 아무것도 안 넣어뒀습니다

<c:if test="${not empty member}">
	<h1>로그인 테스트, 로그인 되었습니다</h1>
	<span> ${member.email} 님 환영합니다</span>
	<a href="${cp}/member/logout">로그아웃</a>
	<a href="${cp}/mypage">마이페이지</a>
	<h3>${member}</h3>
</c:if>
</main>

<%@ include file="views/common/footer.jsp" %>

<script>
  $(function() {
    const params = new URLSearchParams(window.location.search);
    const msg = params.get("msg");

    if (msg === "success") {
      alert("✅ 이메일 인증에 성공했습니다.");
    } else if (msg === "fail") {
      alert("❌ 유효하지 않거나 만료된 토큰입니다.");
    }
  });
</script>

</body>
</html>