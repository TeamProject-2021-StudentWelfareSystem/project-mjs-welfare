// Generated by Selenium IDE
import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
public class InquiryTest {
  private WebDriver driver;
  private Map<String, Object> vars;
  JavascriptExecutor js;
  
  @Before
  public void setUp() {
	  System.setProperty("webdriver.chrome.driver", "C:\\Selenium\\chromedriver.exe");
    driver = new ChromeDriver();
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }
  @After
  public void tearDown() {
    //driver.quit();
  }
  @Test
  public void inquiryTest() {
    driver.get("http://localhost:8080/groupware/home");
    driver.manage().window().setSize(new Dimension(1318, 866));
    driver.findElement(By.linkText("로그인")).click();
    driver.findElement(By.id("userLoginID")).click();
    driver.findElement(By.id("userLoginID")).sendKeys("12311231");
    driver.findElement(By.id("userLoginPW")).sendKeys("12311231");
    driver.findElement(By.id("userLoginPW")).sendKeys(Keys.ENTER);
    driver.findElement(By.linkText("문의")).click();
    driver.findElement(By.linkText("문의")).click();
    driver.findElement(By.linkText("문의")).click();
    driver.findElement(By.linkText("문의하기")).click();
    driver.findElement(By.linkText("글쓰기")).click();
    driver.findElement(By.id("inquiryType")).click();
    
    {
      WebElement dropdown = driver.findElement(By.id("inquiryType"));
      dropdown.findElement(By.xpath("//option[. = '강의실 예약/이용']")).click();
    }
    driver.findElement(By.id("inquiryTitle")).click();
    driver.findElement(By.id("inquiryTitle")).sendKeys("예약 확인 테스트");
    driver.findElement(By.cssSelector(".ck-editor__editable")).click();
    driver.findElement(By.cssSelector(".ck-editor__editable")).sendKeys("테스트입니다");
    driver.findElement(By.id("saveButton")).click();
    driver.findElement(By.cssSelector(".mb-3")).click();
  }
}
