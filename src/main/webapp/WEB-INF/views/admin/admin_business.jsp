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
                                <button type="button" class="btn btn-primary btn-sm filter-btn" onclick="location.href='?status=all'">전체</button>
                                <button type="button" class="btn btn-primary btn-sm filter-btn" onclick="location.href='?status=PENDING'">대기중</button>
                                <button class="btn btn-outline-secondary btn-sm">Import members</button>
                                <button class="btn btn-outline-secondary btn-sm">Export members (Excel)</button>
                                <button class="btn btn-outline-secondary btn-sm">Filter</button>
                            </div>
                        </div>
                        <%--${applyList}--%>
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

                                <c:forEach var="apply" items="${applyList}">
                                    <tr class="apply-row"
                                        data-status="${apply.status}"
                                        data-apply-id="${apply.applyId}"
                                        data-member-id="${apply.memberId}">
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
                                        <td>
                                            <button class="btn btn-sm btn-outline-success btn-approve"
                                                    data-apply-id="${apply.applyId}">
                                                허가
                                            </button>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-danger btn-reject"
                                                    data-apply-id="${apply.applyId}">
                                                거절
                                            </button>
                                        </td>
                                    </tr>

                                    <tr class="attach-row" style="display: none;">
                                        <td colspan="6">
                                            <ul class="list-group my-2 attach-list"></ul>
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
            $(".toggle-files").on("click", function () {
                const $btn = $(this);
                const $row = $btn.closest("tr");
                const applyId = $row.data("apply-id");
                const $attachRow = $row.next(".attach-row");
                const $list = $attachRow.find(".attach-list");

                if ($attachRow.is(":visible")) {
                    $attachRow.slideUp(200);
                    return;
                }

                if ($list.children().length > 0) {
                    $attachRow.slideDown(200);
                    return;
                }

                // 비동기 요청
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/business/attach",
                    type: "GET",
                    data: { applyId: applyId },
                    dataType: "json",
                    success: function (data) {
                        if (data.length === 0) {
                            $list.append('<li class="list-group-item">첨부파일이 없습니다.</li>');
                        } else {
                            data.forEach(function (a) {
                                const link = `${pageContext.request.contextPath}/download?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}`;
                                const item = $('<li class="list-group-item d-flex align-items-center justify-content-between">')
                                    .append(`<a href="${link}">${a.origin}</a>`);

                                if (a.image) {
                                    const img = `<img src="${pageContext.request.contextPath}/display?uuid=t_${a.uuid}&path=${a.path}" class="ms-2" style="height:40px; border-radius:4px;">`;
                                    item.append(img);
                                }

                                $list.append(item);
                            });
                        }

                        $attachRow.slideDown(200);
                    },
                    error: function () {
                        alert("첨부파일을 불러오는 데 실패했습니다.");
                    }
                });
            });
            });

            // 허가 버튼 클릭 시
            $(".btn-approve").on("click", function () {
                const $row = $(this).closest("tr");
                const applyId = $row.data("apply-id");
                const memberId = $row.data("member-id");

                sendUpdateRequest(applyId, memberId, "APPROVED");
            });

            // 거절 버튼 클릭 시
            $(".btn-reject").on("click", function () {
                const $row = $(this).closest("tr");
                const applyId = $row.data("apply-id");
                const memberId = $row.data("member-id");

                sendUpdateRequest(applyId, memberId, "REJECTED");
            });

            // 비동기 전송 함수
            function sendUpdateRequest(applyId, memberId, status) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/business/status",
                    type: "POST",
                    data: {
                        applyId: applyId,
                        memberId: memberId,
                        status: status
                    },
                    success: function (res) {
                        alert("처리가 완료되었습니다.");
                        location.reload(); // 페이지 새로고침
                    },
                    error: function () {
                        alert("처리에 실패했습니다.");
                    }
                });
            }
        });
    </script>
    </body>
    </html>