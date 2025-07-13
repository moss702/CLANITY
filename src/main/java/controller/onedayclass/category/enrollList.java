package controller.onedayclass.category;

import domain.dto.Criteria;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import service.EnrollClassServie;
import util.ParamUtil;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@WebServlet("/classEnrollList")
public class enrollList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 카드 리스트 불러오기
		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
		req.setAttribute("onedayClass", onedayClass);
		Long classId = onedayClass.getClassId();
		Long openId = onedayClass.getOpenId();
		Long enrollId = onedayClass.getEnrollId();

		ClassService service = new ClassService();
		OnedayClass detailInfo = service.detailPageInfo(OnedayClass.builder().build());

		req.setAttribute("detailInfo", detailInfo);
		// 전체 , 단일 조회

		EnrollClassServie enrollClassServie = new EnrollClassServie();
//		List<OnedayClass> enrollList = enrollClassServie.enrollList(openId);
	 	enrollClassServie.enrollClassSelectOne(openId, enrollId);
//	 	req.setAttribute("enrollList", enrollList);

		req.getRequestDispatcher("/WEB-INF/views/enroll/classEnrollList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
// 필요X
	}

}
