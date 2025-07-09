package controller.admin;

import domain.Member;
import domain.en.MemberRole;
import lombok.extern.slf4j.Slf4j;
import util.AlertUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@WebServlet("/admin/member")
public class Adminmember extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Member member = (Member) req.getSession().getAttribute("member");
		
		if (member != null && member.getRole() == MemberRole.ADMIN) {
			req.getRequestDispatcher("/WEB-INF/views/admin/admin_members.jsp").forward(req, resp);
		}
		else {
//			AlertUtil.alert("접근 권한이 없습니다", "/index", req, resp);
			AlertUtil.redirectAlert("접근권한이 없습니다","/index","red",req,resp);
			return;
		}
		
		
//	req.getRequestDispatcher("/WEB-INF/views/admin/admin.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	

}
