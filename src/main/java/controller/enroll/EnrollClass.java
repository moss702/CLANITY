package controller.enroll;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import domain.onedayClass.ClassEnroll;

@WebServlet("/enroll/classDetailedPage")
public class EnrollClass extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		req.getRequestDispatcher("/WEB-INF/views/enroll/classDetailedPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long openId = Long.parseLong(req.getParameter("openId"));
		Long memberId = Long.parseLong(req.getParameter("memberId"));
		Date enrolledAt = Date.valueOf(LocalDate.now());
		boolean status = false;

		HttpSession session = req.getSession();
		ClassEnroll enroll = ClassEnroll.builder().openId(openId).memberId(memberId).enrolledAt(enrolledAt)
				.status(status).build();

		session.setAttribute("enrollkey", enroll);
		
		req.getRequestDispatcher("/WEB-INF/views/enroll/classPaymentMainPage.jsp").forward(req, resp);

	}

}
