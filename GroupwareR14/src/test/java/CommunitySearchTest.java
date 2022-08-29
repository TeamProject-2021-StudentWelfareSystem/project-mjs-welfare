
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

public class CommunitySearchTest {
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
//		driver.quit();
	}

	@Test
	public void communitySearch() {
		driver.get("http://localhost:8080/groupware/");
		driver.manage().window().maximize();
		driver.findElement(By.linkText("로그인")).click();
		driver.findElement(By.id("userLoginID")).sendKeys("00000000");
		driver.findElement(By.id("userLoginPW")).sendKeys("12341234");
		driver.findElement(By.id("submitId")).click();
		driver.findElement(By.linkText("게시판")).click();
		driver.findElement(By.linkText("커뮤니티")).click();
		driver.findElement(By.linkText("글쓰기")).click();
		driver.findElement(By.id("communityTitle")).click();
		driver.findElement(By.id("communityTitle")).sendKeys("검색 테스트");
	    driver.findElement(By.cssSelector(".ck-content")).click();
	    driver.findElement(By.cssSelector(".ck-content")).sendKeys(" 테스트");
		driver.findElement(By.id("saveButton")).click();
		driver.findElement(By.cssSelector(".nav-item:nth-child(5) > #messagesDropdown")).click();
		driver.findElement(By.linkText("로그인")).click();
		driver.findElement(By.id("userLoginID")).sendKeys("12311231");
		driver.findElement(By.id("userLoginPW")).sendKeys("12311231");
		driver.findElement(By.id("userLoginPW")).sendKeys(Keys.ENTER);
		driver.findElement(By.linkText("게시판")).click();
		driver.findElement(By.linkText("커뮤니티")).click();
		driver.findElement(By.id("searchType")).click();
		{
			WebElement dropdown = driver.findElement(By.id("searchType"));
			dropdown.findElement(By.xpath("//option[. = '작성자']")).click();
		}
		driver.findElement(By.id("keyword")).click();
		driver.findElement(By.id("keyword")).sendKeys("팀원");
		driver.findElement(By.id("searchBtn")).click();
	}
}