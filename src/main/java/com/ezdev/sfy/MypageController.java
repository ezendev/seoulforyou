package com.ezdev.sfy;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Hashtable;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.MyPageDTO;
import com.ezdev.sfy.dto.MyRouteDTO;
import com.ezdev.sfy.dto.ReviewDTO;
import com.ezdev.sfy.service.MyRouteMapper;
import com.ezdev.sfy.dto.FriendDTO;
import com.ezdev.sfy.dto.TourDTO;
import com.ezdev.sfy.service.ChatMapper;
import com.ezdev.sfy.service.MemberMapper;
import com.ezdev.sfy.service.MypageMapper;
import com.ezdev.sfy.service.TourMapper;


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
	
	@Autowired
	TourMapper tourMapper;	
	
	//bottom.jsp 페이스북 아이콘 -> 마이페이지	 
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest req, HttpSession session) {
		int no =(int) session.getAttribute("nowUserNo");
		MemberDTO dto = memberMapper.getMemberNo(no);
		session.setAttribute("getMember", dto);
		return "mypage/mypage_main";
	}
	@RequestMapping("/update.do")
	public String mypage(HttpServletRequest req,@ModelAttribute MemberDTO dto) {				
		HttpSession session=req.getSession();
		int res=memberMapper.updateMember(dto);
		if(res>0) {
			session.setAttribute("mdto", dto);
			req.setAttribute("msg", "수정 완료");
			req.setAttribute("url", "mypage.do");
		}else {
			req.setAttribute("msg", "수정 실패");
			req.setAttribute("url", "mypage.do");
		}
		return "message";
	}
	@RequestMapping(value = "/mypage_route.do")
	public String mypageRoute(HttpServletRequest req, HttpSession session, @RequestParam (required=false) String pageNum, @RequestParam(required =false)String route_hashtag) {
		//유저 접속
		int no =(int) session.getAttribute("nowUserNo");
		//테마로 필터링
		int countRow =0;
		if(route_hashtag == null ||route_hashtag.trim()=="") {
			route_hashtag="0";
			countRow = mypageMapper.getCountRoute(no);
		}else {
			countRow = mypageMapper.getCountRouteFilter(no, route_hashtag);
		}
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize=5;
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = startRow +pageSize-1;
		if(endRow>countRow) endRow=countRow;
			
		int num = countRow-(startRow-1);
		int pageCount = countRow/pageSize +(countRow%pageSize==0? 0:1);
		int pageBlock=3;
		int startPage=(currentPage -1)/pageBlock*pageBlock+1;
		int endPage = startPage +pageBlock -1;
		if(endPage> pageCount)endPage = pageCount;
		
		List<MyRouteDTO> list= null;
		if(!route_hashtag.trim().equals("0")) {
			Map<String, Object>filterMap = new Hashtable<>();
			filterMap.put("no", no);
			filterMap.put("start", startRow);
			filterMap.put("end", endRow);
			filterMap.put("route_hashtag", route_hashtag);
			list = mypageMapper.filterMyroute(filterMap);
		}else{
			list = mypageMapper.listMyroute(no, startRow, endRow);
		}
		
		req.setAttribute("route_hashtag", route_hashtag);
		req.setAttribute("listMyroute", list);
		req.setAttribute("num", num);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		return "mypage/mypage_route";
	}
	
	@RequestMapping(value="/mypage_review.do")
	   public String listReview(HttpServletRequest req, @RequestParam(required = false) String pageNum, Map<String, String> map, HttpSession session) {
		// 로그인한 유저의 no값
				int no = (int) session.getAttribute("nowUserNo");

		int pageSize = 10;
		if (pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;   
		int countRow = mypageMapper.listReviewCount(no);
		if (endRow > countRow) endRow = countRow;
		List<ReviewDTO> rlist = mypageMapper.listReview(startRow, endRow, no);
		int num = countRow - (startRow - 1);
		req.setAttribute("listReview", rlist);
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
		   return "mypage/mypage_review";
	   }
	
	
	@RequestMapping(value = "/mypage_favorite_list.do")
	public String mypageFavorite(HttpServletRequest req, HttpSession session,
			@RequestParam(required=false) String pageNum,
			@RequestParam(required =false)String favorite_type) {
		
		if(favorite_type == null) {
			favorite_type = "여행지";
		}
		
		//유저 접속
		int no =(int) session.getAttribute("nowUserNo");
		MyPageDTO mdto = mypageMapper.getMyPage(no);
		
		List<TourDTO> favTourList= new ArrayList<>();
		List<MyRouteDTO> favRouteList= new ArrayList<>();
		
		if(favorite_type.equals("여행지")) {
			
			String[]arr = null;
			String mytour= mdto.getMypage_favorite_tour();
			
			if(mytour != null) {
				arr = mytour.split(",");
				for(String tour : arr) {
					int tour_no = Integer.parseInt(tour);
					TourDTO tdto = tourMapper.getTour(tour_no);
					favTourList.add(tdto);
				}
				
				//페이징
				int countRow = arr.length;
				if(pageNum==null) {
					pageNum="1";
				}
				int currentPage = Integer.parseInt(pageNum);
				int pageSize=5;
				int startRow = (currentPage-1)*pageSize+1;
				int endRow = startRow +pageSize-1;
				if(endRow>countRow) endRow=countRow;
				
				int num = countRow-(startRow-1);
				int pageCount = countRow/pageSize +(countRow%pageSize==0? 0:1);
				int pageBlock=3;
				int startPage=(currentPage -1)/pageBlock*pageBlock+1;
				int endPage = startPage +pageBlock -1;
				if(endPage> pageCount)endPage = pageCount;
				
				req.setAttribute("num", num);
				req.setAttribute("pageCount", pageCount);
				req.setAttribute("pageBlock", pageBlock);
				req.setAttribute("startPage", startPage);
				req.setAttribute("endPage", endPage);
				req.setAttribute("favTourList", favTourList.subList(startRow-1, endRow));
			}
		
			
			
		}else if(favorite_type.equals("여행루트")) {
			
			String[]arr = null;
			String myroute= mdto.getMypage_favorite_route();
			if(myroute != null) {
				 arr = myroute.split(",");
				 for(String route : arr) {
						int route_no = Integer.parseInt(route);
						MyRouteDTO rdto = myrouteMapper.getRoute(route_no);
						favRouteList.add(rdto);
					}
				 
				//페이징
					int countRow = arr.length;
					if(pageNum==null) {
						pageNum="1";
					}
					int currentPage = Integer.parseInt(pageNum);
					int pageSize=5;
					int startRow = (currentPage-1)*pageSize+1;
					int endRow = startRow +pageSize-1;
					if(endRow>countRow) endRow=countRow;
					
					int num = countRow-(startRow-1);
					int pageCount = countRow/pageSize +(countRow%pageSize==0? 0:1);
					int pageBlock=3;
					int startPage=(currentPage -1)/pageBlock*pageBlock+1;
					int endPage = startPage +pageBlock -1;
					if(endPage> pageCount)endPage = pageCount;
					
					req.setAttribute("num", num);
					req.setAttribute("pageCount", pageCount);
					req.setAttribute("pageBlock", pageBlock);
					req.setAttribute("startPage", startPage);
					req.setAttribute("endPage", endPage);
					req.setAttribute("favRouteList", favRouteList.subList(startRow-1, endRow));
			}
		}
		
		req.setAttribute("favorite_type", favorite_type);
		
		/*

		*/
		
		return "mypage/mypage_favorite";
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
	@RequestMapping(value="/mypage_favorite.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String mypageFavorite(HttpServletRequest req,HttpSession session) {
		Map<String,Object> map=new HashMap<>(); 
		int tour_no = Integer.parseInt(req.getParameter("no"));
		
		// 로그인 안 되어있으면
		if(session.getAttribute("nowUserNo") == null) {
			return "loginFirst";
		}
		
		int no = (int) session.getAttribute("nowUserNo");
	    MyPageDTO pdto = mypageMapper.getMyPage(no);
		
		// 기존 즐겨찾기가 존재하면
		if(pdto.getMypage_favorite_tour() != null) {
			//즐겨찾기(tour)가져오기& ','별로 나눠서 배열에 담기
			String tour= pdto.getMypage_favorite_tour();
			String[] arr = tour.split(",");
			
			//현재 tour_no가 즐겨찾기 안에 있는지 검색
			for(String list_tno : arr) {
				int tno = Integer.parseInt(list_tno);
				
				if(tno == tour_no) { //즐겨찾기 해제
					String update_tour = tour.replace(String.valueOf(tour_no)+",", "");
					map.put("tour", update_tour);
				    map.put("no", no);
				    int res = mypageMapper.deleteFavorite(map);
				    
					return "delete";
					}
				}
			
		}
			// 즐겨찾기 리스트가 존재하지 않거나 tour_no가 즐겨찾기에 없다면
			map.put("tour_no", tour_no);
		    map.put("no", no);
			int res = mypageMapper.updateFavorite(map);
			return "add";
		
	}
	
	
	//즐겨찾기 여부 체크
	@RequestMapping("/mypage_favorite_check.do")
	@ResponseBody
	public String mypageFavoriteCheck(HttpServletRequest req,HttpSession session) {
		int tour_no = Integer.parseInt(req.getParameter("no"));
		int no = (int) session.getAttribute("nowUserNo");
		
		MyPageDTO pdto = mypageMapper.getMyPage(no);
		
		// 기존 즐겨찾기가 존재하면
		if(pdto.getMypage_favorite_tour() != null) {
			//즐겨찾기(tour)가져오기& ','별로 나눠서 배열에 담기
			String tour= pdto.getMypage_favorite_tour();
			String[] arr = tour.split(",");
			
			//현재 tour_no가 즐겨찾이 안에 있는지 검색
			for(String tno : arr) {
				int list_tno = Integer.parseInt(tno);
				if(list_tno == tour_no) { // 있으면
					return "existFavorite";
				}
			}
		}
		return null;
}

	
}
