<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/head.jsp" %>
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
        <%@ include file="admin_sidebar.jsp" %>

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
                            <button class="btn btn-primary btn-sm filter-btn" data-filter="all">전체</button>
                            <button class="btn btn-primary btn-sm filter-btn" data-filter="pending">대기중</button>
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
                                <th>Email</th>
                                <th>Status</th>
                                <th>첨부</th>
                                <th>허가</th>
                                <th>거절</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="apply-row" data-status="PENDING">
                                <td>홍길동</td>
                                <td>gildong@example.com</td>
                                <td><span class="badge bg-warning">PENDING</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary btn-files">첨부파일</button>
                                </td>
                                <td>
                                    <button class="btn btn-sm btn-outline-success btn-approve">허가</button>
                                </td>
                                <td>
                                    <button class="btn btn-sm btn-outline-danger btn-reject">거절</button>
                                </td>
                            </tr>

                            <tr class="attach-row" style="display: none;">
                                <td colspan="6">
                                    <ul class="list-group my-2 attach-list">
                                        <li class="list-group-item d-flex align-items-center justify-content-between"
                                            data-uuid="abc123"
                                            data-origin="사업자등록증.pdf"
                                            data-image=""
                                            data-path="2025/07/11"
                                            data-size="123456"
                                            data-odr="0">
                                            <a href="/CLANITY/download?uuid=abc123&origin=사업자등록증.pdf&path=2025/07/11">
                                                사업자등록증.pdf
                                            </a>
                                        </li>
                                        <li class="list-group-item d-flex align-items-center justify-content-between"
                                            data-uuid="img456"
                                            data-origin="증명사진.jpg"
                                            data-image="true"
                                            data-path="2025/07/11"
                                            data-size="54321"
                                            data-odr="1">
                                            <a href="/CLANITY/download?uuid=img456&origin=증명사진.jpg&path=2025/07/11">
                                                증명사진.jpg
                                            </a>
                                            <img src="/CLANITY/display?uuid=t_img456&path=2025/07/11" class="ms-2"
                                                 style="height:40px; border-radius: 4px;">
                                        </li>
                                    </ul>
                                </td>
                            </tr>

                            <c:forEach var="apply" items="${list}">
                                <!-- 신청 행 -->
                                <tr class="apply-row" data-status="${apply.status}">
                                    <td>${apply.nickname}</td>
                                    <td>${apply.email}</td>
                                    <td>
                <span class="badge
                  <c:choose>
                    <c:when test="${apply.status == 'PENDING'}">bg-warning</c:when>
                    <c:when test="${apply.status == 'APPROVED'}">bg-success</c:when>
                    <c:otherwise>bg-secondary</c:otherwise>
                  </c:choose>">
                        ${apply.status}
                </span>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-secondary toggle-files">첨부파일</button>
                                    </td>
                                </tr>

                                <!-- 첨부파일 리스트 행 (초기 숨김) -->
                                <tr class="attach-row" style="display: none;">
                                    <td colspan="4">
                                        <ul class="list-group my-2 attach-list">
                                            <c:forEach items="${apply.attachs}" var="a">
                                                <li class="list-group-item d-flex align-items-center justify-content-between"
                                                    data-uuid="${a.uuid}"
                                                    data-origin="${a.origin}"
                                                    data-image="${a.image}"
                                                    data-path="${a.path}"
                                                    data-size="${a.size}"
                                                    data-odr="${a.odr}">
                                                    <a href="${pageContext.request.contextPath}/download?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}">
                                                            ${a.origin}
                                                    </a>
                                                    <c:if test="${a.image}">
                                                        <img src="${pageContext.request.contextPath}/display?uuid=t_${a.uuid}&path=${a.path}"
                                                             class="ms-2" style="height:40px; border-radius: 4px;">
                                                    </c:if>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-end mt-2 text-muted small">
                Total members: <strong>2000</strong>, Current used: <strong>1800</strong>
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