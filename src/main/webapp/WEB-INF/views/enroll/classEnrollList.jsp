<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp" />
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="container mt-5">
        <h3 class="mb-4">📌 클래스 신청자 목록</h3>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach var="c" items="${enrollList}">
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="${thumbnailImages}" class="card-img-top" alt="${title}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">${title}</h5>
                            <p class="card-text">
                                <strong>클래스 ID:</strong> ${classId}<br/>
                                <strong>오픈 ID:</strong> ${openId}<br/>
                                <strong>신청 ID:</strong> ${enrollId}<br/>
                                <strong>회원 ID:</strong> ${memberId}<br/>
                                <strong>신청일:</strong> <fmt:formatDate value="${c.enrolledAt}" pattern="yyyy-MM-dd"/>
                            </p>
                            <c:choose>
                                <c:when test="${c.status}">
                                    <span class="badge bg-success">신청 완료</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger">취소</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   
</body>
</html>
