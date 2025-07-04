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
import util.AlertUtil;

@Data
@Setter
@Getter
@Slf4j
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
//		Criteria cri = Criteria.init(req);
//		if(req.getSession().getAttribute("member") == "") {
//			AlertUtil.alert("관리자 권한이 없습니다.", "/member/login?" + cri.getQs2(), req, resp, true);
//			return;
//		} 관리자 권한 여부 한번 더 체크 * jsp 버튼 visible 1차 체크
		
		req.setCharacterEncoding("UTF-8");
		System.out.println("FAQ doPost 진입!");

	    String mode = req.getParameter("mode"); //faq에서 mode 값 가져와서 해당 메서드 실행하기 위함.

// 관리자 권한 * insert (FAQ등록)
	    if ("write".equals(mode)) {
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
	    
// 관리자 권한 * delete (FAQ삭제)
	    if ("delete".equals(mode)) {
	        Long boardId = Long.parseLong(req.getParameter("id"));
	        
	        BoardService service = new BoardService();
	        service.remove(boardId);
	        resp.sendRedirect(req.getContextPath() + "/faq");
	        return;
	    }

// 관리자 권한 * modify (FAQ수정)
	    if ("modify".equals(mode)) {
	    	
	        String title = req.getParameter("title");
	        String content = req.getParameter("content");

	        Board board = new Board();
	        board.setCategoryId(1L);
	        board.setMemberId(9999L);
	        board.setTitle(title);
	        board.setContent(content);
	        board.setVisibleLevel(VisibleLevel.ALL);

	        Long boardId = Long.parseLong(req.getParameter("id"));
	        board.setBoardId(boardId);
	        System.out.println("수정 대상 ID: " + board.getBoardId());
	        BoardService service = new BoardService();
	        service.modify(board);

	        resp.sendRedirect(req.getContextPath() + "/faq");
	        return;
	    }
	}
}