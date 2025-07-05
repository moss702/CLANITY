<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>등록 완료</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container text-center py-5">
    <h1 class="text-success mb-4">🎉 클래스 등록 완료</h1>
    <p class="lead">클래스 ID: <strong><%= request.getAttribute("classId") %></strong></p>
    <div class="d-flex justify-content-center gap-3 mt-4">
      <a href="<%= request.getContextPath() %>/openClass/open" class="btn btn-danger">클래스 추가 등록</a>
      <a href="<%= request.getContextPath() %>/" class="btn btn-outline-secondary">메인 페이지로</a>
    </div>
  </div>
</body>
</html>