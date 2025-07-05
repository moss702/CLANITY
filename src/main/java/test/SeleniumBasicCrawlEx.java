package test;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.sql.Date;
import java.time.Duration;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

public class SeleniumBasicCrawlEx {
    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        try {
            String url = "https://mochaclass.com/class/6764ebedec89ef2de1fe09da";
            driver.get(url);
            Thread.sleep(1500); // 전체 로딩 대기

            String classId = url.substring(url.lastIndexOf("/") + 1);
            String categoryId = "0";  // 크롤링 불가한 항목은 기본값 설정
            String businessId = "0";
            String createdAt = Date.valueOf(LocalDate.now()).toString();

            String title = getTextSafe(driver, "h1[class*=class_title]");
            String thumbnailImage = getAttrSafe(driver, "div.image_area img", "src");

            List<String> detailImages = driver.findElements(By.cssSelector("div.slider_item img"))
                    .stream().map(e -> e.getAttribute("src")).distinct().collect(Collectors.toList());

            String region = getTextSafe(driver, "div[class*=class_location]");
            String duration = getTextByLabel(driver, "시간");
            String difficulty = getTextByLabel(driver, "난이도");
            String classType = getTextByLabel(driver, "형태");
            String description = getTextSafe(driver, "div[class*=class_description]");

            String instructorName = getTextSafe(driver, "div[class*=host_name]");
            String instructorImageUrl = getAttrSafe(driver, "div[class*=host_img] img", "src");

            String price = getTextSafe(driver, "div[class*=origin_price]");
            String discountPrice = getTextSafe(driver, "div[class*=sale_price]");
            String discount = getTextSafe(driver, "div[class*=discount_percent]");

            // 탭 클릭하여 소개 및 커리큘럼 내용 추출
            String hostIntroduction = "";
            try {
                WebElement introTab = driver.findElement(By.xpath("//button[contains(text(),'소개')]"));
                introTab.click();
                Thread.sleep(500);
                hostIntroduction = getTextSafe(driver, "div[class*=tab_content]");
            } catch (Exception e) {
                hostIntroduction = "(소개 없음)";
            }

            String curriculum = "";
            try {
                WebElement curriTab = driver.findElement(By.xpath("//button[contains(text(),'커리큘럼')]"));
                curriTab.click();
                Thread.sleep(500);
                curriculum = getTextSafe(driver, "div[class*=tab_content]");
            } catch (Exception e) {
                curriculum = "(커리큘럼 없음)";
            }

            // 주소 = region 대체
            String address = region;

            // 출력
            System.out.println("🌐 URL: " + url);
            System.out.println("📌 Title: " + title);
            System.out.println("🖼️ Thumbnail: " + thumbnailImage);
            System.out.println("📍 Region: " + region);
            System.out.println("💰 Price: " + price + " / 할인가: " + discountPrice + " (" + discount + ")");
            System.out.println("👤 Instructor: " + instructorName);
            System.out.println("🧑‍🎨 Instructor Img: " + instructorImageUrl);
            System.out.println("📝 Host Intro: " + hostIntroduction);
            System.out.println("🕒 Duration: " + duration);
            System.out.println("📉 Difficulty: " + difficulty);
            System.out.println("📂 Class Type: " + classType);
            System.out.println("🧾 Curriculum: " + curriculum);
            System.out.println("🖼️ Detail Images:");
            detailImages.forEach(System.out::println);
            System.out.println("📜 Description: " + description);
            System.out.println("🆔 Class ID: " + classId);
            System.out.println("🗂 Category ID: " + categoryId);
            System.out.println("🏢 Business ID: " + businessId);
            System.out.println("📍 Address: " + address);
            System.out.println("🗓️ Created At: " + createdAt);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    private static String getTextSafe(WebDriver driver, String cssSelector) {
        try {
            return driver.findElement(By.cssSelector(cssSelector)).getText().trim();
        } catch (Exception e) {
            return "";
        }
    }

    private static String getAttrSafe(WebDriver driver, String cssSelector, String attr) {
        try {
            return driver.findElement(By.cssSelector(cssSelector)).getAttribute(attr);
        } catch (Exception e) {
            return "";
        }
    }

    private static String getTextByLabel(WebDriver driver, String labelText) {
        try {
            WebElement label = driver.findElement(By.xpath("//li[.//span[contains(text(),'" + labelText + "')]]/span[2]"));
            return label.getText().trim();
        } catch (Exception e) {
            return "";
        }
    }
}
