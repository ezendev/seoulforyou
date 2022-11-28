package com.ezdev.sfy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	//bottom.jsp 페이스북 아이콘 -> 마이페이지
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "mypage/mypage";
	}

	@RequestMapping(value = {"/mypage_route.do"})
	public String mypageRoute() {
		return "mypage/mypage_route";
	}
	
	@RequestMapping(value = {"/mypage_review.do"})
	public String mypageReview() {
		return "mypage/mypage_review";
	}
	
	@RequestMapping(value = {"/mypage_favorite.do"})
	public String mypageFavorite() {
		return "mypage/mypage_favorite";
	}
	
	@RequestMapping(value = {"/mypage_qna.do"})
	public String mypageQna() {
		return "mypage/mypage_qna";
	}
	
	
}
