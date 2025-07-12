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

@WebServlet("/enrollList")
public class EnrollClassInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		
			req.getRequestDispatcher("/WEB-INF/views/class/enrollList.jsp").forward(req, resp);

	}

}
