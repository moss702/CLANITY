package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import service.MemberService;
import util.RedisUtil;

@Slf4j
@WebServlet("/member/verify")
public class CheckEmailVerify extends HttpServlet {

	// db 접근해야함
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberService memberService = new MemberService();
		
		String token = req.getParameter("token");
		
		if (token == null || token.isEmpty()) {
			resp.sendRedirect(req.getContextPath() + "/index?msg=fail");
			// 유효하지 않거나 만료됨
			return;
		}

		String memberEmail= RedisUtil.get("email_verify:" + token);

		if (memberEmail == null) { //
			resp.sendRedirect(req.getContextPath() + "/index");
			return;
		}

		// db 업데이트 및 성공 여부 출력

		boolean updated = memberService.updateEmailVerified(memberEmail);

		// 토큰 재사용 가능성 차단
		RedisUtil.delete(token);

		if (updated) {
			resp.sendRedirect(req.getContextPath() + "/index?msg=success");
		} else {
			resp.sendRedirect(req.getContextPath() + "/index?msg=fail");
		}

	}
}
