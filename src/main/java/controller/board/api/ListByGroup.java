package controller.board.api;

import service.BoardService;
import util.JsonRespUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/api/listByGroup")
public class ListByGroup extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long groupId = Long.parseLong(req.getParameter("groupId"));
        JsonRespUtil.writeJson(resp, new BoardService().listByGroup(groupId));
    }
}