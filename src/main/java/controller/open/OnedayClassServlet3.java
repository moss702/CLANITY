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
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import util.HikariCPUtil;

@Slf4j
@WebServlet("/openClassRegister/open3")
public class OnedayClassServlet3 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션 체크 (나중에 정보등록 jsp 만들기)
		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/open3.jsp").forward(req, resp);
		log.info("{}", HikariCPUtil.getDataSource());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 한글 깨짐 방지
		req.setCharacterEncoding("UTF-8");

		// 파라미터 수집
		String difficulty = req.getParameter("difficulty");
		String duration= req.getParameter("duration");
		String curriculum = req.getParameter("curriculum");
		String description = req.getParameter("description");
		String description2 = req.getParameter("description2");
		
//			// 값 저장 나중에 오픈 2, 3, 4 이런식으로 사용
		HttpSession session = req.getSession();
		session.setAttribute("difficulty", difficulty);
		session.setAttribute("duration", duration);
		session.setAttribute("curriculum", curriculum);
		session.setAttribute("description", description);
		session.setAttribute("description2", description2);

		// 다음 페이지 이동
		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/open4.jsp").forward(req, resp);


	}

}
