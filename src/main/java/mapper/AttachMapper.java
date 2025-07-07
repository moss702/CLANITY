package mapper;

import org.apache.ibatis.annotations.Mapper;
import domain.Attach;

@Mapper
public interface AttachMapper {
    void insert(Attach attach);			// attach 정보 DB저장
    void delete(Long attachId);			// attach 정보 DB삭제
    Attach findById(Long attachId);		// 단일 조회
}
