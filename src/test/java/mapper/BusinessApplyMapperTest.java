package mapper;

import domain.BusinessApply;
import domain.en.ApplyStatus;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import util.MybatisUtil;

import java.util.List;

@Slf4j
public class BusinessApplyMapperTest {

    private BusinessApplyMapper businessApplyMapper = MybatisUtil.getSqlSession().getMapper(BusinessApplyMapper.class);

    @Test
    @DisplayName("사업자 신청 등록")
    void insert() {
        BusinessApply apply = BusinessApply.builder()
                .memberId(1008L)
                .email("tester1007@example.com")
                .nickname("테스터1007")
                .build();

        int result = businessApplyMapper.insert(apply);
        log.info("{}",result);
    }

    @Test
    @DisplayName("전체 신청 목록을 조회")
    void list() {
        List<BusinessApply> list = businessApplyMapper.list();

        log.info("{}",list);
    }

    @Test
    @DisplayName("applyid ID로 신청 정보조회")
    void findById() {
        BusinessApply result = businessApplyMapper.findById(3L);
        log.info("{}",result);
    }

    @Test
    @DisplayName("이메일로 신청 정보조회")
    void findByEmail() {
        List<BusinessApply> result = businessApplyMapper.findByEmail("tester1006@example.com");
        log.info("{}",result);
    }

    @Test
    @DisplayName("신청 상태를 승인으로 변경")
    void update() {
        BusinessApply apply = BusinessApply.builder()
                .applyId(1L)
                .status(ApplyStatus.APPROVED)
                .adminId(1L)
                .build();

        int result = businessApplyMapper.update(apply);
        log.info("{}",result);
    }

    @Test
    @DisplayName("승인 대기중(PENDING) 상태의 신청만 조회할 수 있어야 한다")
    void listPending() {
        List<BusinessApply> results = businessApplyMapper.listPending();
        log.info("{}",results);
    }
}
