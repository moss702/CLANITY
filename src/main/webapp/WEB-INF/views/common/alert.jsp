<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/head.jsp" %> <%-- Bootstrap, jQuery 포함되어야 함 --%>
<body>
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
</body>