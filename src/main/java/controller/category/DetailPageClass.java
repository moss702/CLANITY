package controller.category;

import domain.dto.Criteria;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import util.ParamUtil;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Slf4j
@WebServlet("/classDetailedPage")
public class DetailPageClass extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 카드 리스트 불러오기
		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
		Long classId = onedayClass.getClassId();
		req.setAttribute("onedayClass", onedayClass);
//		Long classId= onedayClass.getClassId();
		Long openId= onedayClass.getOpenId();
		log.info("req.getParameter(classId): {}", req.getParameter("classId"));
		log.info("req.getParameter(openId): {}", req.getParameter("openId"));
		ClassService service = new ClassService();
		OnedayClass detailInfo = service.detailPageInfo(classId, openId);
//		
		req.setAttribute("detailInfo", detailInfo);
		

		req.getRequestDispatcher( "/WEB-INF/views/enroll/classDetailedPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
