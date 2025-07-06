package controller.board;

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
import service.AttachLinkService;
import service.AttachService;
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
	    
	    List<Board> myQnaList = boardService.findQnaListByMember(loginId);  // 카테고리 ID = 2(QnA)
	    req.setAttribute("myQnaList", myQnaList);

	    req.getRequestDispatcher("/WEB-INF/views/qna/qna_main.jsp").forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   System.out.println("문의 등록확인");

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String receiverIdStr = req.getParameter("receiverId");
		Long receiverId = (receiverIdStr == null || receiverIdStr.isBlank()) ? null : Long.parseLong(receiverIdStr);
		
		//로그인 확인
	    // 세션에서 member 객체 가져오기
	    Member loginMember = (Member) req.getSession().getAttribute("member");

	    // null 체크 후 loginId 세션에 저장
	    if (loginMember != null) {
	        req.getSession().setAttribute("loginId", loginMember.getMemberId());
	    } else {
	        resp.sendRedirect(req.getContextPath() + "/member/login");
	        return;
	    }

	    Long loginId = (Long) req.getSession().getAttribute("loginId");
		
	    Board board = new Board();
	    board.setCategoryId(2L);    		// QnA(2) 고정
	    board.setMemberId(loginId);			// 발신인 (로그인한 유저의 memberId)
	    board.setReceiverId(receiverId);	// 수신인(강사Id or admin_only)
	    board.setTitle(title);				// 문의제목
	    board.setContent(content);			// 문의내용
	    board.setVisibleLevel(VisibleLevel.ALL);    // * 열람 제한 필요.. 본인이 쓴건 본인한테만 보이게.

	    BoardService service = new BoardService(); 
	    service.write(board);
	    log.info("작성된 boardId: {}", board.getBoardId());
		// 첨부파일 처리
		Collection<Part> parts = req.getParts();
		AttachService attachService = new AttachService();
		AttachLinkService linkService = new AttachLinkService();

		for (Part part : parts) {
			if (part.getName().equals("files[]") && part.getSize() > 0) {
				String fileName = part.getSubmittedFileName();
				String contentType = part.getContentType();
				long size = part.getSize();
				String uuid = java.util.UUID.randomUUID().toString();
				String ext = fileName.contains(".") ? fileName.substring(fileName.lastIndexOf(".")) : "";
				String saveName = uuid + ext;
				boolean image = contentType.startsWith("image");

				String path = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
				String uploadDir = UploadFile.UPLOAD_PATH + "/" + path + "/";
				new java.io.File(uploadDir).mkdirs();
				part.write(uploadDir + saveName);

				if (image) {
					try {
						net.coobird.thumbnailator.Thumbnails.of(new java.io.File(uploadDir + saveName))
							.size(150, 150)
							.toFile(uploadDir + "t_" + saveName);
					} catch (Exception e) {
						image = false;
					}
				}

				Attach attach = Attach.builder()
					.fileName(saveName)
					.originalName(fileName)
					.mimeType(contentType)
					.image(image ? "Y" : "N")
					.size(size)
					.path(path)
					.build();
				attachService.save(attach);

				AttachLink link = AttachLink.builder()
					.attachId(attach.getAttachId())
					.targetType("board")
					.targetId(board.getBoardId())
					.build();

				linkService.save(link);
			}
		}

		log.info("세션 로그인 ID: {}", loginId);
		resp.sendRedirect(req.getContextPath() + "/qna/mylist");
	}
}
	