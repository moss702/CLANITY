<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>결제 완료 팝업</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-light">

  <!-- Modal -->
  <div class="modal show d-block" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content border rounded-4 p-4">
        <div class="modal-body text-center">
          <i class="fa-solid fa-circle-check mb-3" style="font-size: 2.5rem; color: #28a745;"></i>
          <h5 class="fw-bold mb-2">결제가 완료되었습니다!</h5>
          <p class="text-muted mb-4">신청이 정상적으로 처리되었습니다.</p>
          <div class="d-grid gap-2">
           <a href="${pageContext.request.contextPath}/index" class="text-decoration-none text-dark">
            <button type="button" class="btn btn-outline-secondary">홈으로 가기</button></a>
            <button type="button" class="btn text-white fw-bold" style="background-color: #E63946; border-color: #E63946;">내 예약 확인하기</button>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
	