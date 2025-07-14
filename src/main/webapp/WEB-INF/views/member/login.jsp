<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<%@ include file="../common/head.jsp" %>
    <style>
        .login-container {
            max-width: 400px;
            margin: 60px auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .icon-input {
            position: relative;
        }

        .icon-input .fa-user,
        .icon-input .lockicon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }

        .icon-input .fa-eye, .icon-input .fa-eye-slash {
			position: absolute;
			right: 15px;
			top: 50%;
			transform: translateY(-50%);
			color: #999;
		}

        .icon-input .fa-eye:hover {
            cursor: pointer;
        }


        .icon-input input {
            padding-left: 2.5rem;
        }

        .login-btn {
            width: 100%;
            background-color: #e0e0e0;
            border: none;
            color: #333;
        }

        .login-btn:hover {
            background-color: #ccc;
        }

        .small-link {
            font-size: 0.9rem;
            text-align: right;
            margin-top: 0.5rem;
        }

        .bottom-text {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }

        .bottom-text a {
            font-weight: bold;
            text-decoration: none;
        }

        .bottom-text a:hover {
            text-decoration: underline;
        }

        body {
            background-color: #f8f9fa;
        }
    </style>
</head>

<body>

    <div class="container p-0">
        <div class="login-container">
            <div class="text-center mb-4">
                <h4>로그인</h4>
            </div>

            <form class="login-form" action="${cp}/member/login" method="post">
                <div class="mb-3 icon-input">
                    <i class="fa fa-user"></i>
                    <input type="text" class="form-control" name="email" placeholder="이메일">
                </div>
                

                <div class="mb-3 icon-input my-0">
				<i class="fa fa-lock lockicon"></i> <input type="password"
					class="form-control" name="password" id="password"
					placeholder="비밀번호">
					<i class="fa fa-eye pe-auto toggle-password small"></i>
			</div>

                <button type="submit" class="btn login-btn">로그인</button>

                <div class="small-link">
                    <a href="#">비밀번호 재설정</a>
                </div>

                <div class="bottom-text">
                    아직 회원이 아니신가요? <a href="${cp}/member/register">회원가입</a>
                </div>
            </form>
        </div>
    </div>
    
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

        $(function () {
        	$(".toggle-password")
			.on(
					"click",
					function() {
						const $input = $(this).siblings("input");
						const type = $input.attr("type") === "password" ? "text"
								: "password";
						$input.attr("type", type);
						$(this)
								.toggleClass(
										"fa-eye fa-eye-slash");
					});
            
           	
        });
        
        
    </script>
</body>

</html>