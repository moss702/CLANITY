package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextPathLisnter implements ServletContextListener{ // 톰캣 서버 구동시 단 한번만 일어나는 구간

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("cp", sc.getContextPath());
	}
}
