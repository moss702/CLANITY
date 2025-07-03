<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>클래스 등록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
  <div class="container py-5" style="max-width: 700px;">
    <h3 class="mb-4 text-danger fw-bold">원데이 클래스 등록</h3>
    <form action="${cp}/openClass/open"method="post">
      <div class="mb-3">
        <label for="classId" class="form-label">클래스 ID</label>
        <input type="text" class="form-control" id="classId" name="classId">
      </div>
      <div class="mb-3">
        <label for="businessId" class="form-label">사업자 ID</label>
        <input type="text" class="form-control" id="businessId" name="businessId">
      </div>
      <div class="mb-3">
        <label for="categoryId" class="form-label">카테고리 ID</label>
        <input type="text" class="form-control" id="categoryId" name="categoryId">
      </div>
      <div class="mb-3">
        <label for="title" class="form-label">클래스 제목</label>
        <input type="text" class="form-control" id="title" name="title">
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">설명</label>
        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
      </div>
      <div class="mb-3">
        <label for="duration" class="form-label">소요 시간 (분)</label>
        <input type="text" class="form-control" id="duration" name="duration">
      </div>
      <div class="mb-3">
        <label for="price" class="form-label">가격 (원)</label>
        <input type="text" class="form-control" id="price" name="price">
      </div>
      <div class="d-grid">
        <button type="submit" class="btn btn-danger">등록하기</button>
      </div>
    </form>
  </div>
</body>
</html>
    