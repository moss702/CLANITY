package controller.board;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Board;
import domain.Member;
import domain.dto.Criteria;
import domain.en.VisibleLevel;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;

@Slf4j
@WebServlet("/faq")
public class FaqController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardService service = new BoardService();
        Criteria cri = new Criteria();
        cri.setCategoryId(1L);  // FAQ 카테고리 (1)

        List<Board> faqList = service.list(cri);
        req.setAttribute("faqList", faqList);
        req.getRequestDispatcher("/WEB-INF/views/qna/faq.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        System.out.println("FAQ doPost 진입!");

        String mode = req.getParameter("mode");

        // 로그인 여부 확인 + ADMIN 권한 확인
        Member loginMember = (Member) req.getSession().getAttribute("member");
        if (loginMember == null || !"ADMIN".equals(loginMember.getRole().toString())) {
            resp.sendRedirect(req.getContextPath() + "/member/login?msg=admin_only");
            return;
        }

        BoardService service = new BoardService();

        if ("write".equals(mode)) {
            String title = req.getParameter("title");
            String content = req.getParameter("content");

            Board board = new Board();
            board.setCategoryId(1L);  // FAQ
            board.setMemberId(loginMember.getMemberId());
            board.setTitle(title);
            board.setContent(content);
            board.setVisibleLevel(VisibleLevel.ALL);

            service.write(board);
            resp.sendRedirect(req.getContextPath() + "/faq");
            return;
        }

        if ("delete".equals(mode)) {
            Long boardId = Long.parseLong(req.getParameter("id"));
            service.remove(boardId);
            resp.sendRedirect(req.getContextPath() + "/faq");
            return;
        }

        if ("modify".equals(mode)) {
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            Long boardId = Long.parseLong(req.getParameter("id"));

            Board board = new Board();
            board.setBoardId(boardId);
            board.setCategoryId(1L);  // FAQ
            board.setMemberId(loginMember.getMemberId());
            board.setTitle(title);
            board.setContent(content);
            board.setVisibleLevel(VisibleLevel.ALL);

            service.modify(board);
            resp.sendRedirect(req.getContextPath() + "/faq");
        }
    }
}
