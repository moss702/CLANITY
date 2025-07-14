package mapper;

import com.google.gson.GsonBuilder;

import domain.Attach;
import domain.AttachLink;
import domain.dto.Criteria;
import domain.onedayClass.ClassOpen;
import domain.onedayClass.OnedayClass;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import util.MybatisUtil;

@Slf4j
public class ClassInfoMapperTest {
	private final ClassInfoMapper classInfoMapper = MybatisUtil.getSqlSession().getMapper(ClassInfoMapper.class);
	private final AttachMapper attachMapper = MybatisUtil.getSqlSession().getMapper(AttachMapper.class);
	private final AttachLinkMapper attachLinkMapper = MybatisUtil.getSqlSession().getMapper(AttachLinkMapper.class);

	private final ClassSocialingCategoryMapper mapper = MybatisUtil.getSqlSession()
			.getMapper(ClassSocialingCategoryMapper.class);

// json 리스너 관련 테스트

	@Test
	@DisplayName("클래스 지역 조회 (JSON 출력)")
	public void classTest2() {
		String json = new GsonBuilder().setPrettyPrinting().create().toJson(mapper.listRegion());
//        log.info(json);
	}
//    @Test
//    @DisplayName("클래스 지역 조회")
//    public void regionTest() {
//        String json = new GsonBuilder()
//            .setPrettyPrinting()
//            .create()
//            .toJson(mapper.listRegion());
//        log.info(json);
//    }
//
//    @Test
//    @DisplayName("클래스 카테고리 전체 조회 (JSON)")
//    public void regionTestJson() {
//        String json = new GsonBuilder()
//            .setPrettyPrinting()
//            .create()
//            .toJson(mapper.list());
//        log.info(json);
//    }

	// 클래스 리스트 목록 조회 테스트 (일단 전체 조회 먼저 하고) 카테고리 별 목록 조회


	@Test
	@DisplayName("클래스 카테고리 조회")
	public void classTest() {
		mapper.list().forEach(c -> log.info("Category: {}", c));
	}

	@Test
	@DisplayName("클래스  목록 조회")
	public void testListClassDetailPage() {

		Long classId = 11628L;
		Long openId = 10060L;

		OnedayClass result = classInfoMapper.listClassDetailPage(OnedayClass.builder().classId(classId).openId(openId).build());
		log.info("{}", result);

	}
//// 나중에 검색창이나 그런 곳에서 사용 예정
//    	@Test
//    	@DisplayName("클래스에서 카테고리  단일조회")
//    	public void selectOneTest() {
//    		Long categoryId = 1004L;
//    		List<OnedayClass> list = classInfoMapper.listOnedayClass(categoryId);
//    		list.forEach(c -> log.info("Class: {}", c));

//    	}
	@Test
	public void testListClass() {
		OnedayClass oc = classInfoMapper.listClass(new Criteria()).stream().findFirst().orElse(null);
		log.info("{}", oc);
	}

//	@Test 1회성 테스트 코드
//	public void testFileSystemInfo2Database() {
//		List<File> files = new ArrayList<>(Arrays.asList(new File("N:\\개인\\class_images\\class_images").listFiles()));
//		boolean flag = true;
//		for(File file : files) {
//			String originCode = file.getName();
//			if(originCode.equals("6764ebedec89ef2de1fe09da")) {
//				flag = false;
//			}
//			if(flag) {continue;}
//			log.info("origin_code: {}", originCode);
//			List<File> subDirs = Arrays.asList(file.listFiles());
//			for(File subDir : subDirs) {
//				if(subDir.isDirectory()) {
//					List<File> imageFiles = Arrays.asList(subDir.listFiles());
//					int count = 0;
//					for(File img : imageFiles) {
//						String ext = img.toString().substring(img.toString().lastIndexOf("."));
//						String uuid = UUID.randomUUID().toString() + ext;
//                        try {
//                            Attach attach = Attach.builder()
//                                    .uuid(uuid)
//                                    .origin(img.getName())
//                                    .mimeType(Files.probeContentType(img.toPath()))
//									.image(true)
//									.path(img.getAbsolutePath().replace("\\", "/").replace("N:/개인/class_images/", "").replace("/"+img.getName(), ""))
//									.odr(count++)
//                                    .build();
//							log.info("{}", attach);
//							// attachMapper에서 insert
//							attachMapper.insert(attach);
//
//							Long classId = classInfoMapper.findClassId(originCode);
//							AttachLink attachLink = AttachLink.builder()
//									.uuid(uuid)
//									.linkType("class_crawling")
//									.lno(classId)
//									.build();
//							attachLinkMapper.insert(attachLink);
//                        } catch (IOException e) {
//							log.error(e.getMessage() + "::" + originCode);
//                            throw new RuntimeException(e);
//
//                        }
//					}
//				}
//			}
//		};
//	}

//	@Test 1회성
	public void insertClassOpenBatch() {
		List<Long> classIds = classInfoMapper.findAllClassIds();
		List<ClassOpen> batchList = new ArrayList<>();
		Random random = new Random();
		LocalDate today = LocalDate.now();

		for (Long classId : classIds) {
			int daysOffset = random.nextInt(30);
			LocalDate date = today.plusDays(daysOffset);

			int hour = 8 + random.nextInt(8); // 8 ~ 15
			LocalTime start = LocalTime.of(hour, 0);
			LocalTime end = start.plusHours(2);

			int max = (random.nextInt(9) + 2) * 5;
			int min = random.nextInt(9) + 2;
			int price = (random.nextInt(17) + 4) * 5000;

			ClassOpen open = ClassOpen.builder()
					.masterId(classId)
					.scheduleDate(date)
					.startTime(start)
					.endTime(end)
					.maxParticipants(max)
					.minParticipants(min)
					.price(price)
					.status(true)
					.isAvailable(true)
					.build();

			batchList.add(open);
		}

		classInfoMapper.batchInsert(batchList); // 한방에 1400건 insert
	}


}
