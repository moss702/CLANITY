package test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import domain.onedayClass.OnedayClass;
import io.github.bonigarcia.wdm.WebDriverManager;
import mapper.OnedayClassMapper;
import util.MybatisUtil;

import java.time.Duration;
import java.util.List;

public class SeleniumBasicCrawl {
    public static void main(String[] args) {
        WebDriverManager.chromedriver().setup();
        WebDriver driver = new ChromeDriver();
        
        OnedayClassMapper onedayClassMapper = MybatisUtil.getSqlSession().getMapper(OnedayClassMapper.class);
        
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

            for (int page = 121; page <= 123; page++) {
                System.out.println("===== [페이지 " + page + "] =====");
                driver.navigate().to("https://mochaclass.com/Search?keyword=&page=" + page);

                // 페이지당 동적 요소 대기
                List<WebElement> classCards = wait.until(
                    ExpectedConditions.visibilityOfAllElementsLocatedBy(By.cssSelector(".MuiGrid-root.css-2xazwd a"))
                );

                for (WebElement card : classCards) {
                    String href = card.getAttribute("href");
                    String title = "(제목 없음)";
                    
                    try {
                        title = card.findElement(By.className("class_name")).getText();
                    } catch (Exception e) {
                        System.out.println("⚠️ 제목 요소 없음 (스킵)");
                    }
                    System.out.println("🔗 " + href);
                    System.out.println("📌 " + title);
                    
                    
                            onedayClassMapper.insert(new OnedayClass(title, href));
                }


                // 요청 간 딜레이 (서버 과부하 방지)
                Thread.sleep(1200);  // 랜덤화 가능
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 정리 및 종료는 마지막에 명확하게
             driver.quit();  // 일단 주석 유지
        }
    }
}