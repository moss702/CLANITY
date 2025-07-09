package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import domain.Attach;

@Mapper
public interface AttachMapper {
    void insert(Attach attach);			// attach 정보 DB저장

	List<Attach> list(Long boardId); //특정 게시글의 첨부파일 
	Attach selectOne(String uuid);
	void delete(String uuid);
	void deleteByBno(Long bno);
	
	List<Attach> selectYesterdayList();

}
