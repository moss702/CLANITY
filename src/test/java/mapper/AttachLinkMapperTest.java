package mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.Attach;
import domain.AttachLink;
import domain.Board;
import domain.Reply;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class AttachLinkMapperTest {
	private AttachLinkMapper linkMapper;
	private SqlSession session;

	@BeforeEach // 세션 열고 매퍼 인터페이스 가져옴
	public void setup() {
		session = MybatisUtil.getSqlSession();
		linkMapper = session.getMapper(AttachLinkMapper.class);
	}

	@AfterEach // 테스트 메서드 실행 후 세션 닫기
	public void teardown() {
		session.close();
	}

	@Test
	@DisplayName("AttachLink insert 테스트")
	public void insertTest() {
		AttachLink link = AttachLink.builder().uuid("").linkType("board").lno(57L) // 실제 첨부파일이 존재하는것으로 테스트할것.
				.build();

		linkMapper.insert(link);
		log.info("Insert 성공");
		session.commit();
	}

	@Test
	@DisplayName("AttachLink findByTarget 테스트")
	public void testList() {
		List<AttachLink> links = linkMapper.list(AttachLink.builder().linkType("board").lno(83L).build());
		links.forEach(l -> log.info("link = {}", l));
	}

}
