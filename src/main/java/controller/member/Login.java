package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import service.MemberService;
import util.AlertUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/member/login")
public class Login extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		log.info("email :{}, password : {}",email, password);
		
		boolean ret = new MemberService().login(email, password);
		
		log.info("{}",ret);
		
		if(ret) {
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(60*30); //세션 유지 30분
			session.setAttribute("member", new MemberService().findByEmail(email));
			
			Member savedMember = (Member) session.getAttribute("loginMember");
			log.info("세션에 저장된 회원 정보: {}", savedMember);
			
			AlertUtil.redirectAlert("로그인 성공하였습니다", "/index", "green", req, resp);
		}else {
			resp.sendRedirect("login?msg=login_fail");
		}
		
		
	}
	
	
}
