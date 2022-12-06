package com.ezdev.sfy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.apache.ibatis.session.SqlSession;

import com.ezdev.sfy.dao.mypage_routeService;
import com.ezdev.sfy.dto.MypageDTO;
import com.ezdev.sfy.mypage.Criteria;
import com.ezdev.sfy.mypage.PageMaker;
import com.ezdev.sfy.mypage.SearchCriteria;
import com.ezdev.sfy.service.MypageMapper;

@Controller
public class MypageController {
    
	
	@Autowired
	MypageMapper mypageMapper;
	@Autowired
	mypage_routeService mypage_routeservice;
	
	
	//bottom.jsp 페이스북 아이콘 -> 마이페이지
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "mypage/mypage";
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
	@RequestMapping(value="/mypage_friend.do")
	public String mypage_friend(HttpServletRequest req) {
		List<MypageDTO> list = mypageMapper.listFriend();
		req.setAttribute("listFriend", list);
		return "mypage/mypage_friend";
	}
	@RequestMapping(value="/mypage_friend_insert.do")
	public String mypage_friend_insert(HttpServletRequest req, @ModelAttribute MypageDTO dto) {
		int res = mypageMapper.insertFriend(dto);
		if(res>0) {
			req.setAttribute("msg", "친구 추가 성공");
			req.setAttribute("url", "mypage_friend.do");
		}else {
			req.setAttribute("msg", "친구 추가 실패");
			req.setAttribute("url", "mypage_friend_do");
		}
		return "message";
	}
	@RequestMapping(value="/mypage_friend_delete.do")
	public String mypage_friend_delete(HttpServletRequest req, @RequestParam(required = false) int friend_num) {
		int res = mypageMapper.deleteFriend(friend_num);
		if(res>0) {
			req.setAttribute("msg", "친구 삭제 성공");
			req.setAttribute("url", "mypage_friend.do");
		}else {
			req.setAttribute("msg", "친구 삭제 실패");
			req.setAttribute("url", "mypage_friend_do");
		}
		return "message";
	}
	@GetMapping("/mypage_route.do")
	 public String mypageRoute(Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		 model.addAttribute("mypage_route.do", mypage_routeservice.listRoutetest(cri));
		 
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(mypage_routeservice.routetestCount(cri));
		 model.addAttribute("pagemaker", pageMaker);
		 
		 return "mypage/mypage_route";
	 }
	 @GetMapping("/mypage_routetest_insert.do")
	 public String routetestinsert(MypageDTO dto) throws Exception {
		 mypage_routeservice.insertRoutetest(dto);
		 return "mypage/mypage_route";
	 }
}
