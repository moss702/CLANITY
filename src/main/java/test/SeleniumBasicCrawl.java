package test;

import domain.onedayClass.OnedayClass;
import io.github.bonigarcia.wdm.WebDriverManager;
import mapper.OnedayClassMapper;
import org.apache.ibatis.session.SqlSession;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.*;
import util.MybatisUtil;

import java.io.InputStream;
import java.net.URL;
import java.nio.file.*;
import java.time.Duration;
import java.util.List;
import java.util.stream.Collectors;

public class SeleniumBasicCrawl {
    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        JavascriptExecutor js = (JavascriptExecutor) driver;

        SqlSession session = MybatisUtil.getSqlSession(false); // 수동 커밋
        OnedayClassMapper mapper = session.getMapper(OnedayClassMapper.class);
        List<OnedayClass> classList = mapper.selectAllUrls();

        for (OnedayClass onedayClass : classList) {
            try {
                String url = onedayClass.getUrl();
                driver.get(url);
                js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
                Thread.sleep(1500);

                String classId = url.substring(url.lastIndexOf("/") + 1);
                String basePath = "class_images/" + classId;
                String thumbPath = basePath + "/thumbnail_image";
                String detailPath = basePath + "/detail_images";
                String instructorPath = basePath + "/instructor_image_url";

                Files.createDirectories(Paths.get(thumbPath));
                Files.createDirectories(Paths.get(detailPath));
                Files.createDirectories(Paths.get(instructorPath));

                // 썸네일 이미지
                List<String> thumbList = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("div.slick-list .slick-track div img")))
                        .stream().map(e -> e.getAttribute("src"))
                        .filter(src -> src.startsWith("http"))
                        .distinct().collect(Collectors.toList());
                saveImages(thumbList, thumbPath, classId);
                onedayClass.setThumbnailImages(String.join(",", thumbList));

                // 상세 이미지
                List<String> detailList = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("#topleft img")))
                        .stream().map(e -> e.getAttribute("src"))
                        .filter(src -> src.startsWith("http"))
                        .distinct().collect(Collectors.toList());
                saveImages(detailList, detailPath, classId);
                onedayClass.setDetailImages(String.join(",", detailList));

                // 강사 이미지
                List<String> instructorList = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("#topleft > div:nth-of-type(6) > div img")))
                        .stream().map(e -> e.getAttribute("src"))
                        .filter(src -> src.startsWith("http"))
                        .distinct().collect(Collectors.toList());
                saveImages(instructorList, instructorPath, classId);
                onedayClass.setInstructorImageUrl(String.join(",", instructorList));

                // 기타 정보 크롤링
                onedayClass.setDescription(getTextSafe(driver, wait, "#topleft > div:nth-of-type(4) > div > div:nth-of-type(2)"));
                onedayClass.setDescription2(getTextSafe(driver, wait, "#topleft > div:nth-of-type(4) > div > div:nth-of-type(4)"));
                onedayClass.setCurriculum(getTextSafe(driver, wait, "#topleft > div:nth-of-type(5) > div > div:nth-of-type(2)"));
                onedayClass.setInstructorName(getTextSafe(driver, wait, "#topleft > div:nth-of-type(6) > div > div:nth-of-type(2) p:nth-of-type(2)"));
                onedayClass.setHostIntroduction(getTextSafe(driver, wait, "#topleft > div:nth-of-type(6) > div > div:nth-of-type(3)"));
                onedayClass.setAddress(getTextSafe(driver, wait, "#topleft > div:nth-of-type(7) > div > p"));
                onedayClass.setClassType(getTextSafe(driver, wait, "li.css-15dw8ms:nth-of-type(1) p"));
                onedayClass.setDifficulty(getTextSafe(driver, wait, "li.css-15dw8ms:nth-of-type(4) p"));
                onedayClass.setRegion(getTextSafe(driver, wait, "li.css-15dw8ms:nth-of-type(3) p"));
                onedayClass.setDuration(120); // 예시 고정값

                mapper.update(onedayClass);
                session.commit(); // 명시적 커밋
                System.out.println("✔ 업데이트 완료: " + onedayClass.getTitle());

            } catch (Exception e) {
                session.rollback(); // 롤백 추가
                System.out.println("✘ 오류 발생: " + onedayClass.getUrl());
                e.printStackTrace();
            }
        }

        session.close(); // 세션 종료
        driver.quit();
    }

    private static void saveImages(List<String> imageList, String folder, String classId) {
        int index = 1;
        for (String url : imageList) {
            try (InputStream in = new URL(url).openStream()) {
                String ext = url.contains(".png") ? ".png" : url.contains(".webp") ? ".webp" : ".jpg";
                Path out = Paths.get(folder, index++ + ext);
                Files.copy(in, out, StandardCopyOption.REPLACE_EXISTING);
            } catch (Exception e) {
                logBroken(url, classId);
            }
        }
    }

    private static void logBroken(String url, String classId) {
        try {
            Path dir = Paths.get("class_images", classId, "broken_images");
            Files.createDirectories(dir);
            Path log = dir.resolve("broken_urls.txt");
            Files.writeString(log, url + System.lineSeparator(), StandardOpenOption.CREATE, StandardOpenOption.APPEND);
        } catch (Exception ignore) {
        }
    }

    private static String getTextSafe(WebDriver driver, WebDriverWait wait, String cssSelector) {
        try {
            return wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(cssSelector))).getText().trim();
        } catch (Exception e) {
            return "";
        }
    }
}
