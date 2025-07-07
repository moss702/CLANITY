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
@WebServlet("/class/classOpen")
public class ClassOpenDetail extends HttpServlet {
// 나중에 지울 테스트용
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//  세션 체크
		req.getRequestDispatcher("/WEB-INF/views/class/classOpen.jsp").forward(req, resp);
		log.info("{}", HikariCPUtil.getDataSource());
	}
// 클래스 정보
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 수집
		 Long openId = Long.parseLong(req.getParameter("openId"));
		 Long  masterId = Long.parseLong(req.getParameter("masterId"));
		 String  scheduleDate = req.getParameter("scheduleDate");
		 String startTime = req.getParameter("startTime");
		 String endTime = req.getParameter("endTime");
		 String maxParticipants = req.getParameter("maxParticipants");
		 //나중에 확인
		 String statusParam = req.getParameter("status"); 
		 ClassOpenEn status = ClassOpenEn.valueOf(statusParam);  
		 
		
//		 // 객체 생성 //참고용 Board 

	 
		 
//			// 나중에 서비스 호출 해야됨
			 	 
	}

}
