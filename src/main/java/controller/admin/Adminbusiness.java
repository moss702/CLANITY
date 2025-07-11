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
		BusinessApplyService service = new BusinessApplyService();

		List<BusinessApply> apply = service.list();

		req.setAttribute("applyList", apply);

		req.getRequestDispatcher("/WEB-INF/views/admin/admin_business.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



	}
	
	

}
