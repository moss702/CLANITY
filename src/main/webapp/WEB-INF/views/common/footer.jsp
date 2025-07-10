<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="bg-light border-end mt-auto py-5">
    <div class="container">
      <div class="row text-muted small">
         
        <!-- 정보 -->
        <div class="col-md-4 mb-4">
          <h6 class="fw-semibold text-dark">클래니티 정보</h6> 
          <ul class="list-unstyled mt-3">
            <li><a href="#" class="text-decoration-none text-dark">공지사항</a></li>
            <li><a href="#" class="text-decoration-none text-dark">이벤트</a></li>
            <li><a href="${cp}/faq" class="text-decoration-none text-dark">자주 묻는 질문</a></li>
            <li><a href="${cp}/qna" class="text-decoration-none text-dark">고객센터 문의하기</a></li>
          </ul>
        </div>

        <!-- 소셜 -->
        <div class="col-md-4 mb-4">
          <h6 class="fw-semibold text-dark">소셜 미디어</h6>
          <ul class="list-unstyled mt-3">
            <li><a href="${cp}/board/list" class="text-decoration-none text-dark"><i class="fa-brands fa-instagram"></i></a></li>
            <li><a href="${cp}/board/write" class="text-decoration-none text-dark">네이버 블로그</a></li>
          </ul>
        </div>

        <!-- 회사정보 -->
        <div class="col-md-4">
          <h6 class="fw-semibold text-dark">주식회사 클래니티</h6>
          <p class="mt-3 mb-1">대표: 다모아 | 개인정보관리책임자: 다모아</p>
          <p class="mb-1">사업자등록번호: 000-00-00000 | 통신판매: 제2025-서울구로-0622</p>
          <p class="mb-1">이메일: clanity@clanity.kr | 대표번호: 000-0000-0000</p>
          <p class="mb-1">주소: 서울 구로구 디지털로 306</p>
          <p class="mb-3">고객센터: @카카오톡채널 | 운영시간: (월~일) 오전 10:00 ~ 오후 5:00</p>
          <div class="d-flex gap-2">
            <a href="${cp}/provision/termsOfUse" class="text-decoration-none text-dark">이용약관</a> |
            <a href="${cp}/provision/termsPersonal" class="text-decoration-none text-dark">개인정보처리방침</a> |
            <a href="${cp}/provision/information" class="text-decoration-none text-dark">사업자정보확인</a>
          </div>
        </div>

      </div>
    </div>
  </footer>
<%
  String toastMsg = (String) session.getAttribute("toastMsg");
  String toastColor = (String) session.getAttribute("toastColor");
  if (toastMsg != null) {
    session.removeAttribute("toastMsg");
    session.removeAttribute("toastColor");
%>
  <script>
    iziToast.show({
      title: '알림',
      message: '<%= toastMsg %>',
      position: 'topCenter',
      timeout: 3000,
      color: '<%= toastColor != null ? toastColor : "blue" %>'
    });
  </script>
<%
  }
%>
<script>
  $(function() {
    const params = new URLSearchParams(window.location.search);
    const msg = params.get("msg");

    if (msg === "success") {
      alert("✅ 이메일 인증에 성공했습니다.");
    } else if (msg === "fail") {
      alert("❌ 유효하지 않거나 만료된 토큰입니다.");
    }
  });
</script>
