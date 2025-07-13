package controller.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import domain.Attach;
import domain.AttachLink;
import domain.Board;
import domain.dto.Criteria;
import domain.dto.PageDto;
import lombok.extern.slf4j.Slf4j;
import mapper.AttachLinkMapper;
import mapper.AttachMapper;
import service.BoardService;
import util.MybatisUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/board/list")
public class BoardList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    BoardService service = new BoardService();
	    Criteria cri = ParamUtil.get(req, Criteria.class);
	    log.info("{}", cri);

	    // 1. 게시글 목록
	    List<Board> boards = service.list(cri);
	    req.setAttribute("boards", boards);

	    // 2. 게시글 별 첨부파일 목록 가져오기
	    try (SqlSession session = MybatisUtil.getSqlSession()) {
	        AttachLinkMapper linkMapper = session.getMapper(AttachLinkMapper.class);
	        AttachMapper attachMapper = session.getMapper(AttachMapper.class);

	        Map<Long, List<Attach>> attachMap = new HashMap<>();

	        for (Board board : boards) {
	            Long boardId = board.getBoardId();

	            List<AttachLink> links = linkMapper.list("board", boardId);

	            List<Attach> fileList = new ArrayList<>();
	            for (AttachLink link : links) {
	                String uuid = link.getUuid(); // AttachLink에서 uuid 꺼냄
	                Attach file = attachMapper.selectOne(uuid);
	                if (file != null) {
	                    fileList.add(file);
	                }
	            }

	            attachMap.put(boardId, fileList);
	        }

	        req.setAttribute("attachMap", attachMap); // JSP에서 사용
	    }

	    // 3. 페이지 정보 전달
	    req.setAttribute("pageDto", new PageDto(cri, service.getCount(cri)));
	    req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
	}
}
