package controller.open;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.onedayClass.ClassInfo;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import util.HikariCPUtil;
// 파일 사이즈 (이거 나중에)
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 1MB
	    maxFileSize = 1024 * 1024 * 5,   // 5MB
	    maxRequestSize = 1024 * 1024 * 20 	)
@Slf4j
@WebServlet("/openClassRegister/open2")
public class OnedayClassServlet2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션 체크 (나중에 정보등록 jsp 만들기)
		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/open2.jsp").forward(req, resp);
		log.info("{}", HikariCPUtil.getDataSource());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 수집
		// 한글 깨짐 방지
		req.setCharacterEncoding("UTF-8");

		// 파라미터 수집
		
		String thumbnailImages = req.getParameter("thumbnailImages");
		String detailImages = req.getParameter("detailImages");
		
		HttpSession session  = req.getSession();
		session.setAttribute("thumbnailImages", thumbnailImages);
		session.setAttribute("detailImages", detailImages);
	
		// 다음 페이지 이동
		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/open3.jsp").forward(req, resp);
	}

}
