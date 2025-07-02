<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>클래니티 - 결제</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body class="bg-light">

  <main class="container py-5">
    <h3 class="mb-4 fw-bold text-body">🧾 클래스 결제 페이지</h3>
    <div class="row g-4">
      <!-- 왼쪽 영역 -->
      <div class="col-md-6">
        <div class="border rounded p-4 bg-white mb-4">
          <h5 class="fw-semibold mb-3 text-body">클래스 티켓 정보</h5>
          <img src="https://cdn.clanity.kr/class-image.png" alt="클래스 이미지" class="img-fluid rounded mb-3">
          <ul class="list-unstyled text-secondary">
            <li><strong class="text-dark">클래스 유형</strong><br>원데이 클래스</li>
            <li class="mt-3"><strong class="text-dark">클래스 명</strong><br>[홍대/연남]초보자도 고퀄리티 그림을 완성하는 아크릴 원데이클래스</li>
            <li class="mt-3"><strong class="text-dark">일시</strong><br>2025년 6월 29일, 오후 02:00 ~ 오후 04:00</li>
            <li class="mt-3"><strong class="text-dark">장소</strong><br>서울특별시 마포구 연남동 387-11</li>
          </ul>
        </div>

        <div class="border rounded p-4 bg-white">
          <h5 class="fw-semibold mb-3 text-body">연락처 입력 <span class="text-muted fs-6">(문자/이메일 알림 발송)</span></h5>
          <p><strong class="text-dark">계정 ID</strong><br>kysy0000@naver.com</p>
          <p><strong class="text-dark">이름 (닉네임)</strong><br>사랑</p>
          <p><strong class="text-dark">전화번호</strong><br>01031441760</p>
          <button class="btn btn-outline-secondary btn-sm">연락처 수정</button>
        </div>
      </div>

      <!-- 오른쪽 영역 -->
      <div class="col-md-6">
        <div class="border rounded p-4 bg-white mb-4">
          <h5 class="fw-semibold mb-3 text-body">취소 및 환불 안내</h5>

          <div class="accordion" id="refundAccordion">
            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseInfo">
                  결제 안내
                </button>
              </h2>
              <div id="collapseInfo" class="accordion-collapse collapse" data-bs-parent="#refundAccordion">
                <div class="accordion-body">
                  <ul>
                    <li>결제 완료 시 온라인 티켓이 발행되며, 마이페이지에서 확인할 수 있습니다.</li>
                    <li>결제 후 티켓은 등록된 연락처로 발송됩니다.</li>
                    <li>문제 발생 시 카카오톡 <span style="color:#E63946;">'클래니티 문의'</span> 채널로 문의해 주세요.</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <h6 class="fw-bold mt-4">1. 날짜 별 취소 및 환불 정책</h6>
          <table class="table table-bordered">
            <thead class="table-light">
              <tr><th>취소 시점</th><th>환불 비율</th></tr>
            </thead>
            <tbody>
              <tr><td>결제 후 1시간 이내 취소</td><td>100% 환불</td></tr>
              <tr><td>클래스 4일 이전 취소</td><td>100% 환불</td></tr>
              <tr><td>클래스 3일 전 취소</td><td>70% 환불</td></tr>
              <tr><td>클래스 2일 전 취소</td><td>50% 환불</td></tr>
              <tr><td>클래스 하루 전 또는 당일 취소</td><td class="text-danger">환불 불가</td></tr>
            </tbody>
          </table>

          <h6 class="fw-bold mt-4">2. 취소 방법</h6>
          <ul>
            <li>마이페이지 > 예약 내역에서 직접 취소 가능</li>
            <li>카카오톡 <span class="text-secondary">모카클래스</span> 채널로 문의 가능</li>
          </ul>
        </div>

        <div class="border rounded p-4 bg-white">
          <h5 class="fw-semibold mb-3 text-body">결제 정보</h5>
          <p><strong>원데이 클래스 수강권 1매</strong> <span class="float-end">30,000원 x 1명</span></p>
          <p class="text-end">소계 <strong>30,000원</strong></p>
          <hr>
          <div class="d-flex justify-content-between align-items-center">
            <span><strong>쿠폰</strong></span>
            <span class="text-muted">사용 가능 쿠폰 : 0개</span>
          </div>
          <div class="d-flex justify-content-end my-2">
            <button class="btn btn-outline-secondary btn-sm">쿠폰 적용</button>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <span><strong>크레딧</strong></span>
            <span class="text-muted">보유 : 0원</span>
          </div>
          <div class="d-flex gap-2 my-2">
            <input type="text" class="form-control text-end" placeholder="0원">
            <button class="btn btn-outline-secondary btn-sm">전체 사용</button>
          </div>
          <div class="d-flex justify-content-between fw-bold fs-5">
            <span>총 결제 금액</span>
            <span>30,000원</span>
          </div>
          <a href="${pageContext.request.contextPath}/paymentModule" class="text-decoration-none text-dark">
          <button class="btn w-100 mt-3 text-white" style="background-color: #E63946; border-color: #E63946;">결제하기</button></a>
        </div>
      </div>
    </div>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
