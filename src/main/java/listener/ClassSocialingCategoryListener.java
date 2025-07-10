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
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		log.info("[Listener] contextDestroyed() 호출 - 종료 정리 작업 시작");
		ServletContext sc = sce.getServletContext();
		sc.removeAttribute("csc");
		sc.removeAttribute("cscJson");
		log.info("[Listener] contextDestroyed() 종료 - 속성 제거 및 정리 완료");
	}
	
	
}
