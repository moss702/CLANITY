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
                .applyId(10L)
                .status(ApplyStatus.PENDING)
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

    @Test
    @DisplayName("✅ [PENDING] 상태의 신청 목록과 첨부파일 확인")
    public void testSelectWithAttach_pending() {

        List<BusinessApply> list = businessApplyMapper.selectWithAttach("PENDING");
        System.out.println("=== [PENDING] 목록 ===");
        for (BusinessApply apply : list) {
            System.out.println(apply.getApplyId() + " | " + apply.getNickname() + " | " + apply.getStatus());
            if (apply.getAttachs() != null) {
                apply.getAttachs().forEach(a ->
                        System.out.println("   - " + a.getOrigin() + " (" + a.getUuid() + ")")
                );
            }
        }

    }

    @Test
    @DisplayName("✅ 전체 신청 목록 조회")
    public void testSelectWithAttach_all() {
        List<BusinessApply> list = businessApplyMapper.selectWithAttach(null);

        System.out.println("=== 전체 목록 ===");
        for (BusinessApply apply : list) {
            System.out.println(apply.getApplyId() + " | " + apply.getNickname() + " | " + apply.getStatus());
        }

    }

    @Test
    @DisplayName("✅ [APPROVED] 승인된 신청 목록 확인")
    public void testSelectWithAttach_approved() {

        List<BusinessApply> list = businessApplyMapper.selectWithAttach("APPROVED");

        System.out.println("=== [APPROVED] 목록 ===");
        for (BusinessApply apply : list) {
            System.out.println(apply.getApplyId() + " | " + apply.getNickname() + " | " + apply.getStatus());
        }

    }

    @Test
    @DisplayName("✅ [REJECTED] 거절된 신청 목록 확인")
    public void testSelectWithAttach_rejected() {

        List<BusinessApply> list = businessApplyMapper.selectWithAttach("REJECTED");
        System.out.println("=== [REJECTED] 목록 ===");
        for (BusinessApply apply : list) {
            System.out.println(apply.getApplyId() + " | " + apply.getNickname() + " | " + apply.getStatus());
        }

    }
}
