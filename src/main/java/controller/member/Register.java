package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import service.MemberService;
import util.AlertUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/member/register")
public class Register extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
//		log.info("가입시 입력한 이메일 값 : {},  가입시 입력한 비밀번호 값 : {}", email, password);
		
		Member member  = Member.builder().email(email).password(password).build();
		log.info("입력 받은 회원 정보: {}", member);
		
		if( new MemberService().register(member) == 0) {
			AlertUtil.alert("회원가입에 실패했습니다.", "/index", req, resp);
		} else {
			AlertUtil.alert("회원가입을 축하합니다. 로그인후 사용해주세요", "/index", req, resp);
		};
		
//		resp.sendRedirect(req.getContextPath() +"/index");
		//		Member member = ParamUtil.get(req, Member.class); // 파라미터 확인 후 살리기
//		log.info("{}", member);
	}

}
