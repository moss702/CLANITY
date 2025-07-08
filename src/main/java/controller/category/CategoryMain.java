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

@WebServlet("/categoryMain")
public class CategoryMain extends HttpServlet  {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ClassService service = new ClassService();

		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);

		List<OnedayClass> cards = service.cardInfo(onedayClass);

		req.setAttribute("cards", cards);
		 req.getRequestDispatcher("/WEB-INF/views/category/categoryMain.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	

}
