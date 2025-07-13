package controller.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Board;
import domain.dto.Criteria;
import service.BoardService;
import util.AlertUtil;

@WebServlet("/board/remove")
public class Remove extends HttpServlet{

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardIdStr = req.getParameter("boardId");
		if(boardIdStr == null || boardIdStr.trim().isEmpty()) {
		//if(req.getParameter("boardId") == null) {
			AlertUtil.alert("잘못된 접근입니다", "/board/list", req, resp);
			return;
		}
		
		BoardService service = new BoardService();
		service.remove(Long.parseLong(req.getParameter("boardId")));

		Criteria cri = Criteria.init(req);
		String categoryId = req.getParameter("categoryId");
		String referer = req.getHeader("Referer");
		if (referer != null) {
		    resp.sendRedirect(referer);
		} else {
		    AlertUtil.alert("글이 삭제되었습니다", "/board/list?" + cri.getQs2(), req, resp);
		}

		
	}	
}
