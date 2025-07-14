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
import service.MemberWithdrawService;
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

		boolean isDuplicated = false;

		// 2. 가입 유저 검색
		MemberService memberService = new MemberService();
		Member foundMember = memberService.findByEmail(email);
		if (foundMember != null) {
			log.debug("[CHECK EMAIL] 가입 중인 회원 존재: {}", foundMember.getEmail());
			isDuplicated = true;
		}

		// 3. 탈퇴 유저 검색
		if (!isDuplicated) {
			MemberWithdrawService withdrawService = new MemberWithdrawService();
			isDuplicated = withdrawService.existsWithdrawByEmail(email);
			log.debug("[CHECK EMAIL] 탈퇴 회원 이메일 중복 여부: {}", isDuplicated);
		}



		if(isDuplicated) {
			AlertUtil.alert("이미 사용중인 이메일입니다.", "/member/register", req, resp);
		}

		String password = req.getParameter("password");
		
		Member member  = Member.builder().email(email).password(password).build();
		
		if( new MemberService().register(member) == 0) {
			AlertUtil.alert("회원가입에 실패했습니다.", "/index", req, resp);
		} else {
			AlertUtil.alert("회원가입을 축하합니다. 로그인후 사용해주세요", "/index","green", req, resp);
		};
	}

}
