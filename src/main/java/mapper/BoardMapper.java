package mapper;

import java.util.List;

import domain.Board;
import domain.dto.Criteria;

public interface BoardMapper {

	List<Board> list(Criteria cri);			// 전체조회
	Board selectOne(long boardId);			// 단일조회
	
	void insert(Board board);				// 게시글 등록
	void update(Board board);				// 게시글 수정
	void delete(Long boardId);				// 게시글 삭제

	long getCount(Criteria cri);			// 전체 게시글 개수
	void increaseCnt(Long boardId);			// 조회수
	
	void updateGrpMyself(Board board);		// 답글 그룹번호 재설정
	void updateSeqIncrease(Board parent);	// 답글 순서 재설정
	void insertChild(Board board);			// 답글 등록됨

	//	int selectMaxSeq(Board parent);			// 답글 작성 위치 확인
	
}
