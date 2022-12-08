package com.ezdev.sfy;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.MypageDTO;
import com.ezdev.sfy.dto.TourDTO;
import com.ezdev.sfy.service.MemberMapper;
import com.ezdev.sfy.service.MypageMapper;


@Controller
public class MypageController {
    
	
	@Autowired
	MypageMapper mypageMapper;
	/*
	 * @Autowired MemberMapper memberMapper;
	 */
	
	//bottom.jsp 페이스북 아이콘 -> 마이페이지
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "mypage/mypage";
	}
	 
	@RequestMapping(value = {"/mypage_review.do"})
	public String mypageReview() {
		return "mypage/mypage_review";
	}
	@RequestMapping(value = {"/mypage_route.do"})
	public String mypageRoute() {
		return "mypage/mypage_route";
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
	public String mypage_friend_insert(HttpServletRequest req, @ModelAttribute MemberDTO memberdto) {
		int res = mypageMapper.insertFriend(memberdto);
		if(res>0) {
			req.setAttribute("msg", "친구 추가 성공");
			req.setAttribute("url", "mypage_friend.do");
		}else {
			req.setAttribute("msg", "친구 추가 실패");
			req.setAttribute("url", "mypage_friend.do");
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
			req.setAttribute("url", "mypage_friend.do");
		}
		return "message";
	}
	@RequestMapping(value="/mypage_friend_listmember.do")
	public String mypage_friend_listmember(HttpServletRequest req, @RequestParam(required = false) String pageNum, Map<String, String> find) {
		int pageSize = 5;
		if (pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		int countRow = mypageMapper.listMypageMemberCount();
		if (endRow > countRow) endRow = countRow;
		
		List<MemberDTO> list = mypageMapper.listMypageMember(startRow, endRow);
		int num = countRow - (startRow - 1);
		req.setAttribute("listMypageMember", list);
		req.setAttribute("num", num);
		int pageCount = countRow / pageSize + (countRow%pageSize==0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;		
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
			
		return "mypage/mypage_friend_listmember";
	}
	@RequestMapping(value="/mypage_findmember.do")//미완성
	public String mypage_findmember(HttpServletRequest req, @RequestParam Map<String, String> find) {
		
			return "mypage/mypage_friend_listmember";
	}
	
	
}
