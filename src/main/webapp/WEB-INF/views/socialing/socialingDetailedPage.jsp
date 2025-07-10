<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>소셜링 결제</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <%@ include file="../common/header.jsp" %>

  <main class="container" style="max-width: 1200px;">
    <h3 class="fw-bold text-danger mb-4">소셜링 결제 페이지</h3>

    <div class="row g-4">
      <!-- 좌측 -->
      <div class="col-lg-7">
        <div class="bg-white border rounded-3 p-4 mb-4">
          <h5 class="fw-bold mb-3">소셜링 티켓 정보</h5>
          <img class="img-fluid rounded mb-3" src="https://images.munto.kr/production-socialing/1749734559696-photo-5f7et-471758-0" alt="썸네일">
          <p class="fw-semibold mb-1">[홍대] 편하게 영화 같이 보기 소셜링</p>
          <ul class="text-muted small mb-0">
            <li><strong>일시:</strong> 2025년 7월 15일 (토) 오후 3시 ~ 6시</li>
            <li><strong>장소:</strong> 서울시 마포구 CGV 홍대</li>
            <li><strong>주최자:</strong> 오픈클래스</li>
          </ul>
        </div>

        <div class="bg-white border rounded-3 p-4 mb-4">
          <h5 class="fw-bold mb-3">연락처 입력 <span class="text-muted small">(문자/이메일 알림 발송)</span></h5>
          <p class="mb-2 small text-muted">계정 ID (알림 메일이 발송됩니다)</p>
          <p class="mb-2">ssr@naver.com</p>
          <p class="mb-2 small text-muted">이름</p>
          <p class="mb-2">사랑</p>
          <p class="mb-2 small text-muted">전화번호</p>
          <p class="mb-2">010-0000-0000</p>
          <button class="btn btn-outline-secondary btn-sm mt-2">연락처 수정</button>
        </div>

        <div class="bg-white border rounded-3 p-4 mb-4">
          <h5 class="fw-bold mb-3">취소 및 환불 안내</h5>
          <table class="table table-bordered text-center mb-3">
            <thead class="table-light">
              <tr>
                <th>환불 기준</th>
                <th>환불율</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>결제 후 1시간 이내 취소</td>
                <td>100% 환불</td>
              </tr>
              <tr>
                <td>소셜링 4일 전까지 취소</td>
                <td>100% 환불</td>
              </tr>
              <tr>
                <td>소셜링 3일 전까지 취소</td>
                <td>70% 환불</td>
              </tr>
              <tr>
                <td>소셜링 2일 전까지 취소</td>
                <td>50% 환불</td>
              </tr>
              <tr class="table-warning">
                <td>소셜링 하루 전 또는 당일</td>
                <td class="text-danger">환불 불가</td>
              </tr>
            </tbody>
          </table>
          <ul class="small text-muted mb-0">
            <li>‘수강 취소’ 버튼 클릭 시 자동 처리됩니다.</li>
            <li>환불은 최대 3일 이내 처리됩니다.</li>
          </ul>
        </div>
      </div>

      <!-- 우측 -->
      <div class="col-lg-5">
        <div class="bg-white border rounded-3 p-4 mb-4">
          <h5 class="fw-bold mb-3">결제 안내</h5>
          <ul class="small text-muted">
            <li>티켓은 결제 후 마이페이지에서 확인 가능합니다.</li>
            <li>등록된 연락처로 모임 알림이 발송됩니다.</li>
            <li>카카오톡 '클래니티' 또는 문의하기 통해 도움 받을 수 있습니다.</li>
          </ul>
        </div>

        <div class="bg-white border rounded-3 p-4 mb-4">
          <h5 class="fw-bold mb-3">결제 정보</h5>
          <div class="d-flex justify-content-between mb-2">
            <span>소셜링 티켓 x 1</span><span>15,000원</span>
          </div>
          <hr>
          <div class="mb-2">
            <label class="form-label small">쿠폰 코드</label>
            <div class="input-group">
              <input class="form-control" type="text" placeholder="보유 시 입력" />
              <button class="btn btn-outline-secondary">적용</button>
            </div>
          </div>
          <div class="mb-2">
            <label class="form-label small">크레딧 사용</label>
            <div class="input-group">
              <input class="form-control text-end" type="number" value="0" />
              <button class="btn btn-outline-dark">전체 사용</button>
            </div>
          </div>
          <hr />
          <div class="d-flex justify-content-between fw-bold fs-5">
            <span>총 결제 금액</span>
            <span class="text-danger">15,000원</span>
          </div>
          <div class="d-grid mt-3">
            <button class="btn btn-danger btn-lg">결제하기</button>
          </div>
        </div>
      </div>
    </div>
  </main>

  <%@ include file="../common/footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>