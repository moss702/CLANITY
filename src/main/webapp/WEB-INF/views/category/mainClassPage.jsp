<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>클래니티</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">

  <!-- Bootstrap, FontAwesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body class="d-flex flex-column min-vh-100" style="font-family: 'Noto Sans', sans-serif;">

<%@ include file="../common/header.jsp" %>

<main class="container flex-grow-1 py-5">
  <!-- 배너 -->
  <div class="mb-4">
    <img src="https://placehold.co/1200x200" class="img-fluid rounded" alt="배너">
  </div>

  <!-- 필터 버튼 -->
  <div class="mb-4 d-flex flex-wrap gap-2">
    <button class="btn btn-outline-danger rounded-pill">날짜 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">지역 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">나이 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">정원 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">카테고리 <i class="fa-solid fa-caret-down ms-1"></i></button>
    <button class="btn btn-outline-danger rounded-pill">유형 <i class="fa-solid fa-caret-down ms-1"></i></button>
  </div>

  <!-- 카드 리스트 -->
  
</main>

<%@ include file="../common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
