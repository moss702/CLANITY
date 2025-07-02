package controller.enroll;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.en.EnrollStatus;
import domain.onedayClass.ClassEnroll;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
@WebServlet("/enroll/class")
public class EnrollClass extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 resp.setContentType("text/html;charset=UTF-8");
		 req.getRequestDispatcher("/WEB-INF/views/enroll/class.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 원데이 클래스 아이디 정보 (클래스 개설시 자동 증가)
		Long enrollId = Long.parseLong(req.getParameter("enrollId")); 

		// 원데이 클래스 멤버 아이디 정보(사업자인지, 관리자, 운영자, 개인 회원인지)
		Long id = Long.parseLong(req.getParameter("openId"));
		
		Long memberId = Long.parseLong(req.getParameter("memberId")); 
		// 날짜
		Date enrolledAt = Date.valueOf(LocalDate.now());
		// 기본값을 enrilled
		EnrollStatus status = EnrollStatus.ENROLLED;
		
		//객체 생성
//	 ClassEnroll enroll = new ClassEnroll(enrollId, id, memberId, enrolledAt, status);
	
	}
//	ClassEnroll enrollNew= ClassEnroll.builder()
//		    .openId(1L)
//		    .memberId(2L)
//		    .status(EnrollStatus.ENROLLED)
//		    .build();
	
	
	

}
