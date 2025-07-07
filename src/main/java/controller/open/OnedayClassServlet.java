package controller.open;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.onedayClass.ClassInfo;
import domain.onedayClass.ClassOpen;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassInfoMapper;
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
//		ClassInfo.setBusinessId(9999L); 
		
		 OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
	      ClassInfo classInfo = onedayClass.getClassInfo();
	      ClassOpen classOpen = onedayClass.getClassOpen();
	      
	     classService.register( classInfo, classOpen);
	      log.info("클래스 아이디 수집:{}",classInfo.getClassId());
	      
	      

//	       insertClassInfo(ClassInfo classInfo);
//	  	void insertClassOpen(ClassOpen classOpen);
		
	      // 메인 페이지이동
	      
	      req.getRequestDispatcher("/WEB-INF/views/category/mainCategoryPage.jsp").forward(req, resp);
	      
	      
	      

	     
	
		

	}

}
