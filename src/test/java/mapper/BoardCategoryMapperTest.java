package mapper;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import util.MybatisUtil;

@Slf4j
public class BoardCategoryMapperTest {
    private final BoardCategoryMapper mapper = MybatisUtil.getSqlSession().getMapper(BoardCategoryMapper.class);

    @Test
    public void test1() throws Exception {
        mapper.list().forEach(a -> log.info("{}", a));
    }
}
