<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>클래니티 - 결제</title>
  <%@ include file="../common/head.jsp"%>
</head>

<body class="bg-light">
<%@ include file="../common/header.jsp"%>
  <main class="container py-5">
    <h3 class="mb-4 fw-bold text-body">🧾 클래스 결제 페이지</h3>
    <div class="row g-4">
      <!-- 왼쪽 영역 -->
      <div class="col-md-6">
        <div class="border rounded p-4 bg-white mb-4">
          <h5 class="fw-semibold mb-3 text-body">클래스  정보</h5>
            <img src="https://ssr0116.s3.ap-northeast-2.amazonaws.com/clanity/${detailInfo.attachs[0].path}/${detailInfo.attachs[0].origin}" class="img-thumbnail" style="object-fit: cover; width: 100%; height: 100%" alt="상세 이미지">
          <ul class="list-unstyled text-secondary">
            <li class="mt-3"><strong class="text-dark">클래스 명</strong><br>${detailInfo.title}</li>
          </ul>
        </div>

        <div class="border rounded p-4 bg-white">
          <p><strong class="text-dark">계정 ID</strong><br>${member.email}</p>
          <p><strong class="text-dark">이름 (닉네임)</strong><br>${member.nickname}</p>

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
          </ul>
        </div>
        
        <form action="${cp}/classEnrollPage" method="post" >

        <div class="border rounded p-4 bg-white">
          <h5 class="fw-semibold mb-3 text-body">결제 정보</h5>
          <p><strong>원데이 클래스 수강권 </strong> 
          <hr>
          <div class="d-flex justify-content-between fw-bold fs-5">
            <span>총 결제 금액</span>
          </div>
          ${detailInfo.classId}
          ${detailInfo.openId}
          ${member.memberId}
          <input type="hidden" name="classId" value="${detailInfo.classId}" />
          <input type="hidden" name="openId" value="${detailInfo.openId}" />
          <input type="hidden" name="memberId" value="${member.memberId}" />
          <button class="btn w-100 mt-3 text-white" type="submit" style="background-color: #E63946; border-color: #E63946;">결제하기</button>
        </div>
        </form>
      </div>
    </div>
  </main>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
