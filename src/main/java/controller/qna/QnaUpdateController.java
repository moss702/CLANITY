package controller.qna;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Attach;
import domain.Board;
import service.BoardService;

@WebServlet("/qna/update")
public class QnaUpdateController extends HttpServlet {
    private final BoardService boardService = new BoardService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long boardId = Long.parseLong(req.getParameter("boardId"));
        Board board = boardService.selectOne(boardId);

        resp.setContentType("application/json; charset=UTF-8");
        String json = String.format("{\"title\": \"%s\", \"content\": \"%s\"}",
                escape(board.getTitle()), escape(board.getContent()));
        resp.getWriter().write(json);
    }

    private String escape(String s) {
        return s == null ? "" : s.replace("\"", "\\\"").replace("\n", "\\n");
    }
}
