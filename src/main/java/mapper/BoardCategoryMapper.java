package mapper;

import domain.BoardCategory;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BoardCategoryMapper {
	@Select("select category_id categoryId, name, type, active, `desc` from board_category where active = 'ACTIVE'")
	List<BoardCategory> list();
}
