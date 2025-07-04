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

import domain.onedayClass.ClassInfo;
import domain.onedayClass.OnedayClass;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import util.HikariCPUtil;

@Slf4j
@Builder
@WebServlet("/openClass/open")
public class OnedayClassServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//  세션 체크 (나중에 정보등록 jsp 만들기)
		req.getRequestDispatcher("/WEB-INF/views/openClass/open.jsp").forward(req, resp);
		log.info("{}", HikariCPUtil.getDataSource());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 수집
		
		 Long  classId = Long.parseLong(req.getParameter("classId"));
		 Long  businessId = Long.parseLong(req.getParameter("businessId"));
		 Long  categoryId = Long.parseLong(req.getParameter("categoryId"));
		 String title = req.getParameter("title");
		 String description = req.getParameter("description");
		 int duration = Integer.parseInt(req.getParameter("duration"));
		 int price = Integer.parseInt(req.getParameter("price"));
		 Date createdAt = Date.valueOf(LocalDate.now());
		 
//		 // 객체 생성 //참고용 Board 
		 ClassInfo classInfo = ClassInfo.builder()
				 .classId(classId)
				 .businessId(businessId)
				 .categoryId(categoryId)
				 .title(title)
				 .description(description)
				 .price(price)
				 .duration(duration)
				 .createdAt(createdAt)
				 .build();
		 log.info("{}", classInfo);
		 
//			// 나중에 서비스 호출 해야됨
		  ClassService service = new ClassService();
		    service.register(classInfo);
			 	
	}

}
