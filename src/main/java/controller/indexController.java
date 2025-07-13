package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.onedayClass.ClassSocialingCategory;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
@Slf4j
@WebServlet("/index")
public class indexController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ClassService service = new ClassService();
		Criteria cri = Criteria.init(req);

	
//req.setAttribute("categoryMap", categoryMap);
	
		req.setAttribute("pageDto", new PageDto(cri, service.getCount(cri)));
		req.setAttribute("cards", service.classList(cri));
		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	}
}
