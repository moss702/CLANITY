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

import org.apache.ibatis.session.SqlSession;

import controller.attach.UploadFile;
import domain.Attach;
import domain.AttachLink;
import domain.Board;
import domain.Member;
import domain.en.VisibleLevel;
import lombok.extern.slf4j.Slf4j;
import mapper.AttachLinkMapper;
import service.AttachLinkService;
import service.AttachService;
import service.BoardService;
import service.UploadService;
import util.MybatisUtil;

@WebServlet("/qna/attachList")
@MultipartConfig
@Slf4j
public class QnaAttachListController extends HttpServlet{
	// qna의 attachList * 사용 : qna.~

	  @Override
	  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
		    String boardIdStr = req.getParameter("boardId");

		    // ✅ boardId 수신 로그
		    log.info("전달된 boardId 파라미터: {}", boardIdStr);

		    if (boardIdStr == null || boardIdStr.isBlank()) {
		        resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		        resp.getWriter().write("잘못된 요청입니다: boardId 누락");
		        return;
		    }
		    
 
	      Long boardId = Long.valueOf(boardIdStr);
		  
	      SqlSession session = MybatisUtil.getSqlSession();
	      AttachLinkMapper linkMapper = session.getMapper(AttachLinkMapper.class);
	      List<Attach> attachList = linkMapper.attachList("board", boardId);

	      req.setAttribute("attachList", attachList);
	      req.getRequestDispatcher("/WEB-INF/views/qna/attach_list.jsp").forward(req, resp);
	  }
	}