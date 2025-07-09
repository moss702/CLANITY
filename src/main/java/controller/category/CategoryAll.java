package controller.category;

import java.io.IOException;
import java.lang.reflect.Member;
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
import service.ClassService;
import util.ParamUtil;
@Slf4j
@WebServlet("/categoryAll")
public class CategoryAll extends HttpServlet  {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		 AlertUtil.alert("잘못된 접근입니다","CLANITY/categoryMain", req, resp);
		
		ClassService service = new ClassService();
		
		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
	

		Criteria cri = Criteria.initList(req);
		log.info("{}", cri);
	

		// 페이지 불러오기 및 카드 불러오기		
		req.setAttribute("pageDto", new PageDto(cri, service.getCount(cri)));
		req.setAttribute("cards", service.cardInfo(cri));
//		
		log.info("pageDto: {}", new PageDto(cri, service.getCount(cri)));
		// 불러오기
		req.getRequestDispatcher("/WEB-INF/views/category/categoryAll.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}
	

}
