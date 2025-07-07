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
@WebServlet("/mypage/edit")
public class ProfileEdit extends HttpServlet{@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.getRequestDispatcher("/WEB-INF/views/mypage/mypageedit.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Member member = ParamUtil.get(req, Member.class);
		
		log.info("개인 정보 수정:{}",member);
		
		new MemberService().modify(member);
		AlertUtil.redirectAlert("정상적으로 수정되었습니다","/mypage","green",req,resp);
	}
}
