<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">


<head>
<meta charset="UTF-8">
<title>카테고리 카드 리스트 불러오기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body class="p-4">

	<div class="container p-0">
		<main>


<div class="row row-cols-1 row-cols-md-4 g-4 mb-4">
				<!-- 카드형  -->
</div>


<!-- 페이지 번호 -->
<ul class="pagination justify-content-center pt-4">
	<c:if test="${pageDto.doubleLeft}">
		<li class="page-item"><a class="page-link"
			href="list?page=1&${pageDto.cri.qs}"><i
				class="fa-solid fa-angles-left"></i></a></li>
	</c:if>

	<c:if test="${pageDto.left}">
		<li class="page-item"><a class="page-link"
			href="list?page=${pageDto.start-1}&${pageDto.cri.qs}"><i
				class="fa-solid fa-angle-left"></i></a></li>
	</c:if>

	<c:forEach begin="${pageDto.start}" end="${pageDto.end}" var="i">
		<li class="page-item ${pageDto.cri.page == i ? 'active' : ''}"><a
			class="page-link" href="list?page=${i}&${pageDto.cri.qs}">${i}</a></li>
	</c:forEach>

	<c:if test="${pageDto.right}">
		<li class="page-item"><a class="page-link"
			href="list?page=${pageDto.end+1}&${pageDto.cri.qs}"><i
				class="fa-solid fa-angle-right"></i></a></li>
	</c:if>

	<c:if test="${pageDto.doubleRight}">
		<li class="page-item"><a class="page-link"
			href="list?page=${pageDto.realEnd}&${pageDto.cri.qs}"><i
				class="fa-solid fa-angles-right"></i></a></li>
	</c:if>
</ul>

<!-- 페이지 번호 -->
<p>pageDto: ${pageDto}</p>
<p>pageDto.total: ${pageDto.total}</p>
<p>cards.size: ${fn:length(cards)}</p>
		</main>
	</div>

</body>
</html>
