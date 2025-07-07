package mapper;

import org.apache.ibatis.annotations.Mapper;
import domain.AttachLink;

@Mapper
public interface AttachLinkMapper {
	
    int insert(AttachLink link);
    
}
