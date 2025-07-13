<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../common/head.jsp" %>
  <title>강사님께 문의하기</title>
  <link rel="stylesheet" href="${cp}/css/qna_style.css">
</head>

<body>
<c:set var="loginMember" value="${member}"/>
<%@ include file="../common/header.jsp" %>

<c:forEach items="${boardCategories}" var="cat">
	<c:if test="${cat.categoryId == pageDto.cri.categoryId}">
		<c:set value="${cat}" var="c" />
	</c:if>
</c:forEach>

<div class="settings-wrapper container">
	<div class="category-menu">
		<c:forEach items="${boardCategories}" var="cat">
			<c:if test="${cat.type == 'LIST'}">
				<a class="btn pill-btn w-100 my-3" href="${cp}/board/list?categoryId=${cat.categoryId}">${cat.name}</a>
			</c:if>
		</c:forEach>
	</div>

  <!-- 우측 클래스 목록 -->
  <div class="flex-grow-1">
    <div class="section-title">
      <h2>1:1 문의하기</h2>
      <p>궁금한 점이 있다면 언제든 문의해주세요.</p>
      <hr>
    </div> 

    <p>클래스 강사님께 문의하기</p>

    <!-- 클래스 카드 -->
    <div class="class-card">
      <!-- 썸네일 -->
      <div class="thumbnail-wrapper" onclick="location.href='${cp}/oneday/detail?classId=11936'">
        <span class="badge bg-danger text-white badge-status">수강신청중</span>
        <img src="https://placehold.co/160x100" alt="썸네일">
      </div>

      <!-- 정보 -->
      <div class="class-info">
        <div class="class-name" onclick="location.href='${cp}/oneday/detail?classId=11936'">
          수채화 원데이 클래스
        </div>
        <p><strong>클래스 번호:</strong> class-11936</p>
        <p><strong>클래스 가격:</strong> 30,000원</p>
      </div>

      <!-- 버튼 -->
      <div>
        <a href="${cp}/qna?mode=toBusiness&className=수채화 원데이 클래스&classId=11936&teacherId=20001"
           class="btn btn-outline-secondary btn-sm btn-inquire">
          이 클래스로 문의하기
        </a>
      </div>
    </div>

  </div>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
