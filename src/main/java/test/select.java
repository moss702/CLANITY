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
			String url = "https://mochaclass.com/class/68626305a76ad32f78f850c6";
			System.out.println("🌐 URL: " + url);
			driver.get(url);

			// 스크롤 최하단 이동
			js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
			Thread.sleep(1500); // 로딩 대기

			// 클래스 아이디
			String classId = url.substring(url.lastIndexOf("/") + 1);

			// 클래스 제목
			String title = getTextSafe(driver, wait, "h1.MuiTypography-root.MuiTypography-h1.css-16a85so");
			System.out.println("📌 Title: " + title);
			String thumbnailImage = getAttrSafe(driver, wait, "div.slick-list .slick-track div img", "src");
//	
//	         //1) 상세 이미지 링크 주소
			List<String> detailImage = wait
					.until(ExpectedConditions
							.presenceOfAllElementsLocatedBy(By.cssSelector("div.slick-list .slick-track div img")))
					.stream().map(e -> e.getAttribute("src")).distinct().collect(Collectors.toList());
//	        //2) 상세 이미지 링크 주소    
			List<String> detailImages = wait
					.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("#topleft img"))).stream()
					.map(e -> e.getAttribute("src")).distinct().collect(Collectors.toList());

//	            
//	            // 카테고리 목록(상위, 하위 카테고리)
			List<String> categories = wait
					.until(ExpectedConditions
							.presenceOfAllElementsLocatedBy(By.cssSelector(".class_category, .class_subcategory")))
					.stream().map(e -> e.getText().toString()).distinct().toList();
			categories.forEach(System.out::println);
//	            
			// 1. 정기 클래스/ 원데이 클래스 구분
			String classType = wait.until(
					ExpectedConditions.presenceOfElementLocated(By.cssSelector("li.css-15dw8ms:nth-of-type(1) p")))
					.getText();

			// 2. 소요 시간 및 기간
			String duration = wait.until(
					ExpectedConditions.presenceOfElementLocated(By.cssSelector("li.css-15dw8ms:nth-of-type(2) p")))
					.getText();
//	        	// 3. 지역 정보 (광주 남구 ...)
			String region = wait.until(
					ExpectedConditions.presenceOfElementLocated(By.cssSelector("li.css-15dw8ms:nth-of-type(3) p")))
					.getText();

//	        	// 4. 난이도 (입문으로 나와야)
			String difficulty = wait.until(
					ExpectedConditions.presenceOfElementLocated(By.cssSelector("li.css-15dw8ms:nth-of-type(4) p")))
					.getText();

			// 가격 (갑자기 안나오는데 모르겠음)
			String price = getTextSafe(driver, wait, "div.css-i889vy hr + div > div > p.css-1ut0yge");
			System.out.println("💰 Price: " + price);

//	        //상세 페이지 (전체소개)
//	        	String mainContent = getTextSafe(driver, wait, "#topleft");
//		       System.out.println("💰 content: " + mainContent );

//		     클래스 상세 정보(클래스 소개, 이런 분들이 좋으면 좋아요(나중에 필요없을 것 같으면 삭제)
			String description = getTextSafe(driver, wait, "#topleft > div:nth-of-type(4) > div > div:nth-of-type(2)");
			String description2 = getTextSafe(driver, wait,
					"#topleft > div:nth-of-type(4) > div > div:nth-of-type(4) "); // 텍스트 내용 추출
			// 커리 큘럼
			String curriculum = getTextSafe(driver, wait, "#topleft > div:nth-of-type(5) > div > div:nth-of-type(2)"); // 텍스트
																														// 내용
			// 강사이름 , 
			String host_name = getTextSafe(driver, wait,
					"#topleft > div:nth-of-type(6) > div > div:nth-of-type(2) p:nth-of-type(2)"); // 텍스트 내용 추출
			String host_introduction = getTextSafe(driver, wait,
					"#topleft > div:nth-of-type(6) > div > div:nth-of-type(3)"); // 텍스트 내용 추출
			List<String> instructorImageUrl = wait.until(ExpectedConditions
					.presenceOfAllElementsLocatedBy(By.cssSelector("#topleft > div:nth-of-type(6) > div img") 
							)).stream().map(e -> e.getAttribute("src")).distinct().collect(Collectors.toList());

			// 지역 상세 정보
			String address = getTextSafe(driver, wait, "#topleft > div:nth-of-type(7) > div > p"); // 텍스트 내용 추출
			// 강사 이미지 url

			System.out.println("======================");
			System.out.println("🆔 Class ID: " + classId);
			System.out.println("title" + title);
			detailImage.forEach(System.out::println);
			System.out.println(" ClassType: " + classType);
			System.out.println(" Duration: " + duration);
			System.out.println("Region: " + region);
			System.out.println("Difficulty: " + difficulty);
			detailImages.forEach(System.out::println);
			System.out.println("💰 content(클래스 소개): " + description);
			System.out.println("💰 content2(이런 분들이 들으면 좋아요): " + description2);
			System.out.println("💰 content3(커리큘럼): " + curriculum);
			System.out.println(" name(강사 이름): " + host_name);
			System.out.println(" host_introduction(강사 소개): " + host_introduction);
			System.out.println(" 강사 이미지 링크" + instructorImageUrl);
			System.out.println("💰 address: " + address);

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
			WebElement tab = wait.until(
					ExpectedConditions.elementToBeClickable(By.xpath("//button[contains(text(),'" + tabName + "')]")));
			tab.click();
			Thread.sleep(500);
			return getTextSafe(driver, wait, "div[class*=tab_content]");
		} catch (Exception e) {
			return "(" + tabName + " 없음)";
		}
	}
}
