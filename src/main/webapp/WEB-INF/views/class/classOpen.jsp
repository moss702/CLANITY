<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>클래스 신청 폼</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="p-4">

    <h2>클래스 신청</h2>

    <form action="${cp}/enroll/class" method="post" class="mt-4">
        <div class="mb-3">
            <label class="form-label">신청 ID (테스트용)</label>
            <input type="text" name="enrollId" class="form-control" value="<%= System.currentTimeMillis() %>" readonly>
        </div>
        
        <div class="mb-3">
            <label class="form-label">클래스 오픈 ID</label>
            <input type="text" name="openId" class="form-control" placeholder="예: 1001" required>
        </div>

        <div class="mb-3">
            <label class="form-label">회원 ID</label>
            <input type="text" name="memberId" class="form-control" placeholder="예: 2001" required>
        </div>

        <button type="submit" class="btn btn-primary">신청하기</button>
    </form>

</body>
</html>
