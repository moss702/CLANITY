package controller.category;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.onedayClass.OnedayClass;
import service.ClassService;
import util.ParamUtil;

@WebServlet("/cardTmp")
public class CardList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 카드 리스트 불러오기
		ClassService service = new ClassService();
		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
		// 전체 목록
		List<OnedayClass> cards = service.cardInfo(onedayClass);
		// 카테고리별 목록
		List<OnedayClass> categoryList = service.cardInfo(onedayClass);
		
		// 저장한 값
		req.setAttribute("cards", cards);
		req.setAttribute("caregoryList", categoryList);
//	
		req.getRequestDispatcher("/WEB-INF/views/category/cardTmp.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
