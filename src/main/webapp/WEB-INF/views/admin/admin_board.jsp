<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp"%>
<style>
    body {
      background-color: #f8f9fa;
    }
    .sidebar {
      min-height: 100vh;
      background-color: #1c1f23;
      color: white;
    }
    .sidebar a {
      color: white;
      text-decoration: none;
    }
    .sidebar .active {
      background-color: #343a40;
    }
    .card-title {
      font-size: 0.95rem;
      font-weight: bold;
    }
  </style>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <%@ include file="admin_sidebar.jsp"%>

    <!-- 메인 콘텐츠 -->
    <div class="col-md-10 p-4">
      <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="h5">게시판 컨텐츠 관리</h2>
        <button class="btn btn-danger btn-sm">📕 가이드 확인하기</button>
      </div>

      <div class="card">
        <div class="card-body">
          <h5 class="card-title">게시물 목록</h5>
          <p>(여기에 게시물 목록 테이블이 표시됩니다.)</p>
        </div>
      </div>

    </div>
  </div>
</div>
</body>
</html>