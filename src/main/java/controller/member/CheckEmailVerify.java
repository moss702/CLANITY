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

		String token = req.getParameter("token");

		if (token == null || token.isEmpty()) {
			resp.sendRedirect(req.getContentType() + "/index");
			// 유효하지 않거나 만료됨
			return;
		}

		String redisKey = "email_verify:" + token;
		String memberKey = RedisUtil.get(redisKey);

		if (memberKey == null) { //
			resp.sendRedirect(req.getContentType() + "/indx");
			return;
		}

		// db 업데이트

//		boolean updated = MemberService.updateEmailVerified(null);

		// 키 재사용 가능성 차단
		RedisUtil.delete(redisKey);

		if (true) {
			resp.sendRedirect(req.getContextPath() + "/index.jsp");
		} else {
			resp.sendRedirect(req.getContextPath() + "/error/verifyFailed.jsp");
		}

	}
}
