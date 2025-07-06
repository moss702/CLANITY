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

@WebServlet("/mainClassPage")
public class ClassMainPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 카드 리스트 불러오기
		ClassService service = new ClassService();

		List<OnedayClass> list = service.card();
		req.setAttribute("cardlist", list);
//		String cardlist = req.getParameter("categoryId");
//		Long categoryId = 1004L;
////		Long categoryId = Long.parseLong(cardlist);
//		
//		ClassService service = new ClassService();
//		List<OnedayClass> list =service.cardByCategory(categoryId);
//		req.setAttribute("cardlist", list);
		req.getRequestDispatcher("/WEB-INF/views/category/mainClassPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
