package controller.category;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;
import service.ClassService;
import util.ParamUtil;

@Slf4j
@WebServlet("/categoryList")
public class PageList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		현재 필요없
//		Long categoryId = Long.parseLong(req.getParameter("categoryId"));
		
//		서비스 호출
		ClassService service = new ClassService();
//		불러오기
		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);

		Criteria cri = Criteria.init(req);
		log.info("{}", cri);
//		리스트가 필요한가?
	
//		List<OnedayClass> cards = service.cardInfo(onedayClass);

		// 페이지 불러오기 및 카드 불러오기		
		req.setAttribute("pageDto", new PageDto(cri, service.getCount(cri)));
		req.setAttribute("cards", service.cardInfo(cri));
//		
		log.info("pageDto: {}", new PageDto(cri, service.getCount(cri)));
		req.getRequestDispatcher("/WEB-INF/views/class/categoryList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
