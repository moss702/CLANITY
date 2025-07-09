package listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import domain.onedayClass.ClassSocialingCategory;
import lombok.extern.slf4j.Slf4j;
import service.ClassSocialingCategoryService;

@WebListener
@Slf4j
public class ClassSocialingCategoryListener implements ServletContextListener {
	
	private static int listenerInitCount = 0;
	
	ClassSocialingCategoryService service = new ClassSocialingCategoryService();
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		listenerInitCount++;
		log.info("[Listener] contextInitialized() 호출 {}회", listenerInitCount);

		
		
		ServletContext sc = sce.getServletContext();
		
		List<ClassSocialingCategory> list = service.listCategory();
		String json = service.listCategory2Json();
		
		
		
		
		// 자바 객체형
		sc.setAttribute("csc", list);
		//json 변환형
		sc.setAttribute("cscJson", json);
		
		
		log.info("ClassSocialingCategory 초기화 완료");
		log.info("[Listener] 리스트 사이즈: {}, JSON 길이: {} bytes", list.size(), json.length());
	}
}
