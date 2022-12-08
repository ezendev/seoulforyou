package com.ezdev.sfy;

import java.util.HashMap;
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
import com.ezdev.sfy.dto.FriendDTO;
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
	 
	@RequestMapping("/mypage_review.do")
	public String mypageReview() {
		return "mypage/mypage_review";
	}
	@RequestMapping("/mypage_route.do")
	public String mypageRoute() {
		return "mypage/mypage_route";
	}
	
	@RequestMapping("/mypage_qna.do")
	public String mypageQna() {
		return "mypage/mypage_qna";
	}
	@RequestMapping("/mypage_friend.do")
	public String mypage_friend(HttpServletRequest req) {
		List<FriendDTO> list = mypageMapper.listFriend();
		req.setAttribute("listFriend", list);
		return "mypage/mypage_friend";
	}
	@RequestMapping("/mypage_friend_insert.do")
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
	@RequestMapping("/mypage_friend_delete.do")
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
	@RequestMapping("/mypage_friend_listmember.do")
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
	@RequestMapping("/mypage_findmember.do")//미완성
	public String mypage_findmember(HttpServletRequest req, @RequestParam Map<String, String> find) {
		
			return "mypage/mypage_friend_listmember";
	}
	@RequestMapping("/mypage_favorite.do")
	public String mypageFavorite(HttpServletRequest req,HttpSession session) {
		Map<String,Object> map=new HashMap<>(); 
		String tour_no =req.getParameter("f_no");
		 MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");	
	      int no = mdto.getMember_no();	  
	      map.put("tour_no", tour_no);
	      map.put("no", no);	      
		int res =mypageMapper.updateFavorite(map);
		if(res>0) {
			req.setAttribute("msg", "즐겨찾기가 등록되었습니다!");
			req.setAttribute("url", "tourList.do");
			return "message";
		}
		return null;	
	}
	
}
