package controller.category;

import domain.onedayClass.OnedayClass;
import util.ParamUtil;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/classDetailedPage")
public class DetailPageClass extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 카드 리스트 불러오기
		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
		 onedayClass.setClassId(onedayClass.getClassId());
		onedayClass.setClassId(onedayClass.getOpenId());

		req.getRequestDispatcher(req.getContextPath()  + "/WEB-INF/views/enroll/classDetailedPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
