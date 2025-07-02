package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import util.ParamUtil;

@Slf4j
@WebServlet("/member/register")
public class Register extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("doget 호출확인 겸  로그 호출 확인");
		req.getRequestDispatcher("/WEB-INF/views/member/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		log.info("이메일 값 : {}, 비밀번호 값 : {}", email, password);
		
		//		Member member = ParamUtil.get(req, Member.class); // 파라미터 확인 후 살리기
//		log.info("{}", member);
	}

}
