package controller.onedayclass;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.batch.Main;

import domain.en.ClassOpenEn;
import domain.onedayClass.ClassInfo;
import domain.onedayClass.ClassOpen;
import lombok.extern.slf4j.Slf4j;
import util.HikariCPUtil;

@Slf4j
@WebServlet("/class/searchOption")
public class Search extends HttpServlet {
// 나중에 지울 테스트용
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//  세션 체크
		req.getRequestDispatcher("/WEB-INF/views/class/searchOption.jsp").forward(req, resp);
		log.info("{}", HikariCPUtil.getDataSource());
	}
// 클래스 정보
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			 	 
	}

}
