package controller.open;


import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Member;
import domain.en.MemberRole;
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
		//  불러오기
		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/open1.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 세션 체크 먼저 하고 
		
		Object obj = req.getSession().getAttribute("member");
		if(obj == null || !(obj instanceof Member)) {
			log.info("{멤버 상태}", obj);
			// 비로그인상태
			
			return;
		}
		Member member = (Member) obj;
		if(member.getRole() == MemberRole.MEMBER) {
			// 평회원 사유
			
			return;
		}
//		
		// 등록
		
		ClassService classService = new ClassService();
		
		 OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
		 onedayClass.setBusinessId(member.getMemberId());
	
		// 3. 그 후 insert 진행
		  
	      log.info("클래스 아이디 수집:{}",onedayClass.getClassId());
	      onedayClass.setStatus(true);
	      
	      log.info("제목: {}", onedayClass.getTitle());
	      
	      log.info("카테고리 ID: {}", onedayClass.getCategoryId());

//	      등록
	     classService.register(onedayClass);
	     log.info("클래스:{}", onedayClass);

//	      등록 후에 url 등록은 리디렉션으로 진행하기(디테일 페이지로 가게하기)
//		req.get
		
	      // 메인 페이지이동
	      
	      req.getRequestDispatcher("/WEB-INF/views/category/categoryMain.jsp").forward(req, resp);
	      
	

	}

}
