package controller.open;


import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.onedayClass.ClassInfo;
import domain.onedayClass.ClassOpen;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import util.ParamUtil;

@Slf4j
@WebServlet("/openClassRegister/open1")
public class OnedayClassServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//  세션 체크 (필요없음 나중에 삭제)
		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/open1.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ClassService classService = new ClassService();
		
		 OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
		 ClassInfo classInfo = onedayClass.getClassInfo();
		    ClassOpen classOpen = onedayClass.getClassOpen();
		 
	      classInfo.setCreatedAt(new Date(System.currentTimeMillis()));
	      classInfo.setBusinessId(9999L); 
	      log.info("클래스 아이디 수집:{}",classInfo.getClassId());
	      classOpen.setStatus(true);
	      log.info("제목: {}", classInfo.getTitle());
	      log.info("카테고리 ID: {}", classInfo.getCategoryId());
	     classService.register( classInfo, classOpen);
	     log.info("클래스:{}, 클래스:{}", classInfo, classOpen );
	      
	      

//	       insertClassInfo(ClassInfo classInfo);
//	  	void insertClassOpen(ClassOpen classOpen);
		
	      // 메인 페이지이동
	      
	      req.getRequestDispatcher("/WEB-INF/views/category/categoryMain.jsp").forward(req, resp);
	      
	      
	      

	     
	
		

	}

}
