package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import lombok.extern.slf4j.Slf4j;
import service.ClassSocialingCategoryService;

@WebListener
@Slf4j
public class ClassSocialingCategoryListener implements ServletContextListener {
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ClassSocialingCategoryService service = new ClassSocialingCategoryService();
		
		
		ServletContext sc = sce.getServletContext();
		
		// 자바 객체형
		sc.setAttribute("csc", service.listCategory());
		
		//json 변환형
		sc.setAttribute("cscJson", service.listCategory2Json());
		
		log.info("ClassSocialingCategory 초기화 완료");
	}
}
