package domain.dto;

import java.net.URLDecoder;
import javax.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
@NoArgsConstructor
@AllArgsConstructor
public class Criteria { //페이징 처리 + 검색 조건 전달
//페이지 숫자 12개로 수정(10)
	private int page = 1;			// 현재 페이지 번호 (기본값 1)
	private int amount = 12;		// 한 페이지당 게시글 수 (기본값 10)
	private Long categoryId = 1L;		// 카테고리 번호
	private String type = "";		// 검색조건 (Title, Content)
	private String keyword = "";	// 검색어
	
	// 페이지, 게시글 개수, 카테고리 번호로 Cri 재설정
	public Criteria(int page, int amount, Long categoryId) {
		this.page = page;
		this.amount = amount;
		this.categoryId = categoryId;
	}
	
	// DB LIMIT SQL용 offset 설정
	public int getOffset() {
		int offset = amount * (page - 1);
		return offset;
	}
	// 검색용 타입분석 "TC" -> "T","C"
	public String[] getTypes() {
	    String[] arr = null;
	    if(type != null && !type.equals("")) {
	        arr = type.split("");
	    }
	    return arr;
	}

	public static Criteria init(HttpServletRequest req) {
		Criteria cri = new Criteria();
		try {
			cri.categoryId = Long.parseLong(req.getParameter("categoryId"));
			cri.page = Integer.parseInt(req.getParameter("page"));
			cri.amount = Integer.parseInt(req.getParameter("amount"));
			cri.type = req.getParameter("type");
			cri.keyword = URLDecoder.decode(req.getParameter("keyword"), "utf-8");
		} 
		catch (Exception e) {}
		return cri;
	}
	
	
	// 검색어 쿼리스트링으로 url에 담아서 가져가기
//	getQs가 원래 getQs3 categoryId 포함이었는데 잠깐 수정했습니다!
	public String getQs() {
		String[] strs = { "amount=" + amount, "type=" + type, "keyword=" + keyword};
		
		String str = String.join("&", strs);
		return str;
	}
	public String getQs2() {
		return getQs() + "&page=" + page; 
	}
	// 임시로 만들어 두었습니다!
	public String getQ3() {
		String[] strs = {"categoryId=" + categoryId, "amount=" + amount, "type=" + type, "keyword=" + keyword};
		
		String str = String.join("&", strs);
		return str;
	}
}