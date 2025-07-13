package controller.onedayclass.enroll;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Member;
import domain.onedayClass.ClassEnroll;
import domain.onedayClass.OnedayClass;
import service.ClassService;
import service.EnrollClassServie;
import util.AlertUtil;
import util.ParamUtil;

@WebServlet("/classEnrollCard")
public class EnrollCard extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 결제를 위한 사전데이터 조회
		// 회원정보는 세션에서 아이디 가져오기
		// class open정보 db에서 조회해오기
		//

		req.getRequestDispatcher("/WEB-INF/views/enroll/classEnrollPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 결제 확인 코드 계열 수집
		// db에 결제정보 insert (class_enroll table에 저장 후 리디렉션)


		Object obj = req.getSession().getAttribute("member");
		Member loginMember = (Member) obj;
		req.setAttribute("member", loginMember); 		
		
		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
		Long classId = onedayClass.getClassId();
		Long openId= onedayClass.getOpenId();
		Long enrollId= onedayClass.getEnrollId();
		
		
		ClassService service = new ClassService();
		OnedayClass detailInfo = service.detailPageInfo(OnedayClass.builder().build());
		req.setAttribute("detailInfo", detailInfo);
		
		
		EnrollClassServie enrollClassServie = new EnrollClassServie();
		enrollClassServie.enrollList(enrollId);
		 req.setAttribute("enroll", enrollId);
		
			req.getRequestDispatcher("/WEB-INF/views/enroll/classEnrollCard.jsp").forward(req, resp);

	}

}
