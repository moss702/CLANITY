package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.member.Business;
import domain.BusinessApply;
import lombok.extern.slf4j.Slf4j;
import service.BusinessApplyService;

@Slf4j
@WebServlet("/admin/business") //신청자 목록 관리
public class Adminbusiness extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String status = req.getParameter("status");
		BusinessApplyService service = new BusinessApplyService();

		List<BusinessApply> applyList = service.list(null); //전체 조회

		if (status == null || status.equals("all")) {
			applyList = service.list(null); // 전체 조회
		} else {
			applyList = service.list(status); // 상태별 조회
		}

		req.setAttribute("applyList", applyList);
		req.getRequestDispatcher("/WEB-INF/views/admin/admin_business.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



	}
	
	

}
