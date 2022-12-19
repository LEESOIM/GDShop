package com.shop.goodee.chat;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.goodee.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat/*")
@Slf4j
public class MainController {
	
	List<RoomVO> roomList = new ArrayList<RoomVO>();
	static int roomNumber = 0;

	@Value("${SECRET.KEY}")
    private String secretKey;    
	
    @Value("${APIGW.URL}")
    private String apiUrl;
	
	@RequestMapping("/chatbot")
	public ModelAndView chat() {
		log.info("챗봇 진입-- ");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chatbot");
		return mv;
	}
	
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/room");
		return mv;
	}
	
	@RequestMapping("/createRoom")
	@ResponseBody
	public List<RoomVO> createRoom(RoomVO roomVO){
		roomVO.setRoomNumber(++roomNumber);
		roomVO.setRoomName("상담방"+roomNumber);
		roomList.add(roomVO);
		return roomList;
	}
	
	@RequestMapping("/getRoom")
	@ResponseBody
	public List<RoomVO> getRoom(){
		return roomList;
	}
	
	@RequestMapping("/moveChating")
	public ModelAndView chating(RoomVO roomVO, HttpSession session, MemberVO memberVO) {
		ModelAndView mv = new ModelAndView();
		log.info("roomname => {}", roomVO);
		mv.addObject("room", roomVO);
		if(session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			SecurityContextImpl context = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			Authentication authentication = context.getAuthentication();
			memberVO = (MemberVO) authentication.getPrincipal();
			mv.addObject("memberVO", memberVO);
		}
		mv.setViewName("chat/chat");
		return mv;
	}


    @RequestMapping("/sendMessage")
    @ResponseBody
    public String sendMessage(@RequestBody String chatMessage) throws IOException
    {
    	
        URL url = new URL(apiUrl);
        
        String message =  getReqMessage(chatMessage);
        String encodeBase64String = makeSignature(message, secretKey);

        //api서버 접속 (서버 -> 서버 통신)		
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json;UTF-8");
        con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        
        wr.write(message.getBytes("UTF-8"));
        wr.flush();
        wr.close();
        int responseCode = con.getResponseCode();
        BufferedReader br;

        if(responseCode==200) { // 정상 호출

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(
                            con.getInputStream(), "UTF-8"));
            String decodedString;
            String jsonString  = "";
            while ((decodedString = in.readLine()) != null) {
                jsonString = decodedString;
            }
            
            
            //받아온 값을 세팅하는 부분
            JSONParser jsonparser = new JSONParser();
            try {
                JSONObject json = (JSONObject)jsonparser.parse(jsonString);
                JSONArray bubblesArray = (JSONArray)json.get("bubbles");
                chatMessage = "";
                for(int i=0; i<bubblesArray.size(); i++) {
                	JSONObject bubbles = (JSONObject)bubblesArray.get(i);
                	JSONObject data = (JSONObject)bubbles.get("data");
                	String description = "";
                	description = (String)data.get("description");
                	chatMessage = chatMessage + "|" + description;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            in.close();
        } else {  // 에러 발생
            chatMessage = con.getResponseMessage();
        }
        return chatMessage;
    }

    //보낼 메세지를 네이버에서 제공해준 암호화로 변경해주는 메소드
    public static String makeSignature(String message, String secretKey) {

        String encodeBase64String = "";

        try {
            byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

            SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);

            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
            encodeBase64String = Base64.encodeBase64String(rawHmac);

            return encodeBase64String;

        } catch (Exception e){
        }
        return encodeBase64String;

    }

    //보낼 메세지를 네이버 챗봇에 포맷으로 변경해주는 메소드
    public static String getReqMessage(String voiceMessage) {

        String requestBody = "";

        try {

            JSONObject obj = new JSONObject();

            long timestamp = new Date().getTime();
            
            obj.put("version", "v2");
            obj.put("userId", UUID.randomUUID().toString());
            obj.put("timestamp", timestamp);

            JSONObject bubbles_obj = new JSONObject();

            bubbles_obj.put("type", "text");

            JSONObject data_obj = new JSONObject();
            data_obj.put("description", voiceMessage);

            bubbles_obj.put("type", "text");
            bubbles_obj.put("data", data_obj);

            JSONArray bubbles_array = new JSONArray();
            bubbles_array.add(bubbles_obj);

            obj.put("bubbles", bubbles_array);
            obj.put("event", "send");

            requestBody = obj.toString();
            
            log.info("request body => {}", requestBody);

        } catch (Exception e){
            System.out.println("## Exception : " + e);
        }
        
        return requestBody;

    }
}
