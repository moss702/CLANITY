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
      <div class="d-flex justify-content-between align-items-center mb-3 flex-wrap">
        <h2 class="h5">사업자 전환 신청 목록</h2>
        <button class="btn btn-danger btn-sm">📕 가이드 확인하기</button>
      </div>

      <div class="card">
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-3 flex-wrap">
            <h5 class="card-title mb-0">신청 목록</h5>
            <div class="d-flex flex-wrap gap-2">
              <button class="btn btn-primary btn-sm">전체</button>
              <button class="btn btn-primary btn-sm">대기중</button>
              <button class="btn btn-outline-secondary btn-sm">Import members</button>
              <button class="btn btn-outline-secondary btn-sm">Export members (Excel)</button>
              <button class="btn btn-outline-secondary btn-sm">Filter</button>
            </div>
          </div>
          <div class="table-responsive">
            <table class="table table-hover align-middle">
              <thead class="table-light">
              <tr>
                <th>NickName</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Status</th>
                <th>allow</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>George Lindelof</td>
                <td>+4 315 23 62</td>
                <td>carlsen@armand.no</td>
                <td><span class="badge bg-success">Active</span></td>
                <td>
                  <a href="#" class="me-2 text-decoration-none"><i class="bi bi-box-arrow-up-right"></i></a>
                  <a href="#" class="me-2 text-decoration-none"><i class="bi bi-pencil"></i></a>
                  <a href="#" class="text-decoration-none"><i class="bi bi-trash"></i></a>
                </td>
                <td><button class="btn btn-sm btn-outline-primary">Login</button></td>
              </tr>
              <!-- 반복 데이터가 들어갈 부분 -->
              </tbody>
            </table>
          </div>

          <div class="d-flex justify-content-end mt-2 text-muted small">
            Total members: <strong>2000</strong>, Current used: <strong>1800</strong>
          </div>
        </div>
      </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        // 첨부파일 토글 버튼
        $(".btn-files").on("click", function () {
            const $row = $(this).closest("tr"); // 현재 버튼이 포함된 신청자 row
            const $next = $row.next(".attach-row"); // 바로 다음 .attach-row를 찾음

            // toggle 효과
            $next.stop().slideToggle(200);
        });
    });
</script>
</body>
</html>