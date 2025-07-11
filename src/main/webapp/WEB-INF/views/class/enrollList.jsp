<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">


<head>
<meta charset="UTF-8">
<title>신청자 조회</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body class="p-4">

<div class="container p-0">
	<main>
		
	<!-- 유저 정보 -->
	<div class="card mb-4">
	    <div class="card-header bg-light fw-bold">신청자 정보</div>
	    <div class="card-body">
	      <p><strong>이름:</strong> ${member.name}</p>
	      <p><strong>이메일:</strong> ${member.email}</p>
	    </div>
	  </div>
	  <!-- 클래스 기본 정보 -->
	  
	  <div class="card mb-4">
    <div class="card-header bg-light fw-bold">클래스 정보</div>
    <div class="card-body">
      <p><strong>제목:</strong> ${detailInfo.title}</p>
      <p><strong>주소:</strong> ${detailInfo.address}</p>
      <p><strong>가격:</strong> <fmt:formatNumber value="${detailInfo.price}"  />원</p>
     <%--  <p><strong>할인가:</strong> <fmt:formatNumber value="${detailInfo.discountPrice}"  />원</p>
      <p><strong>날짜:</strong> ${detailInfo.scheduleDate}</p> --%>
      <p><strong>시간:</strong> ${detailInfo.duration} </p>
      <strong>일시:</strong> ${enroll.scheduleDate} ${enroll.startTime} ~ ${enroll.endTime}<br/>
     <strong>장소:</strong> ${enroll.address}<br/>
     <strong>신청일:</strong> <fmt:formatDate value="${enroll.enrolledAt}" pattern="yyyy-MM-dd" />
    </div>
  </div>
	</main>
</div>

</body>
</html>
