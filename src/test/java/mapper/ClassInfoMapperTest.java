package mapper;



import com.google.gson.GsonBuilder;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import util.MybatisUtil;

@Slf4j
public class ClassInfoMapperTest {

    private final ClassSocialingCategoryMapper mapper = MybatisUtil.getSqlSession().getMapper(ClassSocialingCategoryMapper.class);


// json 리스너 관련 테스트

    @Test
    @DisplayName("클래스 지역 조회 (JSON 출력)")
    public void classTest2() {
        String json = new GsonBuilder()
            .setPrettyPrinting()
            .create()
            .toJson(mapper.listRegion());
//        log.info(json);
    }
//    @Test
//    @DisplayName("클래스 지역 조회")
//    public void regionTest() {
//        String json = new GsonBuilder()
//            .setPrettyPrinting()
//            .create()
//            .toJson(mapper.listRegion());
//        log.info(json);
//    }
//
//    @Test
//    @DisplayName("클래스 카테고리 전체 조회 (JSON)")
//    public void regionTestJson() {
//        String json = new GsonBuilder()
//            .setPrettyPrinting()
//            .create()
//            .toJson(mapper.list());
//        log.info(json);
//    }
  
    // 클래스 리스트 목록 조회 테스트 (일단 전체 조회 먼저 하고) 카테고리 별 목록 조회

//    ClassInfoMapper classInfoMapper = MybatisUtil.getSqlSession().getMapper(ClassInfoMapper.class);

//    @Test
//    @DisplayName("클래스 카테고리 조회")
//    public void classTest() {
//        mapper.list().forEach(c -> log.info("Category: {}", c));
//    }

    
//    	@Test
//    	@DisplayName("클래스 전체 목록 조회")
//    	public void classListTest() {
//    		List<OnedayClass> list = classInfoMapper.listClass();
//
//    		list.forEach(c -> log.info("Class: {}", c));
//    	}
//// 나중에 검색창이나 그런 곳에서 사용 예정
//    	@Test
//    	@DisplayName("클래스에서 카테고리  단일조회")
//    	public void selectOneTest() {
//    		Long categoryId = 1004L;
//    		List<OnedayClass> list = classInfoMapper.listOnedayClass(categoryId);
//    		list.forEach(c -> log.info("Class: {}", c));

//    	}


}
