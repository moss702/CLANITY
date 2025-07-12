package controller.onedayclass.category;

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
@WebServlet("/mainClassPage")
public class ClassMainPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

////		// 카드 리스트 불러오기
//		ClassService service = new ClassService();
////		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
////
//		Criteria cri = Criteria.init(req);
////		log.info("{}", cri);
////		
//		req.setAttribute("pageDto", new PageDto(cri, service.getCount(cri)));
//		req.setAttribute("cards", service.classList(cri));
//
////		
////		req.setAttribute("cards", cards);
//		req.getRequestDispatcher("/WEB-INF/views/category/mainClassPage.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			ClassService service = new ClassService();
//			OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
	//
			Criteria cri = Criteria.init(req);
//			log.info("{}", cri);
//			
			req.setAttribute("pageDto", new PageDto(cri, service.getCount(cri)));
			req.setAttribute("cards", service.classList(cri));

//			
//			req.setAttribute("cards", cards);
			req.getRequestDispatcher("/WEB-INF/views/category/mainClassPage.jsp").forward(req, resp);
	}

}
