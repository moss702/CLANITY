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
import util.AlertUtil;
import util.ParamUtil;
@Slf4j
@WebServlet("/classEnrollPage")
public class EnrollClassPage extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Object obj = req.getSession().getAttribute("member");
		if(obj == null || !(obj instanceof Member)) {
			log.info("{멤버 상태}", obj);
			// 비로그인상태(나중에 로그인이나 회원가입 창으로 주소 바꾸기)
			AlertUtil.redirectAlert("로그인 후 이용해 주세요","/index","red",req,resp);
			
			return ;
		}
		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
		
		Member loginMember = (Member) obj;
		
		req.setAttribute("member", loginMember); 		
		
		Long classId = onedayClass.getClassId();
		Long openId= onedayClass.getOpenId();
		
		ClassService service = new ClassService();
		OnedayClass detailInfo = service.detailPageInfo(classId, openId);
		
		req.setAttribute("detailInfo", detailInfo);
		
		
		EnrollClassServie enrollClassServie = new EnrollClassServie();

//	      등록 (현재 두번씩 등록 되는데 원인 찾기)
		 enrollClassServie.enrollClass(onedayClass);
//	     log.info("클래스:{}", onedayClass);
	     req.getRequestDispatcher("/WEB-INF/views/enroll/classEnrollPage.jsp").forward(req, resp);
	
	}
	

}
