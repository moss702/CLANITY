package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import domain.Attach;
import domain.AttachLink;

@Mapper
public interface AttachLinkMapper {
    void insert(AttachLink link);			// attach_link 정보 DB저장
    List<Attach> attachList(@Param("targetType") String targetType, @Param("targetId") Long targetId); // 게시판타입, 게시글번호에 첨부된 첨부파일 list 조회
    List<AttachLink> findByTarget(@Param("targetType") String targetType, @Param("targetId") Long targetId);
    void deleteByTarget(@Param("targetType") String targetType, @Param("targetId") Long targetId);	// 게시글 삭제시 attachLink 삭제
    int countLinkAttachId (Long attachId);	// attach도 삭제하기 위해 연결된 attachId 개수 조회
}
