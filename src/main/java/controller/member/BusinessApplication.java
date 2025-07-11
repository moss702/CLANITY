package controller.member;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import domain.Attach;
import domain.BusinessApply;
import lombok.extern.slf4j.Slf4j;
import service.BusinessApplyService;
import util.AlertUtil;
import util.ParamUtil;

@Slf4j
@WebServlet("/mypage/application")
public class BusinessApplication extends HttpServlet{@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.getRequestDispatcher("/WEB-INF/views/mypage/businessapplication.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("dopost 도착");
		BusinessApplyService service = new BusinessApplyService();

		String encodedStr = req.getParameter("encodedStr");
		Type type = new TypeToken<List<Attach>>() {}.getType();
		List<Attach> list = new Gson().fromJson(encodedStr, type);
		if(list == null) {
			list = new ArrayList<Attach>();
		}
		log.info("{}", list);



		BusinessApply apply = ParamUtil.get(req, BusinessApply.class);
		apply.setAttachs(list);
		log.info("{}", apply);
		int result = service.insert(apply);


		if(result > 0) {
			AlertUtil.redirectAlert("신청이 등록되었습니다", "/mypage/application","green", req, resp);
		}else {
			AlertUtil.redirectAlert("신청중 오류가 발생하였습니다", "/mypage/application","red", req, resp);
		}



	}
	
	
}
