package mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.Attach;
import domain.Board;
import domain.Reply;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class AttachMapperTest {

    private AttachMapper attachMapper;

    @BeforeEach
    public void setup() {
        SqlSession session = MybatisUtil.getSqlSession();
        attachMapper = session.getMapper(AttachMapper.class);
    }

    @Test
    @DisplayName("attach 저장 테스트")
    public void insertTest() {
        Attach attach = Attach.builder()
            .fileName("test-uuid.jpg")
            .originalName("original.jpg")
            .mimeType("image/jpeg")
            .image("Y")
            .size(12345L)
            .path("2025/07/07")
            .build();

        attachMapper.insert(attach);
        log.info("삽입된 attachId = {}", attach.getAttachId());
    }

    @Test
    @DisplayName("attach 조회 테스트")
    public void findTest() {
        Long id = 1L;
        Attach found = attachMapper.findById(id);
        log.info("조회된 attach: {}", found);
    }
}


