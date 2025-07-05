package test;

import java.time.Duration;
import java.util.List;
import java.util.stream.Collectors;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.*;

import io.github.bonigarcia.wdm.WebDriverManager;

public class select {
    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        JavascriptExecutor js = (JavascriptExecutor) driver;

        try {
            String url = "https://mochaclass.com/class/6764ebedec89ef2de1fe09da";
            driver.get(url);

            Thread.sleep(1500); // JS 렌더링 대기
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(1500);
//
//            // ✅ 제목 (클래스명)
//            String title = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main > div:first-of-type > div:first-of-type > div"))).getText().trim();
//
//            // ✅ 설명
//            String description = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main > div:nth-of-type(2) p"))).getText().trim();
//
//            // ✅ 가격 (기본 가격, 할인가, 할인율)
//            String price = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main hr + div > p"))).getText().trim();
//            String discountPrice = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main hr + div + div > p"))).getText().trim();
//            String discount = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main hr + div + div + div > p"))).getText().trim();
//
//            // ✅ 클래스 속성 정보
//            String classType = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main ul > li:nth-of-type(1) > p"))).getText().trim();
//            String duration = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main ul > li:nth-of-type(2) > p"))).getText().trim();
//            String difficulty = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main ul > li:nth-of-type(4) > p"))).getText().trim();
//            String daysOfWeek = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main ul > li:nth-of-type(6) > p"))).getText().trim();
//
//            // ✅ 지역 정보 (주소 포함)
//            String region = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("div.jss191 > div:nth-of-type(2) > p"))).getText().trim();
//            String address = region;
//
//            // ✅ 썸네일 이미지
//            String thumbnail = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("div.slick-list div img"))).getAttribute("src");
//
//            // ✅ 상세 이미지 리스트
//            List<String> detailImages = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(
//                By.cssSelector("div.slick-list div img")))
//                .stream().map(e -> e.getAttribute("src")).distinct().collect(Collectors.toList());
//
//            // ✅ 태그
//            List<String> tags = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(
//                By.cssSelector("main a[href^='/search']")))
//                .stream().map(WebElement::getText).distinct().collect(Collectors.toList());
//
//            // ✅ 평점
//            String rating = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("span[aria-label*='점']"))).getText().trim();
//
//            // ✅ 강사 이름 및 이미지
//            String instructorName = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main > div img + div > p"))).getText().trim();
//            String instructorImg = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("main > div img"))).getAttribute("src");
//
//            // ✅ 소개 탭
//            WebElement introTab = wait.until(ExpectedConditions.elementToBeClickable(
//                By.xpath("//button[contains(text(),'소개')]")));
//            introTab.click();
//            Thread.sleep(300);
//            String hostIntro = wait.until(ExpectedConditions.presenceOfElementLocated(
//                By.cssSelector("div[role='tabpanel']:not([hidden]) div div div div"))).getText().trim();

            // ✅ 커리큘럼 탭
            WebElement curriTab = wait.until(ExpectedConditions.elementToBeClickable(
                By.xpath("//button[contains(text(),'커리큘럼')]")));
            curriTab.click();
            Thread.sleep(300);
            String curriculum = wait.until(ExpectedConditions.presenceOfElementLocated(
                By.cssSelector("div[role='tabpanel']:not([hidden]) div div div div"))).getText().trim();

            // ✅ 출력
            System.out.println("🔗 URL: " + url);
//            System.out.println("📌 Title: " + title);
//            System.out.println("📜 Description: " + description);
//            System.out.println("💰 Price: " + price);
//            System.out.println("💸 Discount Price: " + discountPrice);
//            System.out.println("🎯 Discount: " + discount);
//            System.out.println("🧾 Class Type: " + classType);
//            System.out.println("⏱ Duration: " + duration);
//            System.out.println("📉 Difficulty: " + difficulty);
//            System.out.println("📅 Days of Week: " + daysOfWeek);
//            System.out.println("📍 Region: " + region);
//            System.out.println("🏠 Address: " + address);
//            System.out.println("🖼️ Thumbnail: " + thumbnail);
//            System.out.println("🖼️ Detail Images:");
//            detailImages.forEach(System.out::println);
//            System.out.println("🏷 Tags: " + tags);
//            System.out.println("⭐ Rating: " + rating);
//            System.out.println("👤 Instructor: " + instructorName);
//            System.out.println("🧑‍🎨 Instructor Image: " + instructorImg);
//            System.out.println("📝 Host Intro: " + hostIntro);
            System.out.println("📘 Curriculum: " + curriculum);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }
}
