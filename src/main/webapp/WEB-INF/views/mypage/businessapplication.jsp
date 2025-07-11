<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/head.jsp" %>
    <style>
        .centered-form {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 90vh;
            flex: 1;
        }

        .business-form {
            width: 100%;
            max-width: 720px;
            padding: 2rem;
            background-color: #f8f9fa;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<main class="d-flex" style="min-height: 100vh;">
    <%@ include file="./mypageSidebar.jsp" %>

    <!-- 오른쪽 중앙 정렬된 콘텐츠 영역 -->
    <div class="centered-form">
        <form action="${cp}/mypage/application" method="post" id="writeForm" class="business-form">
            <h4 class="text-center mb-4">CLANITY 사업자 신청 안내</h4>

            <div class="mb-3">
                <p class="mb-2">CLANITY 플랫폼에서는 원데이 클래스 또는 정기적인 활동을 제공하시는
                    <strong>사업자 및 전문가 여러분의 신청</strong>을 받고 있습니다.
                </p>
                <div class="alert alert-warning small" role="alert">
                    <strong>다음 문서를 첨부해주세요:</strong>
                    <ul class="mb-0">
                        <li>사업자 등록증 사본</li>
                        <li>자격을 증명할 수 있는 서류 (선택)</li>
                    </ul>
                </div>
                <p class="text-muted mb-1">
                    신청 후, 관리자의 확인 절차가 진행되며 <strong>승인까지는 시간이 소요</strong>될 수 있습니다.
                </p>
                <p class="text-muted mb-0">
                    문의 사항은 <strong>관리자 이메일 또는 1:1 문의</strong>를 이용해주세요.
                </p>
            </div>

            <div class="text-center fst-italic text-secondary my-3">
                “당신의 재능을 세상과 나누는 가장 쉬운 방법, CLANITY와 함께 시작하세요.”
            </div>

            <input type="hidden" name="memberId" value="${member.memberId}"/>
            <input type="hidden" name="email" value="${member.email}"/>
            <input type="hidden" name="nickname" value="${member.nickname}"/>
            <input type="hidden" name="encodedStr"/>

            <!-- 파일 비동기 업로드 영역 -->
            <div class="d-grid my-2 attach-area">
                <div class="small my-1 border-bottom border-1 border-muted p-0 pb-2">
                    <i class="fa-solid fa-paperclip"></i> 첨부파일
                </div>
                <label class="btn btn-info">파일 첨부<input type="file" multiple class="d-none" id="f1"></label>
                <ul class="list-group my-2 attach-list"></ul>
                <div class="row justify-content-around w-75 mx-auto attach-thumb"></div>
            </div>

            <button type="submit" class="btn btn-primary w-100">신청 제출</button>
        </form>
    </div>
</main>

<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
    $(function () {
        $(".attach-list").sortable();

        function validateFiles(files) {
            const MAX_COUNT = 5;
            const MAX_FILE_SIZE = 10 * 1024 * 1024;
            const MAX_TOTAL_SIZE = 50 * 1024 * 1024;
            const BLOCK_EXT = ['exe', 'sh', 'jsp', 'java', 'class', 'html', 'js'];

            if (files.length > MAX_COUNT) {
                alert('파일은 최대 5개만 업로드 가능합니다');
                return false;
            }

            let totalSize = 0;
            const isValid = files.every(f => {
                const ext = f.name.split(".").pop().toLowerCase();
                totalSize += f.size;
                return !BLOCK_EXT.includes(ext) && f.size <= MAX_FILE_SIZE;
            }) && totalSize <= MAX_TOTAL_SIZE;

            if (!isValid) {
                alert('다음 파일 확장자는 업로드가 불가합니다.\n - [exe, sh, jsp, java, class, html, js] \n또한 각 파일은 10MB 이하, 전체 합계는 50MB 이하여야 합니다.');
            }

            return isValid;
        }

        $(".attach-area").on("click", "i", function () {
            const uuid = $(this).closest("[data-uuid]").data("uuid");
            $('[data-uuid="' + uuid + '"]').remove();
        });

        $("#f1").change(function (event) {
            event.preventDefault();
            const formData = new FormData();
            const files = this.files;

            for (let i = 0; i < files.length; i++) {
                formData.append("f1", files[i]);
            }

            if (!validateFiles([...files])) return;

            $.ajax({
                url: '${cp}/upload',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    let str = "";
                    let thumbStr = "";

                    for (let a of data) {
                        str += `<li class="list-group-item d-flex align-items-center justify-content-between"
              data-uuid="\${a.uuid}"
              data-origin="\${a.origin}"
              data-image="\${a.image}"
              data-path="\${a.path}"
              data-odr="\${a.odr}"
              data-size="\${a.size}">
              <a href="${cp}/download?uuid=\${a.uuid}&origin=\${a.origin}&path=\${a.path}">\${a.origin}</a>
              <i class="fa-solid fa-xmark float-end text-danger"></i>
            </li>`;

                        if (a.image) {
                            thumbStr += `<div class="my-2 col-12 col-sm-4 col-lg-2" data-uuid="\${a.uuid}">
                <div class="my-2 bg-primary" style="height: 150px; background-size: cover;
                background-image:url('${cp}/display?uuid=t_\${a.uuid}&path=\${a.path}')">
                  <i class="fa-solid fa-xmark float-end text-danger m-2"></i>
                </div>
              </div>`;
                        }
                    }

                    $(".attach-list").html(str);
                    $(".attach-thumb").html(thumbStr);
                }
            });
        });

        $("#writeForm").submit(function (event) {
            event.preventDefault();
            const data = [];
            $(".attach-list li").each(function () {
                const file = {...this.dataset};
                data.push(file);
            });

            data.forEach((item, idx) => item.odr = idx);
            $("[name='encodedStr']").val(JSON.stringify(data));
            this.submit();
        });
    });
</script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
