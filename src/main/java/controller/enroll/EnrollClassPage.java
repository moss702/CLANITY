package controller.enroll;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Member;
import domain.onedayClass.ClassEnroll;
import domain.onedayClass.OnedayClass;
import lombok.Builder;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import service.EnrollClassServie;
import util.ParamUtil;
@Slf4j
@WebServlet("/classEnrollPage")
public class EnrollClassPage extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long classId = Long.parseLong(req.getParameter("classId"));
		Long openId = Long.parseLong(req.getParameter("openId"));
		Long memberId = Long.parseLong(req.getParameter("memberId"));
		
		log.info("{}, {}, {}" ,classId, openId, memberId);
		 req.getRequestDispatcher("/WEB-INF/views/enroll/classEnrollPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
//		req.setAttribute("onedayClass", onedayClass);
//		
//		Object obj = req.getSession().getAttribute("member");
//		Member loginMember = (Member) obj;
//		
//		req.setAttribute("member", loginMember); 		
//		
//		Long classId = onedayClass.getClassId();
//		Long openId= onedayClass.getOpenId();
//		
//		
//		ClassService service = new ClassService();
//		OnedayClass detailInfo = service.detailPageInfo(classId, openId);
////		
//		req.setAttribute("detailInfo", detailInfo);
//		
//		EnrollClassServie enrollClassServie = new EnrollClassServie();
//		
//		 
////		 onedayClass.getClassId();
////		 onedayClass.getMemberId();
////		 onedayClass.getOpenId();
//	
////	      등록
//		 enrollClassServie.enrollClass(onedayClass);
//	     log.info("클래스:{}", onedayClass);

	
	}
	

}
