<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>클래니티 - 클래스 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f8f9fa;
}
.card-img-top {
	object-fit: cover;
	height: 180px;
}
.category-icon img {
	width: 60px;
	height: 60px;
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<%@ include file="../common/header.jsp"%>

<main class="container py-5 flex-grow-1">

	 <!-- 추천 배너 -->
	<!-- <div id="mainCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F1749630156_pc_main_banner_summersweet.png&w=1920&q=75" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F1749629821_pc_main_banner_summersea.png&w=1920&q=75" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="https://www.munto.kr/_next/image?url=https%3A%2F%2Fimages.munto.kr%2Fproduction-banner%2F17440769269_pc_main_banner_club.png&w=1920&q=75" class="d-block w-100" alt="...">
			</div>
		</div>
	</div> -->

	 
</main>

<%@ include file="../common/footer.jsp"%>
</body>
</html>
