package test;

import java.io.InputStream;
import java.net.URL;
import java.nio.file.*;
import java.time.Duration;
import java.util.List;
import java.util.stream.Collectors;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.*;

import io.github.bonigarcia.wdm.WebDriverManager;

public class ImageSave {
    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        JavascriptExecutor js = (JavascriptExecutor) driver;

        try {
            String url = "https://mochaclass.com/class/637f1b076cb8e10d7646be88";
            driver.get(url);
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(1500); // 스크롤 로딩

            // 클래스 ID
            String classId = url.substring(url.lastIndexOf("/") + 1);
            String baseFolder = "class_images/" + classId;
            String thumbnailPath = baseFolder + "/thumbnail_image";
            String detailPath = baseFolder + "/detail_images";
            String instructorPath = baseFolder + "/instructor_image_url";
            Files.createDirectories(Paths.get(thumbnailPath));
            Files.createDirectories(Paths.get(detailPath));
            Files.createDirectories(Paths.get(instructorPath));

            // 썸네일 이미지
            List<String> thumbnailImages = wait
                .until(ExpectedConditions.presenceOfAllElementsLocatedBy(
                        By.cssSelector("div.slick-list .slick-track div img")))
                .stream().map(e -> e.getAttribute("src"))
                .distinct().collect(Collectors.toList());

            int idx = 1;
            for (String img : thumbnailImages) {
                downloadImage(img, thumbnailPath, classId, idx++);
            }

            // 상세 이미지
            List<String> detailImages = wait
                .until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("#topleft img")))
                .stream().map(e -> e.getAttribute("src"))
                .distinct().collect(Collectors.toList());

            idx = 1;
            for (String img : detailImages) {
                downloadImage(img, detailPath, classId, idx++);
            }

            // 강사 이미지
            List<String> instructorImages = wait
                .until(ExpectedConditions.presenceOfAllElementsLocatedBy(
                        By.cssSelector("#topleft > div:nth-of-type(6) > div img")))
                .stream().map(e -> e.getAttribute("src"))
                .distinct().collect(Collectors.toList());

            idx = 1;
            for (String img : instructorImages) {
                downloadImage(img, instructorPath, classId, idx++);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    // 이미지 다운로드
    private static void downloadImage(String imageUrl, String savePath, String classId, int index) {
        try {
            if (!imageUrl.startsWith("http")) {
                saveBrokenImage(imageUrl, classId);
                return;
            }

            String ext = imageUrl.contains(".png") ? ".png"
                       : imageUrl.contains(".webp") ? ".webp"
                       : imageUrl.contains(".jpeg") ? ".jpeg"
                       : ".jpg";

            InputStream in = new URL(imageUrl).openStream();
            Path outputPath = Paths.get(savePath + "/" + index + ext);
            Files.copy(in, outputPath, StandardCopyOption.REPLACE_EXISTING);
            System.out.println("✔ 저장됨: " + outputPath);
        } catch (Exception e) {
            System.out.println("✘ 저장 실패: " + imageUrl);
            saveBrokenImage(imageUrl, classId);
        }
    }

    // 깨진 이미지 기록
    private static void saveBrokenImage(String imageUrl, String classId) {
        try {
            String brokenDir = "class_images/" + classId + "/broken_images";
            Files.createDirectories(Paths.get(brokenDir));
            Path logFile = Paths.get(brokenDir, "broken_urls.txt");
            Files.writeString(logFile, imageUrl + System.lineSeparator(),
                    StandardOpenOption.CREATE, StandardOpenOption.APPEND);
            System.out.println("⚠ 깨진 이미지 기록: " + imageUrl);
        } catch (Exception e) {
            System.out.println("❌ 깨진 이미지 기록 실패: " + imageUrl);
        }
    }
}
