package com.shop.goodee.follow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/follow/*")
public class FollowController {

	@Autowired
	private FollowService followService;
	
	@GetMapping("follow")
	public void follow()throws Exception{
		
	}
	
	@PostMapping("getFollow")
	@ResponseBody
	public void getFollow(MultipartFile f) throws Exception{
		followService.getFollow(f);
	}
	
}
