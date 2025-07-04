package service;

import org.apache.ibatis.session.SqlSession;
import domain.onedayClass.ClassInfo;
import util.MybatisUtil;
import lombok.extern.slf4j.Slf4j;
import mapper.ClassInfoMapper;

@Slf4j
public class ClassService {

    // 등록
    public void register(ClassInfo classInfo) {
        // try-with-resources: 사용 후 자동으로 세션 닫힘
        try (SqlSession session = MybatisUtil.getSqlSession()) {
            ClassInfoMapper mapper = session.getMapper(ClassInfoMapper.class);
            mapper.insert(classInfo);
            session.commit();
            log.info("클래스 등록 성공: {}", classInfo);
        } catch (Exception e) {
            log.error("클래스 등록 실패", e);
            throw new RuntimeException("클래스 등록 중 오류 발생", e); // 서블릿에서 감지 가능
        }
    }

}