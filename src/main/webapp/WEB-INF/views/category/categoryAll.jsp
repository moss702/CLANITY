<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>CLANITY 카테고리 목록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="font-family: 'Noto Sans', sans-serif;">
  <%@ include file="../common/header.jsp"%>

  <main class="container px-4 py-5">
    <div class="row justify-content-center">
      
      <!-- 사이드바 나중에 카테고리 참고하기 아코디언이나 그런 형식 이용해서 1,2 로 나누기-->
      <aside class="col-md-3 col-lg-2 mb-4">
        <h6 class="fw-bold mb-3">카테고리 전체</h6>
        <ul class="list-group list-group-flush">
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">컨셉파티</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">홈파티</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">내향인파티</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">뮤직파티</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">푸드파티</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">와인파티</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">생일파티</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">포틀럭파티</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">푸드·드링크</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">자기계발</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">N잡·재테크</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">외국어</a></li>
          <li class="list-group-item ps-0 border-0"><a href="#" class="text-decoration-none text-dark">소셜게임</a></li>
        </ul>
      </aside>

 <!--  카드 목록 추가-->
 
  <!-- 카드 리스트 -->
  <c:forEach var="c" items="${cards}">
  
  	<jsp:include page="cardTmp.jsp" />
  
  </c:forEach>
  </div>
  </main>

  <%@ include file="../common/footer.jsp"%>
</body>
</html>
