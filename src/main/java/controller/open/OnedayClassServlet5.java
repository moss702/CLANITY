package controller.open;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.onedayClass.ClassInfo;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import util.HikariCPUtil;

@Slf4j
@WebServlet("/openClassRegister/open5")
public class OnedayClassServlet5 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션 체크 (나중에 정보등록 jsp 만들기)
		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/open5.jsp").forward(req, resp);
		log.info("{}", HikariCPUtil.getDataSource());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 수집

		req.setCharacterEncoding("UTF-8");
		try {// 입력값 수집
			String priceStr = req.getParameter("price");
			String discountStr = req.getParameter("discount");
			String discountPriceStr = req.getParameter("discountPrice");
			String minParticipantsStr = req.getParameter("minParticipants");
			String maxParticipantsStr = req.getParameter("maxParticipants");

			if (priceStr == null || discountStr == null || discountPriceStr == null || minParticipantsStr == null
					|| maxParticipantsStr == null || priceStr.isEmpty() || discountStr.isEmpty()
					|| discountPriceStr.isEmpty() || minParticipantsStr.isEmpty() || maxParticipantsStr.isEmpty()) {

				req.setAttribute("error", "모든 항목을 입력해주세요.");
				req.getRequestDispatcher("/WEB-INF/views/openClassRegister/successRegister.jsp").forward(req, resp);
				return;
			}

			// 파라미터 수집 (예외처리/ 숫자)
			int price = Integer.parseInt(priceStr);
			int discount = Integer.parseInt(discountStr);
			int discountPrice = Integer.parseInt(discountPriceStr);
			int minParticipants = Integer.parseInt(minParticipantsStr);
			int maxParticipants = Integer.parseInt(maxParticipantsStr);

			// 값 저장 나중에 오픈 2, 3, 4 이런식으로 사용
			HttpSession session = req.getSession();
			session.setAttribute("price", price);
			session.setAttribute("discount", discount);
			session.setAttribute("discountPrice", discountPrice);
			session.setAttribute("minParticipants", minParticipants);
			session.setAttribute("maxParticipants", maxParticipants);

			// 다음 페이지 이동
			req.getRequestDispatcher("/WEB-INF/views/openClassRegister/successRegister.jsp").forward(req, resp);

		} catch (Exception e) {
			log.error("숫자 변환 오류: {}", e.getMessage());
			req.setAttribute("error", "숫자 입력이 올바르지 않습니다.");
			req.getRequestDispatcher("/WEB-INF/views/openClassRegister/successRegister.jsp").forward(req, resp);

		}
	}
}
