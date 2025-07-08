package mapper;


import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.google.gson.GsonBuilder;

import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class ClassInfoMapperTest {

    private ClassSocialingCategoryMapper mapper = MybatisUtil.getSqlSession().getMapper(ClassSocialingCategoryMapper.class);

    @Test
    @DisplayName("클래스 카테고리 조회")
    public void classTest() {
        mapper.list().forEach(c -> log.info("Category: {}", c));
    }

    @Test
    @DisplayName("클래스 지역 조회 (JSON 출력)")
    public void classTest2() {
        String json = new GsonBuilder()
            .setPrettyPrinting()
            .create()
            .toJson(mapper.listRegion());
        log.info(json);
    }

    @Test
    @DisplayName("클래스 지역 조회")
    public void regionTest() {
        String json = new GsonBuilder()
            .setPrettyPrinting()
            .create()
            .toJson(mapper.listRegion());
        log.info(json);
    }

    @Test
    @DisplayName("클래스 카테고리 전체 조회 (JSON)")
    public void regionTestJson() {
        String json = new GsonBuilder()
            .setPrettyPrinting()
            .create()
            .toJson(mapper.list());
        log.info(json);
    }
}
