package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import domain.Attach;
import domain.AttachLink;

@Mapper
public interface AttachLinkMapper {
    void insert(AttachLink link);			// attach_link 정보 DB저장
    List<AttachLink> findByTarget(AttachLink link);
    void deleteByTarget(AttachLink link);	// 게시글 삭제시 attachLink 삭제
    int countLinkAttachId (Long attachId);	// attach도 삭제하기 위해 연결된 attachId 개수 조회
}
