<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>등록 실패</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body >
  <div class="container text-center py-5">
    <h1 class="text-danger mb-4">⚠️ 등록 실패</h1>
    <p class="lead"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "예기치 않은 오류가 발생했습니다." %></p>
    <div class="d-flex justify-content-center gap-3 mt-4">
      <a href="<%= request.getContextPath() %>/openClass/open" class="btn btn-danger">다시 시도</a>
      <a href="<%= request.getContextPath() %>/" class="btn btn-outline-secondary">메인 페이지로</a>
    </div>
  </div>
</body>
</html>