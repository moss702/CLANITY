package mapper;

import org.apache.ibatis.annotations.Mapper;
import domain.Attach;

@Mapper
public interface AttachMapper {
	void insert(Attach attach);
	
//	List<Attach> list(); //특정 게시글의 첨부파일 
	Attach selectOne(String uuid);
	void delete(String uuid);
//	void deleteByBno(Long bno);
}
