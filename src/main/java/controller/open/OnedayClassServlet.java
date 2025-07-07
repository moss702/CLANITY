package controller.open;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.onedayClass.ClassInfo;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import util.HikariCPUtil;

@Slf4j
@WebServlet("/openClassRegister/open1")
public class OnedayClassServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//  세션 체크 (나중에 정보등록 jsp 만들기)
		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/open1.jsp").forward(req, resp);
		log.info("{}", HikariCPUtil.getDataSource());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 한글 깨짐 방지
		req.setCharacterEncoding("UTF-8");
		
		
		// 파라미터 수집
		 String title = req.getParameter("title");
		 String classType = req.getParameter("classType");
		 String region = req.getParameter("region");
		 String address = req.getParameter("address");
		 String categoryIdStr = req.getParameter("categoryId");
		 Long categoryId = null;
		 try {
		     categoryId = Long.parseLong(categoryIdStr);
		 } catch (NumberFormatException e) {
		     log.error("Invalid categoryId: {}", categoryIdStr);
		     // 처리 로직 (예: 오류 페이지로 포워딩)
		 }

		 
//	// 값 저장 나중에 오픈 2, 3, 4 이런식으로 사용
		HttpSession session = req.getSession();	 
		session.setAttribute("title", title);
		session.setAttribute("classType", classType);
		session.setAttribute("region", region);
		session.setAttribute("address", address);
		session.setAttribute("categoryId", categoryId);
		
		// 다음 페이지 이동
		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/open2.jsp").forward(req, resp);
		

	}

}
