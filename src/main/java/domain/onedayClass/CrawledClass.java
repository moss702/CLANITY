package domain.onedayClass;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CrawledClass {
	// 나중에 dto로 만들면 작성하고 아니면 삭제
    private String title;
    private String url;
}