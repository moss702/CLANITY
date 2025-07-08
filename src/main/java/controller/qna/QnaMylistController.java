package controller.qna;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Attach;
import domain.Board;
import domain.Member;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;

@WebServlet("/qna/mylist")
public class QnaMylistController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	    
	    // 비로그인 상태일경우 : 로그인 페이지로 보낸다
	    Member loginMember = (Member) req.getSession().getAttribute("member");

	    if (loginMember == null) {
	        resp.sendRedirect(req.getContextPath() + "/member/login");
	        return;
	    }

	    // 로그인 상태일 경우 
	    // qnaList : loginId == memberId 문의내역을 가져온다.
	    Long loginId = loginMember.getMemberId();
	    req.getSession().setAttribute("loginId", loginId);
	    
	    BoardService boardService = new BoardService();
	    List<Board> qnaList = boardService.findQnaListByMember(loginId);
	    req.setAttribute("qnaList", qnaList);
	    
	    req.getRequestDispatcher("/WEB-INF/views/qna/qna_mylist.jsp").forward(req, resp);
	}
	
	

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	
}