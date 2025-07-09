package controller.qna;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.attach.UploadFile;
import domain.Attach;
import domain.AttachLink;
import domain.Board;
import domain.Member;
import domain.en.VisibleLevel;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;

@WebServlet("/qna")
@MultipartConfig
@Slf4j
public class QnaController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String mode = req.getParameter("mode");

	    if ("toBusiness".equals(mode)) {  // [강사에게 문의하기]
	        String className = req.getParameter("className");
	        String classId = req.getParameter("classId");
	        String teacherId = req.getParameter("teacherId");  // 해당 클래스 강사의 memberId 필요
	        
	        req.setAttribute("className", className);
	        req.setAttribute("classId", classId);
	        req.setAttribute("teacherId", teacherId); 
	    }
	    
	    BoardService boardService = new BoardService();
	    Long loginId = (Long) req.getSession().getAttribute("loginId");
	    
	    List<Board> qnaList = boardService.findQnaListByMember(loginId);  // 카테고리 ID = 2(QnA)
	    req.setAttribute("qnaList", qnaList);

	    req.getRequestDispatcher("/WEB-INF/views/qna/qna_main.jsp").forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    System.out.println("QNA doPost 진입!");
	    
	    // 작성자ID 및 로그인 여부 확인
	    Member loginMember = (Member) req.getSession().getAttribute("member");
	    if (loginMember == null) {
	        resp.sendRedirect(req.getContextPath() + "/member/login");
	        return;
	    }
	    log.info("loginMember: {}", loginMember);
	    
	    
	    String inqType = req.getParameter("inqType");		   // 문의 타입
	    String title = req.getParameter("title");			   // 문의 제목
	    String content = req.getParameter("content");		   // 문의 내용
	    String receiverIdStr = req.getParameter("receiverId"); // 문의 수신자 : 강사 ID
	   
	    // 문의 수신자가 비어있다면 null, 아니라면 강사ID long 타입으로 변환해서 receiverId에 넣기
	    Long receiverId = (receiverIdStr == null || receiverIdStr.isBlank()) ? null : Long.parseLong(receiverIdStr);
	    
	    req.getSession().setAttribute("loginId", loginMember.getMemberId());
	    Long loginId = loginMember.getMemberId();

	    Board board = new Board();
	    board.setCategoryId(2L); 		 // QnA
	    board.setMemberId(loginId);
	    board.setReceiverId(receiverId);
	    board.setTitle(title);
	    board.setContent(content);
	    board.setVisibleLevel(VisibleLevel.ALL);

	    BoardService service = new BoardService();
	    service.write(board);

	    // 첨부파일 처리 : UploadService 호출 -> attachLink, attach에 저장됨
//	    try {   
//	        new UploadService().handleUpload(req, "board", board.getBoardId());
//	        								// 사용할 카테고리, 카테고리 id
//	    } catch (Exception e) {
//	        log.error("파일 업로드 중 오류 발생", e);
//	        req.setAttribute("error", "파일 업로드에 실패했습니다.");
//	        req.getRequestDispatcher("/WEB-INF/views/qna/qna_main.jsp").forward(req, resp);
//	        return;
//	    }
	    log.info("문의 작성 완료! boardId: {}, memberId: {}", board.getBoardId(), loginId);
	    resp.sendRedirect(req.getContextPath() + "/qna/mylist");
	}
}