package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Member;
import domain.MemberWithdraw;
import lombok.extern.slf4j.Slf4j;
import mapper.MemberWithdrawMapper;
import service.MemberWithdrawService;
import util.AlertUtil;

@Slf4j
@WebServlet("/mypage/deactivate")
public class MypageDeactivate extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/mypage/mypagedeactivate.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Member member = (Member) req.getSession().getAttribute("member");
		
		log.info("가져온 세션의 member 객체 :{}",member);
		
		MemberWithdraw request = MemberWithdraw.builder()
				.memberId(member.getMemberId())
				.emailMasked(member.getEmail())
				.nicknameMasked(member.getNickname())
				.build();
		
		log.info("만들어지는 객체{}",request);
		 if(new MemberWithdrawService().withdrawRuest(request) == 0) {
			 AlertUtil.redirectAlert("오류가 발생했습니다. 다시 시도해주세요", "/mypage/deactivate", "red", req, resp);
		 } else {
			 req.getSession().invalidate();
			 AlertUtil.alert("회원탈퇴 요청이 접수되었습니다. 로그아웃 되었습니다", "/index", req, resp);
		 }
	}
	
	
}
