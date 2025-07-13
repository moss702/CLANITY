package controller.onedayclass.enroll;

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
		Object obj = req.getSession().getAttribute("member");
		if(obj == null || !(obj instanceof Member)) {
			log.info("{멤버 상태}", obj);
			// 비로그인상태(나중에 로그인이나 회원가입 창으로 주소 바꾸기)
			AlertUtil.redirectAlert("로그인 후 이용해 주세요","/index","red",req,resp);

			return ;
		}
		Member loginMember = (Member) obj;

		ClassEnroll enroll = ParamUtil.get(req, ClassEnroll.class);
		log.info("{}", enroll);
		enroll.setMemberId(loginMember.getMemberId());

		OnedayClass oc = new ClassService().detailPageInfo(OnedayClass.builder().classId(enroll.getClassId()).openId(enroll.getOpenId()).build());
		req.setAttribute("detailInfo", oc);
		req.setAttribute("enroll", enroll);
		req.getRequestDispatcher("/WEB-INF/views/enroll/classEnrollPage.jsp").forward(req, resp);
		
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
		OnedayClass detailInfo = service.detailPageInfo(OnedayClass.builder().classId(classId).openId(openId).build());
		
		req.setAttribute("detailInfo", detailInfo);
		
		
		EnrollClassServie enrollClassServie = new EnrollClassServie();

//	      등록 (현재 두번씩 등록 되는데 원인 찾기)
		 enrollClassServie.enrollClass(onedayClass);
//	     log.info("클래스:{}", onedayClass);
			AlertUtil.redirectAlert("신청이 완료되었습니다. 마이페이지에서 확인해주세요","/index","red",req,resp);
//	     req.getRequestDispatcher("/WEB-INF/views/enroll/classEnrollPage.jsp").forward(req, resp);
	
	}
	

}
