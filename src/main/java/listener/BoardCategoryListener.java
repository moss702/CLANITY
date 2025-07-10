package listener;

import domain.BoardCategory;
import domain.onedayClass.ClassSocialingCategory;
import lombok.extern.slf4j.Slf4j;
import service.BoardCategoryService;
import service.ClassSocialingCategoryService;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;

@WebListener
@Slf4j
public class BoardCategoryListener implements ServletContextListener {
	
	private static int listenerInitCount = 0;
	
	BoardCategoryService service = new BoardCategoryService();
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		listenerInitCount++;
		log.info("[Listener] contextInitialized() 호출 {}회", listenerInitCount);

		ServletContext sc = sce.getServletContext();
		
		List<BoardCategory> list = service.list();

		// 자바 객체형
		sc.setAttribute("boardCategories", list);

		
		log.info("BoardCategory 초기화 완료");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		sc.removeAttribute("boardCategories");
	}
	
	
}
