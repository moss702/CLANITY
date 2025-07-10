package controller.board;

import domain.dto.Criteria;
import domain.dto.PageDto;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;
import util.ParamUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@WebServlet("/board/qna")
public class BoardQnaChoice extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService service = new BoardService();
		
		// Criteria cri = Criteria.init(req);
		Criteria cri = ParamUtil.get(req, Criteria.class);
		log.info("{}", cri); // 1, 2, 30
		
		req.setAttribute("cri", cri);


		req.getRequestDispatcher("/WEB-INF/views/board/qna.jsp").forward(req, resp);

		
	}
	
}
