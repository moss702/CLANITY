//package controller.open;
//
//import java.io.IOException;
//import java.sql.Date;
//import java.time.LocalDate;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import domain.onedayClass.ClassInfo;
//import domain.onedayClass.ClassOpen;
//import domain.onedayClass.OnedayClass;
//import lombok.Builder;
//import lombok.extern.slf4j.Slf4j;
//import service.ClassService;
//import util.HikariCPUtil;
//
//@Slf4j
//@WebServlet("/openClassRegister/successRegister")
//public class OnedayClassServletSuccess extends HttpServlet {
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		//  세션 체크 (나중에 정보등록 jsp 만들기)
//		req.getRequestDispatcher("/WEB-INF/views/openClassRegister/successRegister.jsp").forward(req, resp);
//		log.info("{}", HikariCPUtil.getDataSource());
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		HttpSession session = req.getSession();
//		
//		// 값 가져오기 get
//		
//       
//        // 임시 비지니스 아이디(멤버 연결)
////        Long businessId = 222L; 
//        // --- 클래스 정보 수집 ---
//        ClassInfo classInfo = ClassInfo.builder()
//            .businessId(222L)
//            .categoryId(1004L)
//            .title((String) session.getAttribute("title"))
//            .description((String) session.getAttribute("description"))
//            .description2((String) session.getAttribute("description2"))
//            .duration((Integer) session.getAttribute("duration"))
//            .price((Integer) session.getAttribute("price"))
//            .discount((Integer) session.getAttribute("discount"))
//            .discountPrice((Integer) session.getAttribute("discountPrice"))
//            .instructorName((String) session.getAttribute("instructorName"))
//            .difficulty((String) session.getAttribute("difficulty"))
//            .curriculum((String) session.getAttribute("curriculum"))
//            .hostIntroduction((String) session.getAttribute("hostIntroduction"))
//            .thumbnailImages((String) session.getAttribute("thumbnailImages"))
//            .detailImages((String) session.getAttribute("detailImages"))
//            .instructorImageUrl((String) session.getAttribute("instructorImageUrl"))
//            .address((String) session.getAttribute("address"))
//            .region((String) session.getAttribute("region"))
//            .classType((String) session.getAttribute("classType"))
//            .url((String) session.getAttribute("url"))
//            .createdAt(Date.valueOf(LocalDate.now()))
//            .build();
//
//        // --- 오픈 정보 수집 ---
//        ClassOpen open = new ClassOpen();
//        open.setMinParticipants((Integer) session.getAttribute("minParticipants"));
//        open.setMaxParticipants((Integer) session.getAttribute("maxParticipants"));
//        open.setStatus(true); // 기본값
//
//        // --- 서비스 호출 ---
//        ClassService service = new ClassService();
////        service.register(classInfo, open);
//		 
//		 req.setAttribute("classId", classInfo.getClassId());
//		 req.getRequestDispatcher("/WEB-INF/views/openClassRegister/successRegister.jsp").forward(req, resp);
//	}
//
//}
