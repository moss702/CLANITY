package test;

import java.sql.Date;
import java.time.Duration;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.*;

import io.github.bonigarcia.wdm.WebDriverManager;

public class SeleniumBasicCrawl {
    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        JavascriptExecutor js = (JavascriptExecutor) driver;

        try {
            String url = "https://mochaclass.com/class/651fc93c70cf2c7801d22e67";
            System.out.println("🌐 URL: " + url);
            driver.get(url);

            // 스크롤 최하단 이동
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(1500); // 로딩 대기

//            String classId = url.substring(url.lastIndexOf("/") + 1);
//            System.out.println("🆔 Class ID: " + classId);
//            
////            String createdAt = Date.valueOf(LocalDate.now()).toString();
//            String title = getTextSafe(driver, wait, "h1.MuiTypography-root.MuiTypography-h1.css-16a85so");
//            System.out.println("📌 Title: " + title);
//            String thumbnailImage = getAttrSafe(driver, wait, "div.slick-list .slick-track div img", "src");
//
//            List<String> detailImages = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("div.slick-list .slick-track div img")))
//                    .stream().map(e -> e.getAttribute("src")).distinct().collect(Collectors.toList());
//            detailImages.forEach(System.out::println);
//            
//            List<String> categories =  wait.until(ExpectedConditiodns.presenceOfAllElementsLocatedBy(By.cssSelector(".class_category, .class_subcategory")))
//            		.stream().map(e -> e.getText().toString()).distidnct().toList();
//            categories.forEach(System.out::println);
//            MuiTypography-root MuiTypography-body1 css-1ut0yge
  
        	// 1. 정기 클래스/ 원데이 클래스 구분
        	String classType = wait.until(ExpectedConditions.presenceOfElementLocated(
        	    By.cssSelector("li.css-15dw8ms:nth-of-type(1) p")
        	)).getText();
        	System.out.println("📂 Class Type: " + classType);
//
//        	// 2. 소요 시간 및 기간
        	String duration = wait.until(ExpectedConditions.presenceOfElementLocated(
        	    By.cssSelector("li.css-15dw8ms:nth-of-type(2) p")
        	)).getText();
        	System.out.println("🕒 Duration: " + duration);
//
//        	// 3. 지역 정보 (광주 남구 ...)
        	String region = wait.until(ExpectedConditions.presenceOfElementLocated(
        	    By.cssSelector("li.css-15dw8ms:nth-of-type(3) p")
        	)).getText();
        	System.out.println("📍 Region: " + region);

//        	// 4. 난이도 (입문으로 나와야)
        	String difficulty = wait.until(ExpectedConditions.presenceOfElementLocated(
        	    By.cssSelector("li.css-15dw8ms:nth-of-type(4) p")
        	)).getText();
        	System.out.println("📉 Difficulty: " + difficulty);



//            String discountPrice = getTextSafe(driver, wait, "div[class*=sale_price]");
//            String discount = getTextSafe(driver, wait, "div[class*=discount_percent]");
//            System.out.println("💰 Price: " + price + " / 할인가: " + discountPrice + " (" + discount + ")");
            String price = getTextSafe(driver, wait, "div.css-i889vy hr ~ div p.css-1ut0yge");
//            System.out.println("💰 Price: " + price );
        	
//        	MuiTypography-root MuiTypography-body1 jss212 css-1ut0yge
//            
//            String region = wait.until(ExpectedConditions.presenceOfElementLocated(
//            	    By.cssSelector(".main > div > div > div:first-of-type > div:first-of-type > div:nth-of-type(7) > div > p:first-of-type")
//            	)).getText();
//        	System.out.println("📍 Region: " + region);

            		

            
//            String region = getTextSafe(driver, wait, ".main > div > div > div:first-of-type > div:first-of-type > div:nth-of-type(7) > div > p:first-of-type");
//            System.out.println("📍 Region: " + region);
//            
            
            
//            String duration = getTextByLabel(driver, wait, "시간");
//            String difficulty = getTextByLabel(driver, wait, "난이도");
//            String classType = getTextByLabel(driver, wait, "형태");
//            String description = getTextSafe(driver, wait, "div[class*=class_description]");
//
//            String instructorName = getTextSafe(driver, wait, "div[class*=host_name]");
//            String instructorImageUrl = getAttrSafe(driver, wait, "div[class*=host_img] img", "src");
//
//
//            // 탭 클릭하여 소개 및 커리큘럼 내용 추출
//            String hostIntroduction = clickTabAndExtract(driver, wait, "소개");
//            String curriculum = clickTabAndExtract(driver, wait, "커리큘럼");
//
//            String address = region;
//
//            // 출력
//            
//            System.out.println("🖼️ Thumbnail: " + thumbnailImage);
//            System.out.println("📍 Region: " + region);
//            System.out.println("💰 Price: " + price + " / 할인가: " + discountPrice + " (" + discount + ")");
//            System.out.println("👤 Instructor: " + instructorName);
//            System.out.println("🧑‍🎨 Instructor Img: " + instructorImageUrl);
//            System.out.println("📝 Host Intro: " + hostIntroduction);
//            System.out.println("🕒 Duration: " + duration);
//            System.out.println("📉 Difficulty: " + difficulty);
//            System.out.println("📂 Class Type: " + classType);
//            System.out.println("🧾 Curriculum: " + curriculum);
//            System.out.println("🖼️ Detail Images:");
//            
//            System.out.println("📜 Description: " + description);
//            
//            System.out.println("🗂 Category ID: " + categoryId);
//            System.out.println("🏢 Business ID: " + businessId);
//            System.out.println("📍 Address: " + address);
//            System.out.println("🗓️ Created At: " + createdAt);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    private static String getTextSafe(WebDriver driver, WebDriverWait wait, String cssSelector) {
        try {
            WebElement el = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(cssSelector)));
            return el.getText().trim();
        } catch (Exception e) {
            return "";
        }
    }

    private static String getAttrSafe(WebDriver driver, WebDriverWait wait, String cssSelector, String attr) {
        try {
            WebElement el = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector(cssSelector)));
            return el.getAttribute(attr);
        } catch (Exception e) {
            return "";
        }
    }

    private static String getTextByLabel(WebDriver driver, WebDriverWait wait, String labelText) {
        try {
            By xpath = By.xpath("//li[.//span[contains(text(),'" + labelText + "')]]/span[2]");
            WebElement el = wait.until(ExpectedConditions.presenceOfElementLocated(xpath));
            return el.getText().trim();
        } catch (Exception e) {
            return "";
        }
    }

    private static String clickTabAndExtract(WebDriver driver, WebDriverWait wait, String tabName) {
        try {
            WebElement tab = wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//button[contains(text(),'" + tabName + "')]")));
            tab.click();
            Thread.sleep(500);
            return getTextSafe(driver, wait, "div[class*=tab_content]");
        } catch (Exception e) {
            return "(" + tabName + " 없음)";
        }
    }
}
