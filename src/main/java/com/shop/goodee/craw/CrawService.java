package com.shop.goodee.craw;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Service;

import com.shop.goodee.craw.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CrawService {

	private WebDriver driver;
	private WebElement element;
	private String url;
	private List<ReviewVO> reviewVOs = new ArrayList<>();
	
 	// 드라이버 설치 경로
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static String WEB_DRIVER_PATH = "C:\\sts\\workspace\\GDShop\\src\\main\\resources/chromedriver.exe";
	
	public CrawService (){
		// WebDriver 경로 설정
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
				
		// WebDriver 옵션 설정
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--start-maximized");
		options.addArguments("--disable-popup-blocking");
		
		// access deny
		options.addArguments("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36");
		options.addArguments("--disable-blink-features=AutomationControlled");
		options.addArguments("--disable-extensions");
		options.addArguments("headless");
        
		driver = new ChromeDriver(options);
		
		url = "https://www.coupang.com/vp/products/6069827772?vendorItemId=82651418206&sourceType=HOME_TRENDING_ADS&searchId=feed-80ded603807b463cbbea976ec8a8c493-trending_ads-69184&clickEventId=e40dc083-2251-45ef-8e41-77b490b4ae32&isAddedCart=";
	}
	public void activateBot() {
		
		try {
			driver.get(url); // 1. url 접속
			Thread.sleep(1000); 
			
			element = driver.findElement(By.className("prod-buy-header__title"));
			String title = element.getText();
			
			element = driver.findElement(By.name("review"));
			element.click();
			Thread.sleep(1000); // 2. 상품평 클릭
			
			element = driver.findElement(By.className("sdp-review__article__order__sort__newest-btn"));
			element.click();
			Thread.sleep(1000); // 3. 최신순 클릭
			
			// article[x] : 그 페이지의 x번쨰 회원, 최대 5명
			// button[x]   //   x : 2 ~ 11 -----> 1 ~ 10 페이지
			// button[x]   //   x : 1 -> 이전 페이지
			// button[x]   //   x : 12 -> 다음페이지
			
			String xpathCommon = "//*[@id=\"btfTab\"]/ul[2]/li[2]/div/div[6]/section[4]/article[";
			String xpathUser = "]/div[1]/div[2]/span";
			String xpathDate = "]/div[1]/div[3]/div[2]";
			String xpathTitleDetail = "]/div[1]/div[5]";
			String xpathReview = "]/div[4]/div";
			String text = "";
			String xpathBtnCommon ="//*[@id=\"btfTab\"]/ul[2]/li[2]/div/div[6]/section[4]/div[3]/button[";
			String xpathBtn ="]";
			boolean check = true;
			int l=0;
			
			log.info("1)상품이름 : {}",title);
			while(check) {
				try {
					for(int i=2;i<12;i++) {
						String tmpBtn ="";
						tmpBtn=xpathBtnCommon+i+xpathBtn;
						
						element = driver.findElement(By.xpath(tmpBtn)); // x페이지 이동 = button[x+1] 
						element.click();
						Thread.sleep(1000); // 페이지 버튼 클릭
						
						for(int j=1;j<6;j++) {
							ReviewVO reviewVO = new ReviewVO();
							String tmp ="";
							
							int k = (i-2)*5 + (j-1)+l;
							log.info(k+"=============");
							
							text=xpathCommon+j+xpathUser;
							element = driver.findElement(By.xpath(text)); // 유저명
							tmp = element.getText();
							reviewVO.setId(tmp);
							log.info("-유저명:"+tmp);
							
							text=xpathCommon+j+xpathDate;
							element = driver.findElement(By.xpath(text)); // 날짜
							tmp = element.getText();
							reviewVO.setDate(tmp);
							log.info("-날짜:"+tmp);
							
							text=xpathCommon+j+xpathTitleDetail;
							element = driver.findElement(By.xpath(text)); // 세부상품이름
							tmp = element.getText();
							reviewVO.setTitleDetail(tmp);
							log.info("-세부상품명:"+tmp);
							
							try {
								text=xpathCommon+j+xpathReview;
								element = driver.findElement(By.xpath(text)); // 리뷰
								tmp = element.getText();
								reviewVO.setReview(tmp);
								log.info("-리뷰:"+tmp);
							} catch (Exception e) {
							}
//							if(tmp.equals("신고하기")) {
//								reviewVO.setReview("");
//							}
							reviewVOs.add(reviewVO);
						}
					}
					String tmpBtn2=xpathBtnCommon+12+xpathBtn;
					element = driver.findElement(By.xpath(tmpBtn2)); // x페이지 이동 = button[x+1] 
					element.click();
					Thread.sleep(1000); // 다음 페이지 버튼 클릭
					l+=50;
				} catch (Exception e) {
					break;
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
//			driver.close(); // 브라우저 종료
		}
	}
}