package com.shop.goodee.craw;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
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
	private List<WebElement> elements;
	private String url;
	private String nickName;
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
//		options.addArguments("headless");
        
		driver = new ChromeDriver(options);
		
	}
	public void activateBot(TestVO testVO) {
		System.out.println(testVO.getUrl());
		url = testVO.getUrl();
		nickName = testVO.getNickName();
		try {
			driver.get(url); // 1. url 접속
			Thread.sleep(1000); 
			
			element = driver.findElement(By.className("prod-buy-header__title"));
			String titleTmp = element.getText();
			
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
							
							reviewVO.setTitle(titleTmp);
							text=xpathCommon+j+xpathUser;
							element = driver.findElement(By.xpath(text)); // 유저명
							tmp = element.getText().trim();
							reviewVO.setNickName(tmp);
							log.info("유저명) "+tmp);
							log.info("찾을닉네임) "+nickName);
							if(tmp == nickName || tmp.equals(nickName)) {
								log.info("============닉네임 발견==========");
								check=false;
							}
							
							text=xpathCommon+j+xpathDate;
							element = driver.findElement(By.xpath(text)); // 날짜
							tmp = element.getText();
							reviewVO.setDate(tmp);
							log.info("날짜) "+tmp);
							
							text=xpathCommon+j+xpathTitleDetail;
							element = driver.findElement(By.xpath(text)); // 세부상품이름
							tmp = element.getText();
							reviewVO.setTitleDetail(tmp);
							log.info("세부상품명) "+tmp);
							
							try {
								text=xpathCommon+j+xpathReview;
								element = driver.findElement(By.xpath(text)); // 리뷰
								tmp = element.getText();
								reviewVO.setReview(tmp);
								log.info("리뷰) "+tmp);
							} catch (Exception e) {
							}
//							if(tmp.equals("신고하기")) {
//								reviewVO.setReview("");
//							}
							reviewVOs.add(reviewVO);
							if(check==false) {
								break;
							}
						}
						if(check==false) {
							break;
						}
					}
					if(check==false) {
						break;
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
			if(check==false) {
				log.info("===============최종 결과=========================");
				
				ReviewVO reviewVO = new ReviewVO();
				reviewVO.setNickName(reviewVOs.get(reviewVOs.size()-1).getNickName());
				reviewVO.setTitle(reviewVOs.get(reviewVOs.size()-1).getTitle());
				reviewVO.setDate(reviewVOs.get(reviewVOs.size()-1).getDate());
				reviewVO.setTitleDetail(reviewVOs.get(reviewVOs.size()-1).getTitleDetail());
				reviewVO.setReview(reviewVOs.get(reviewVOs.size()-1).getReview());
				
				log.info("닉네임) "+reviewVO.getNickName());
				log.info("상품명) "+reviewVO.getTitle());
				log.info("날짜) "+reviewVO.getDate());
				log.info("세부상품명) "+reviewVO.getTitleDetail());
				log.info("리뷰) "+reviewVO.getReview());
				try {
					log.info("리뷰 글자수) "+reviewVO.getReview().length());					
				} catch (Exception e) {
					log.info("리뷰 글자수) 0");					
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.close(); // 브라우저 종료
		}
	}
	
	public void activateBot(InstaTestVO instaTestVO) {
		System.out.println(instaTestVO.getUrl());
		url = instaTestVO.getUrl();
		String id = instaTestVO.getId();
		try {
			driver.get(url); // 1. url 접속
			Thread.sleep(1000); 

			element = driver.findElement(By.xpath("//*[@id=\"loginForm\"]/div/div[1]/div/label/input"));
			element.sendKeys("junsolhee8@naver.com"); // 아이디 입력
			log.info("아이디 입력==========");
			Thread.sleep(1000); 
			
			element = driver.findElement(By.xpath("//*[@id=\"loginForm\"]/div/div[2]/div/label/input"));
			element.sendKeys("wjsgkwns77"); // 비번 입력
			log.info("비번 입력==========");
			Thread.sleep(1000); 
			
			try {
				element = driver.findElement(By.xpath("//*[@id=\"loginForm\"]/div/div[3]/button"));
				
			} catch (Exception e) {
				element = driver.findElement(By.xpath("//*[@id=\"loginForm\"]/div/div[4]/button"));
			}
//			element.click(); // 2. 로그인 클릭
			element.sendKeys(Keys.ENTER);
			log.info("로그인 버튼==========");
			Thread.sleep(3000); 
			
			// 검색 
//			element = driver.findElement(By.xpath("//*[@id=\\\"mount_0_0_ij\\\"]/div/div/div/div[1]/div/div/div/div[1]/div[1]/div[1]/div/div/div/div/div[2]/div[2]/div/a/div"));
//			element.sendKeys(Keys.ENTER);
//			log.info("검색 클릭==========");
			
//			element = driver.findElement(By.xpath("//*[@id=\"mount_0_0_9q\"]/div/div/div/div[1]/div/div/div/div[1]/div[1]/div[1]/div/div/div/div/div[2]/div[2]"));
//			log.info("xpath지정");
//			element.click(); // 검색
//			log.info("클릭");
			
			driver.get("https://www.instagram.com/solhyi.jeon/followers/?next=%2F"); //대상 닉네임 (.com) (/?next) 사이에 삽입
			Thread.sleep(3000);
			
			//xpath 불가
			
			elements = driver.findElements(By.className("_abcm"));
//			log.info(elements.size());
			element.click();
			
			// 팔로워 <div class=" _ab8y  _ab94 _ab97 _ab9f _ab9k _ab9p _abcm">solhyi.jeon</div>
			
			
		}catch (Exception e){
			log.info("error) {}",e);
		}
		finally{
//			driver.close();
			}
		}
}