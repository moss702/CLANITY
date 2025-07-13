package controller.onedayclass.category;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.dto.Criteria;
import domain.dto.PageDto;
import domain.onedayClass.ClassSocialingCategory;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;
import service.ClassService;
import util.ParamUtil;

@Slf4j
@WebServlet("/categoryList")
public class categoryListPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		현재 필요없
//		OnedayClass onedayClass = ParamUtil.get(req, OnedayClass.class);
//		Long categoryId = Long.parseLong(req.getParameter("categoryId"));
//			서비스 호출
		ClassService service = new ClassService();
		Criteria cri = Criteria.init(req);
		log.info("Received categoryId: {}", cri.getCategoryId());  // categoryId 값 로그 출력

		List<ClassSocialingCategory> categories = service.getCategories();
		List<ClassSocialingCategory> parentCategories = categories.stream()
				.filter(ClassSocialingCategory::isType)
				.toList();
		log.info("categories: {}", categories);
		log.info("parentCategories: {}", parentCategories);
		// 소분류 리스트를 parentCategory 기준으로 그룹핑
		Map<String, List<ClassSocialingCategory>> categoryMap = categories.stream()
				.filter(c -> !c.isType())
				.collect(Collectors.groupingBy(ClassSocialingCategory::getParentCategory));

		for (ClassSocialingCategory parent : parentCategories) {
			String parentName = parent.getParentCategory();
			List<ClassSocialingCategory> children = categoryMap.getOrDefault(parentName, new ArrayList<>());

			// "전체" 항목 추가
			ClassSocialingCategory all = ClassSocialingCategory.builder()
					.categoryId(parent.getCategoryId())
					.parentCategory(parentName)
					.childCategory("전체")
					.type(false)
					.build();

			children.add(0, all); // 맨 앞에 삽입

			// 없던 항목이면 새로 넣어줌
			categoryMap.put(parentName, children);
		}
		
		Map<Long, ClassSocialingCategory> categoryById =
				categoryMap.values().stream()
						.flatMap(List::stream)
						.collect(Collectors.toMap(
								ClassSocialingCategory::getCategoryId,
								Function.identity()
						));
		log.info("categoryMap: {}", categoryMap);
		req.setAttribute("parentCategories", parentCategories);
//
		req.setAttribute("categoryMap", categoryMap);
		req.setAttribute("categoryById", categoryById);
		req.setAttribute("pageDto", new PageDto(cri, service.getCount(cri)));
		
		// 랜덤 배정
		List<OnedayClass> cards = service.classList(cri);
		Collections.shuffle(cards); // 리스트를 실제로 섞고
		req.setAttribute("cards", cards);

		// 페이지 불러오기 및 카드 불러오기		
		req.getRequestDispatcher("/WEB-INF/views/class/categoryList.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
