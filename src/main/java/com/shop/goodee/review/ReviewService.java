package com.shop.goodee.review;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.By.ByLinkText;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.beust.jcommander.internal.Console;
import com.shop.goodee.review.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewService {

	@Value("${app.chromePath}")
	private String chromePath; // application-secret.properties에 추가 (\ -> \\)
								// ex) app.ocrPath=C:\\sts\\workspace\\GDShop\\src\\main\\resources\\Tess4J\\tessdata
								// ex) app.chromePath=C:\\sts\\workspace\\GDShop\\src\\main\\resources\\chromedriver.exe
	private String WEB_DRIVER_ID = "webdriver.chrome.driver";
	private String url;

	private WebDriver driver;
	private WebElement element;
	private List<WebElement> elements;
	private List<ReviewVO> reviewVOs = new ArrayList<>();

	public ReviewVO getReview(TestVO testVO) {
		String nickName;

		System.setProperty(WEB_DRIVER_ID, chromePath);

		ChromeOptions options = new ChromeOptions(); // WebDriver 옵션 설정

		options.addArguments("--start-maximized");
		options.addArguments("--disable-popup-blocking");
		options.addArguments(
				"user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36"); // access
																																						// deny
																																						// 설정
		options.addArguments("--disable-blink-features=AutomationControlled");
		options.addArguments("--disable-extensions");
//		options.addArguments("headless");

		driver = new ChromeDriver(options);
		System.out.println(testVO.getUrl());

		url = testVO.getUrl();
		nickName = testVO.getNickName();
		ReviewVO finalReviewVO = new ReviewVO();
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
			// button[x] // x : 2 ~ 11 -----> 1 ~ 10 페이지
			// button[x] // x : 1 -> 이전 페이지
			// button[x] // x : 12 -> 다음페이지

			String xpathCommon = "//*[@id=\"btfTab\"]/ul[2]/li[2]/div/div[6]/section[4]/article[";
			String xpathUser = "]/div[1]/div[2]/span";
			String xpathDate = "]/div[1]/div[3]/div[2]";
			String xpathTitleDetail = "]/div[1]/div[5]";
			String xpathReview = "]/div[4]/div";
			String text = "";
			String xpathBtnCommon = "//*[@id=\"btfTab\"]/ul[2]/li[2]/div/div[6]/section[4]/div[3]/button[";
			String xpathBtn = "]";
			
			boolean check = true;
			int l = 0;
			int reviewOption = 200;
			while (check) {
				try {
					for (int i = 2; i < 12; i++) {
						String tmpBtn = "";
						tmpBtn = xpathBtnCommon + i + xpathBtn;

						element = driver.findElement(By.xpath(tmpBtn)); // x페이지 이동 = button[x+1]
						element.click();
						Thread.sleep(1000); // 페이지 버튼 클릭

						for (int j = 1; j < 6; j++) {
							ReviewVO reviewVO = new ReviewVO();
							String tmp = "";

							int k = (i - 2) * 5 + (j - 1) + l;
							log.info(k + "=============");

							reviewVO.setTitle(titleTmp);
							text = xpathCommon + j + xpathUser;
							element = driver.findElement(By.xpath(text)); // 유저명
							tmp = element.getText().trim();
							reviewVO.setNickName(tmp);
							if (tmp == nickName || tmp.equals(nickName)) {
								log.info("============닉네임 발견==========");
								check = false;
							}
							log.info("유저명) " + tmp);
							text = xpathCommon + j + xpathDate;
							element = driver.findElement(By.xpath(text)); // 날짜
							tmp = element.getText();
							reviewVO.setDate(tmp);
							log.info("날짜) " + tmp);
							
							
							SimpleDateFormat sdformat = new SimpleDateFormat("yyyy.MM.dd"); // 날짜형식
							
							Date dateCur = new Date(); //현재날짜
							Date dateRev = sdformat.parse(tmp); //리뷰날짜
							
							Calendar calCur = Calendar.getInstance(); //현재날짜
							Calendar calRev = Calendar.getInstance(); //리뷰날짜
							
							int sub=3; //3일전 날짜까지
							
							calCur.setTime(dateCur);//현재날짜
							calCur.add(Calendar.DATE,-sub-1);//현재날짜 -3일
							calRev.setTime(dateRev);//리뷰날짜
							
							if(calCur.compareTo(calRev)>0){
								log.info("==================={}일 초과 !=======================",sub);
								driver.quit();
								return finalReviewVO;
							}

							text = xpathCommon + j + xpathTitleDetail;
							element = driver.findElement(By.xpath(text)); // 세부상품이름
							tmp = element.getText();
							reviewVO.setTitleDetail(tmp);
							log.info("세부상품명) " + tmp);

							try {
								text = xpathCommon + j + xpathReview;
								element = driver.findElement(By.xpath(text)); // 리뷰
								tmp = element.getText();
								reviewVO.setReview(tmp);
								reviewVO.setReviewLength(tmp.length());
								log.info("리뷰) " + tmp);
							} catch (Exception e) {

							}

							reviewVOs.add(reviewVO);
							if (check == false) {
								break;
							}
							reviewOption--;
							if (reviewOption == 0) {
								log.info("0~{}까지 리뷰 미발견", k);
								driver.quit();
								return finalReviewVO;
							}
						}
						if (check == false) {
							break;
						}
					}
					if (check == false) {
						break;
					}
					String tmpBtn2 = xpathBtnCommon + 12 + xpathBtn;
					element = driver.findElement(By.xpath(tmpBtn2)); // x페이지 이동 = button[x+1]
					element.click();
					Thread.sleep(1000); // 다음 페이지 버튼 클릭
					l += 50;
				} catch (Exception e) {
					break;
				}
			}
			if (check == false) {
				log.info("===============최종 결과=========================");

				finalReviewVO.setNickName(reviewVOs.get(reviewVOs.size() - 1).getNickName());
				finalReviewVO.setTitle(reviewVOs.get(reviewVOs.size() - 1).getTitle());
				finalReviewVO.setDate(reviewVOs.get(reviewVOs.size() - 1).getDate());
				finalReviewVO.setTitleDetail(reviewVOs.get(reviewVOs.size() - 1).getTitleDetail());
				finalReviewVO.setReview(reviewVOs.get(reviewVOs.size() - 1).getReview());
				finalReviewVO.setReviewLength(reviewVOs.get(reviewVOs.size() - 1).getReviewLength());

				try {
					log.info("리뷰 글자수) " + finalReviewVO.getReview().length());
					return finalReviewVO;
				} catch (Exception e) {
					log.info("리뷰 글자수) 0");
				}
			} else {
				ReviewVO reviewVO = new ReviewVO();
				return reviewVO;
			}
		} catch (Exception e) {
//			e.printStackTrace();
		} finally {
			try {
				driver.quit(); // 브라우저 종료
			} catch (Exception e2) {
			}
		}
		return finalReviewVO;
	}

	//////////////////////////////////////////////////////////////////// 네이버 시작
	//////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////
	public ReviewVO getReviewNaver(ReviewVO reviewVO) {
		
		System.setProperty(WEB_DRIVER_ID, chromePath);
				
		ChromeOptions options = new ChromeOptions(); // WebDriver 옵션 설정
		
		options.addArguments("--start-maximized");
		options.addArguments("--disable-popup-blocking");
		options.addArguments("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36"); // access deny 설정
		options.addArguments("--disable-blink-features=AutomationControlled");
		options.addArguments("--disable-extensions");
//		options.addArguments("headless");
		
		driver = new ChromeDriver(options);
		System.out.println(reviewVO.getUrl());
		
		url = reviewVO.getUrl();
		ReviewVO finalReviewVO = new ReviewVO();
		try {
			driver.get(url); // 1. url 접속
			Thread.sleep(3000);
			
			try {
				try {
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/div/div[3]/div[2]/ul/li[2]/a"));
					element.click(); // 2. 리뷰 클릭
				} catch (Exception e) {
					element = driver.findElement(By.xpath("//*[@id=\"_productTabContainer\"]/div/ul/li[2]/a"));
					element.click();// 2. 리뷰 클릭
				}
			} catch (Exception e) {
				element = driver.findElement(By.xpath("//*[@id=\"content\"]/div/div[3]/div[3]/ul/li[2]/a"));
				element.click();// 2. 리뷰 클릭
			}
			Thread.sleep(1000); 
			
			element = driver.findElement(By.xpath("//*[@id=\"REVIEW\"]/div/div[3]/div[1]/div[1]/ul/li[2]"));
			element.click();
			Thread.sleep(1000); // 3. 최신순 클릭
			
			String xpathFrontID = "//*[@id=\"REVIEW\"]/div/div[3]/div[2]/ul/li[";
			String xpathBackID = "]/div/div/div/div[1]/div/div/div[1]/div[2]/div[2]/strong";
			String xpathID = "";
			//*[@id="REVIEW"]/div/div[3]/div[2]/ul/li[1]/div/div/div/div[1]/div/div[1]/div[1]/div[2]/div[2]/strong
			String searchNickName = reviewVO.getNickName(); //찾을 닉네임, 찾을 글자(2 or 4)
			int searchLength; //찾을 글자수
			boolean check = true; // 찾으면 false
			
			searchLength = searchNickName.length();
			
			if(searchLength>=7) {
				searchNickName=searchNickName.substring(0,4);
			}else {
				searchNickName=searchNickName.substring(0,2);
			}
			
			//*[@id="REVIEW"]/div/div[3]/div[2]/ul/li[1]/div/div/div/div[1]/div/div/div[2]/div/span[2] 리뷰내용
			//*[@id="REVIEW"]/div/div[3]/div[2]/ul/li[2]/div/div/div/div[1]/div/div/div[2]/div/span[2]
			//*[@id="REVIEW"]/div/div[3]/div[2]/ul/li[1]/div/div/div/div[1]/div/div[1]/div[2]/div/span
			
			//*[@id="REVIEW"]/div/div[3]/div[2]/div/div/a[1] 이전?
			//*[@id="REVIEW"]/div/div[3]/div[2]/div/div/a[2] 페이징 1번
			//*[@id="REVIEW"]/div/div[3]/div[2]/div/div/a[10] 페이징 9번
			//*[@id="REVIEW"]/div/div[3]/div[2]/div/div/a[11] 다음
			
			
			//*[@id="REVIEW"]/div/div[3]/div[2]/ul/li[1]/div/div/div/div[1]/div/div/div[1]/div[2]/div[2]/span/text() 날짜X
			//*[@id="REVIEW"]/div/div[3]/div[2]/ul/li[2]/div/div/div/div[1]/div/div/div[1]/div[2]/div[2]/span 날짜O
			
			String xpathFrontReview ="//*[@id=\"REVIEW\"]/div/div[3]/div[2]/ul/li[";  
			String xpathBackReview = "]/div/div/div/div[1]/div/div/div[2]/div/span[2]";
			String xpathBackReviewPhoto = "]/div/div/div/div[1]/div/div[1]/div[2]/div/span";
			String xpathReview ="";
			
			String xpathFrontPage ="//*[@id=\"REVIEW\"]/div/div[3]/div[2]/div/div/a[";
			String xpathBackPage ="]";
			String xpathPage ="";
			
			String xpathFrontDate ="//*[@id=\"REVIEW\"]/div/div[3]/div[2]/ul/li[";
			String xpathBackDate ="]/div/div/div/div[1]/div/div/div[1]/div[2]/div[2]/span";
			String xpathDate ="";
			log.info(xpathFrontReview+xpathBackReview);
			log.info(xpathFrontDate+xpathBackDate);
			
			int j=1;
			int l=0;
			int m=0;
			List<ReviewVO> reviewVOs = new ArrayList<>();
			while(check) {
				String k = Integer.toString(j);
				element = driver.findElement(By.linkText(k));
				element.click();
				Thread.sleep(1000);
				
				for(int i=1;i<21;i++) {
					m=l*20+i;
					try {
						element = driver.findElement(By.xpath(xpathFrontID+i+xpathBackID));
						String nickName = element.getText().trim(); // 익명 닉네임)
						int nickNameLength = nickName.length(); // 익명 글자수
						
						xpathDate = xpathFrontDate+i+xpathBackDate;
						element = driver.findElement(By.xpath(xpathDate));
						
						String date = element.getText().trim(); // 날짜
						SimpleDateFormat sdformat = new SimpleDateFormat("yy.MM.dd."); // 날짜형식
						
						Date dateCur = new Date(); //현재날짜
						Date dateRev = sdformat.parse(date); //리뷰날짜
						
						Calendar calCur = Calendar.getInstance(); //현재날짜
						Calendar calRev = Calendar.getInstance(); //리뷰날짜
						
						
						int sub=3; //3일전 날짜까지
						
						calCur.setTime(dateCur);//현재날짜
						calCur.add(Calendar.DATE,-sub-1);//현재날짜 -3일
						calRev.setTime(dateRev);//리뷰날짜
						
						if(calCur.compareTo(calRev)>0){
							log.info("==================={}일 초과 !=======================",sub);
							driver.quit();
							return finalReviewVO;
						}
						
						log.info("{}-1) {}",m,searchNickName);
						log.info("{}-2) {}",m,nickName);
//						log.info("{}-3) {}",m,date);
						if(nickNameLength>=7) {
							nickName=nickName.substring(0,4); // 익명 글자(4)
						}else {
							nickName=nickName.substring(0,2); // 익명 글자(2)
						}
						if(nickName.equals(searchNickName) && nickNameLength==searchLength) {
							log.info("{}) =============앞자리와 글자수가 일치함==============",m);
							check=false;
							
							try {
								element=driver.findElement(By.xpath(xpathFrontReview+i+xpathBackReview));								
							} catch (Exception e) {
								element=driver.findElement(By.xpath(xpathFrontReview+i+xpathBackReviewPhoto));								
							}
							String review = element.getText().trim();
							
							int reviewLength = review.length();
							log.info("{}리뷰내용) {}",m,review);
							log.info("{}리뷰글자수) {}",m,reviewLength);
							
							reviewVO.setNickName(nickName);
							reviewVO.setReview(review);
							reviewVO.setReviewLength(reviewLength);
							reviewVOs.add(reviewVO);
						}
						Thread.sleep(100);
						if(!check) {
							break;
						}
					} catch (Exception e) {
						log.info("{}",e);
						log.info("============= 페이지의 리뷰가 1~19개일때===============");
						break;
					}
				}
				l++;
				j++;
			}//while(check)문

			log.info("닉네임){}",reviewVO.getNickName());
			log.info("리뷰){}",reviewVO.getReview());
			log.info("리뷰수){}",reviewVO.getReviewLength());
			
			
		}catch (Exception e) {
			//첫 try catch
		}finally {
//			driver.quit();
		}
			
		return reviewVO;
	}
}