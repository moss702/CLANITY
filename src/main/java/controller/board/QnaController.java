package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Board;
import domain.en.VisibleLevel;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;

@WebServlet("/qna")
public class QnaController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/qna/qna_main.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("문의 등록확인");
		
		req.setCharacterEncoding("UTF-8");

	    String title = req.getParameter("title");
	    String content = req.getParameter("content");

	    Board board = new Board();
	    board.setCategoryId(2L); // FAQ 고정 test
	    board.setMemberId(9999L);   // 관리자 ID 임시
	    board.setTitle(title);
	    board.setContent(content);
	    board.setVisibleLevel(VisibleLevel.ALL);    // 이거 나중에 제한걸기.. 본인이 쓴건 본인한테만 보이게.

	    BoardService service = new BoardService();
	    service.write(board);

	   resp.sendRedirect(req.getContextPath() + "/qna_mylist"); // 내 문의내역으로 리다이렉트 * 새로고침
	}
	
	
}