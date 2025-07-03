package controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Board;
import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.en.VisibleLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;

@Data
@Setter
@Getter
@WebServlet("/faq")
public class FaqController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    BoardService service = new BoardService();
	    Criteria cri = new Criteria();
	    cri.setCategoryId(1L);
	    
	    List<Board> faqList = service.list(cri);
	    req.setAttribute("faqList", faqList);
	    req.getRequestDispatcher("/WEB-INF/views/qna/faq.jsp").forward(req, resp);
	}
	
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("FAQ 등록확인");
		
	    req.setCharacterEncoding("UTF-8");
	    String mode = req.getParameter("mode"); //faq에서 mode 값 가져와서 해당 메서드 실행하기 위함.

	    // delete
	    if ("delete".equals(mode)) {
	        Long boardId = Long.parseLong(req.getParameter("id"));
	        BoardService service = new BoardService();
	        service.remove(boardId);
	        resp.sendRedirect(req.getContextPath() + "/faq");
	        return;
	    }

	    
	    // insert
	    String title = req.getParameter("title");
	    String content = req.getParameter("content");

	    Board board = new Board();
	    board.setCategoryId(1L);
	    board.setMemberId(9999L);
	    board.setTitle(title);
	    board.setContent(content);
	    board.setVisibleLevel(VisibleLevel.ALL);

	    BoardService service = new BoardService();
	    service.write(board);

	    resp.sendRedirect(req.getContextPath() + "/faq"); // 목록으로 리다이렉트 * 새로고침


	}
	
	
}