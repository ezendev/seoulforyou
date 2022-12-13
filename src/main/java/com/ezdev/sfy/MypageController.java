package com.ezdev.sfy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.MyPageDTO;
import com.ezdev.sfy.dto.MyRouteDTO;
import com.ezdev.sfy.service.MyRouteMapper;
import com.ezdev.sfy.dto.FriendDTO;
import com.ezdev.sfy.dto.TourDTO;
import com.ezdev.sfy.service.ChatMapper;
import com.ezdev.sfy.service.MemberMapper;
import com.ezdev.sfy.service.MypageMapper;


@Controller
public class MypageController {
    
	
	@Autowired
	MypageMapper mypageMapper;
	
	@Autowired
	ChatMapper chatMapper;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MyRouteMapper myrouteMapper;
	
	//bottom.jsp 페이스북 아이콘 -> 마이페이지	 
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest req, HttpSession session) {
		int no =(int) session.getAttribute("nowUserNo");
		MemberDTO dto = memberMapper.getMemberNo(no);
		session.setAttribute("getMember", dto);
		return "mypage/mypage_main";
	}

	@RequestMapping(value = "/mypage_route.do" ,method=RequestMethod.GET)
	public String mypageRoute(HttpServletRequest req, HttpSession session, @RequestParam (required=false) String pageNum) {
		//유저 접속
		int no =(int) session.getAttribute("nowUserNo");
		
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize=5;
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = startRow +pageSize-1;
		int countRow = mypageMapper.getCountRoute(no);
		if(endRow>countRow) endRow=countRow;
		
		List<MyRouteDTO> list = mypageMapper.listMyroute(no, startRow, endRow);
		int num = countRow-(startRow-1);
		req.setAttribute("listMyroute", list);
		req.setAttribute("num", num);
		int pageCount = countRow/pageSize +(countRow%pageSize==0? 0:1);
		int pageBlock=3;
		int startPage=(currentPage -1)/pageBlock*pageBlock+1;
		int endPage = startPage +pageBlock -1;
		if(endPage> pageCount)endPage = pageCount;
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		return "mypage/mypage_route";
	}
	
	@RequestMapping("/mypage_review.do")
	public String mypageReview() {
		return "mypage/mypage_review";
	}
	
	@RequestMapping("/mypage_qna.do")
	public String mypageQna() {
		return "mypage/mypage_qna";
	}
	@RequestMapping("/mypage_friend.do")
	public String mypage_friend(HttpServletRequest req, HttpSession session) {
		
		// 로그인한 유저의 no값
		int no = (int) session.getAttribute("nowUserNo");
		
		// 친구 리스트 불러오기
			// 로그인한 유저의 mypageDTO에서 친구 불러오기
		MyPageDTO mdto = mypageMapper.getMyPage(no);
		String friends = mdto.getMypage_friend();

		if(friends != null) {
			//콤마를 기준으로 배열에 넣고 mybatis foreach 처리를 위해 리스트에 넣기
			String[] arr = friends.split(",");
			List list = new ArrayList();
			for(int i=0; i<arr.length; i++) {
				list.add(arr[i]);
			}
			
			//mybatis String 매개변수 처리를 위해 map에 넣기
			Map<String, Object> map = new HashMap<>();
			map.put("friends", list);
			
			List<MemberDTO> friend_list = mypageMapper.listFriend(map);
			
			req.setAttribute("listFriend", friend_list);
		}

		return "mypage/mypage_friend";
	}
	@RequestMapping("/mypage_friend_insert.do")
	public String mypage_friend_insert(HttpServletRequest req, @RequestParam String member_no,
										HttpSession session) {
		// 로그인한 유저의 no값
		int no = (int) session.getAttribute("nowUserNo");
		
		// 이미 친구라면 추가 불가
			// 로그인한 유저의 mypageDTO에서 친구 불러오기
		MyPageDTO mdto = mypageMapper.getMyPage(no);
		String friends = mdto.getMypage_friend();
		
		if(friends != null) {
			//콤마를 기준으로 배열에 넣기
			String[] arr = friends.split(",");
			for(int i=0; i<arr.length; i++) {
				if(arr[i].equals(member_no)) { //만약 배열 i번째 값이 새로 추가하려는 친구의 no와 같다면
					req.setAttribute("msg", "이미 친구입니다.");
					return "closeWindow";
				}
			}
		}
			
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("friend_no", member_no);
		
		// 임시: 친구수락 과정이 없어 쿼리문을 두 번 실행해서 상호 친구추가하게 해둠
		int res = mypageMapper.insertFriend(map);
		
		if(res>0) {
			req.setAttribute("msg", "친구를 추가했습니다.");
		}else {
			req.setAttribute("msg", "친구 추가를 실패했습니다.");
		}
		return "closeWindow";
	}
	
	@RequestMapping("/mypage_friend_delete.do")
	public String mypage_friend_delete(HttpServletRequest req, HttpSession session,
										@RequestParam int friend_no) {

		// 로그인한 유저의 no값
		int no = (int) session.getAttribute("nowUserNo");
		
		// 삭제할 친구 특정하기
			// 로그인한 유저의 mypageDTO에서 친구 불러오기
		MyPageDTO mdto = mypageMapper.getMyPage(no);
		String friends = mdto.getMypage_friend();
		
			//콤마를 기준으로 배열에 넣기
		String[] arr = friends.split(",");
		for(int i=0; i<arr.length; i++) {
			if(friend_no == Integer.parseInt(arr[i])) { // 만약 배열 i번째 값이 삭제하려는 친구의 no와 같다면

				Map<String, Integer> map = new HashMap<>();
				map.put("no", no);
				map.put("friend_no", friend_no);
				
				int res = mypageMapper.deleteFriend(map); //친구 삭제
				int res2 = chatMapper.deleteChat(map); //친구와 주고받은 쪽지 삭제
				
				System.out.println(res2);
				
				if(res>0) {
					req.setAttribute("msg", "친구를 삭제했습니다.");
					req.setAttribute("url", "mypage_friend.do");
				}else {
					req.setAttribute("msg", "친구 삭제를 실패했습니다.");
					req.setAttribute("url", "mypage_friend.do");
				}
				return "message";
			}
		}
		return null;
		
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
