package domain.onedayClass;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CrawledClass {
    private String title;
    private String url;
}