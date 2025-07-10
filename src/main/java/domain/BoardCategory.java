package domain;

import org.apache.ibatis.type.Alias;

import domain.en.CategoryStatus;
import domain.en.CategoryType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("boardcategory")
public class BoardCategory {
	private Long categoryId;       // 카테고리 고유 ID
	private String name;           // 카테고리 이름 (ex. 이름, 소속, 클래스/소셜링/공지/qna/후기)
	private CategoryType type;     // 게시판 형태
	private CategoryStatus active; // 게시판의 활성 여부
	private String desc; 	       // 카테고리 부연 설명
}