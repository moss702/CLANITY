<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/head.jsp" %> <%-- Bootstrap, jQuery 포함되어야 함 --%>
<body>


<script>
  $(function () {
    iziToast.show({
      title: '알림',
      message: '${msg}',
      position: 'topCenter',
      close: false,
      timeout: false, // 수동 확인
      color: 'red', // 다른 색상: red, green, yellow, etc.
      buttons: [
        ['<button>확인</button>', function (instance, toast) {
          window.location.href = '${url}';
        }]
      ]
    });
  });
</script>

</body>