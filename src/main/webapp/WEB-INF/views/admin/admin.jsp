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
    <!-- 사이드바 -->
    <div class="col-md-2 sidebar p-3">
      <h4 class="text-white mb-4">ABLY Sellers</h4>
      <div class="mb-4">
        <div class="d-flex align-items-center">
          <img src="https://via.placeholder.com/50" class="rounded-circle me-2" alt="profile">
          <strong>포에틱/X</strong>
        </div>
        <button class="btn btn-outline-light btn-sm mt-2 w-100">마켓 링크 복사</button>
      </div>
      <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link active" href="#">대시보드</a></li>
        <li class="nav-item"><a class="nav-link" href="#">광고 관리</a></li>
        <li class="nav-item"><a class="nav-link" href="#">블리스토어 관리</a></li>
        <li class="nav-item"><a class="nav-link" href="#">플레이스 관리</a></li>
        <li class="nav-item"><a class="nav-link" href="#">상품 관리</a></li>
        <li class="nav-item"><a class="nav-link" href="#">마켓 관리</a></li>
        <!-- ...생략 가능 -->
      </ul>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="col-md-10 p-4">
      <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="h5">대시보드</h2>
        <button class="btn btn-danger btn-sm">📕 가이드 확인하기</button>
      </div>

      <div class="row g-3">
        <!-- 판매 현황 -->
        <div class="col-md-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">판매 현황</h5>
              <div class="d-flex justify-content-between mt-3">
                <div>결제 완료<br><strong>0</strong></div>
                <div>상품준비중<br><strong>0</strong></div>
                <div>배송 지연<br><strong>0</strong></div>
                <div>배송 중<br><strong>0</strong></div>
                <div>배송 완료<br><strong>0</strong></div>
              </div>
            </div>
          </div>
        </div>

        <!-- 취소 / 반품 -->
        <div class="col-md-3">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">취소 / 반품 / 정산</h5>
              <ul class="list-unstyled small mt-2">
                <li>취소 진행: 0건</li>
                <li>환불 요청: 0건</li>
                <li>반품 진행: 0건</li>
                <li>환불 요청: 0건</li>
              </ul>
              <div class="mt-2 text-muted small">6월 2차 예상 정산액: 0원</div>
            </div>
          </div>
        </div>

        <!-- 미완료 문의 -->
        <div class="col-md-3">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">미완료 문의</h5>
              <ul class="list-unstyled small mt-2">
                <li>상품 문의: 0건</li>
                <li>배송 변경 / 취소: 0건</li>
                <li>교환 / 반품: 0건</li>
                <li>기타 문의: 0건</li>
              </ul>
            </div>
          </div>
        </div>

        <!-- 기간별 통계 -->
        <div class="col-md-8">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">기간별 통계</h5>
              <div class="d-flex justify-content-between align-items-center mb-2">
                <div>
                  <button class="btn btn-outline-primary btn-sm">주문 금액</button>
                  <button class="btn btn-outline-secondary btn-sm">주문 수</button>
                </div>
                <input type="date" value="2025-05-29"> ~ <input type="date" value="2025-06-28">
                <button class="btn btn-outline-dark btn-sm">다운로드</button>
              </div>
              <div style="height: 200px;" class="bg-light text-center d-flex align-items-center justify-content-center text-muted">
                (차트 영역)
              </div>
              <div class="mt-2 small">
                <span class="me-3"><span class="badge bg-danger">■</span> 자연발생</span>
                <span><span class="badge bg-warning">■</span> 광고유입</span>
              </div>
            </div>
          </div>
        </div>

        <!-- 광고 성과 -->
        <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">광고 성과</h5>
              <ul class="list-unstyled small mt-2">
                <li>광고 전환 매출: 0원</li>
                <li>구매 전환 수: 0건</li>
                <li>소진액: 0원</li>
                <li>ROAS: 데이터 없음</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>