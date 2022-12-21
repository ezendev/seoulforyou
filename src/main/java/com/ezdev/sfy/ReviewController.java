package com.ezdev.sfy;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezdev.sfy.dto.ReviewDTO;
import com.ezdev.sfy.service.MemberMapper;
import com.ezdev.sfy.service.MypageMapper;
import com.ezdev.sfy.service.ReviewMapper;

@Controller
public class ReviewController {
   @Autowired
   ReviewMapper reviewMapper;
   @Autowired
   MemberMapper memberMapper;
   @Autowired
   MypageMapper mypageMapper;
   
   // 리뷰 등록
   @RequestMapping(value="/insert_review.do")
   public String insertreview(HttpServletRequest req, HttpSession session ,@ModelAttribute ReviewDTO redto) {
	   int no =(int) session.getAttribute("nowUserNo");
	   int route_no = redto.getReview_route_no();
	   
	   //기존에 이 루트에 대해 작성한 리뷰dto가 존재한다면
	   if(reviewMapper.getReviewByRoute(no, route_no) != null) {
		   req.setAttribute("msg", "이미 등록된 리뷰가 있습니다.");
		   req.setAttribute("url", "routeList.do");
		   return "message";
	   }
	   
	   redto.setMem_no(no);
	   
	   int res = reviewMapper.insertReview(redto);
       if(res>0) {
    	   req.setAttribute("msg", "리뷰를 등록했습니다");
    	   req.setAttribute("url", "mypage_review.do");
       }else {
    	   req.setAttribute("msg", "리뷰 등록 실패");
    	   req.setAttribute("url", "routeList.do");
       }
	   return "message";
   }
   
   	// 리뷰 삭제
	@RequestMapping(value="/delete_review.do")
	public String deletereview(HttpServletRequest req, @RequestParam (required = false)int review_no) {
		int res = reviewMapper.deleteReview(review_no);
		if(res>0) {
	    	   req.setAttribute("msg", "리뷰를 삭제했습니다");
	    	   req.setAttribute("url", "mypage_review.do");
	       }else {
	    	   req.setAttribute("msg", "리뷰 삭제 실패");
	    	   req.setAttribute("url", "mypage_review.do");
	       }
		   return "message";
	}
	
	// 리뷰 수정 클릭 시 dto 내용 불러오기
	@RequestMapping(value="/update_review.do", method=RequestMethod.GET)
	public String updatereview(HttpServletRequest req, @RequestParam (required = false)int review_no) {
		ReviewDTO redto = reviewMapper.getReview(review_no);
		req.setAttribute("getReview", redto);
		return "mypage/mypage_review";
	}
	
	// 리뷰 수정
	@RequestMapping(value="/update_review.do", method=RequestMethod.POST)
	 public String updatereview(HttpServletRequest req, @ModelAttribute ReviewDTO redto) {
		int res = reviewMapper.updateReview(redto);
			if(res>0) {
		    	   req.setAttribute("msg", "리뷰를 수정했습니다");
		    	   req.setAttribute("url", "mypage_review.do");
		       }else {
		    	   req.setAttribute("msg", "리뷰 수정 실패");
		    	   req.setAttribute("url", "mypage_review.do");
		       }   
			return "message";
	 }
	
	// 모든 사람의 리뷰 리스트업
	@RequestMapping(value="/listReview.do")
	   public String listReview(HttpServletRequest req) {
		int route_no = Integer.parseInt(req.getParameter("route_no"));
		
		List<ReviewDTO> rlist = reviewMapper.listRouteReview(route_no);
		req.setAttribute("listReview", rlist);
		
		return "route/review_ajax_list";
	}
	
	// 나의 리뷰 리스트업
	@RequestMapping(value="/getMyReview.do", produces="application/text;charset=utf8")
	@ResponseBody
	   public String getMyReview(HttpServletRequest req, HttpSession session) {
		int no = 0;
		if(session.getAttribute("nowUserNo") != null) {
			no = (int)session.getAttribute("nowUserNo");
		}else {
			return null;
		}
		
		int route_no = Integer.parseInt(req.getParameter("route_no"));
		
		ReviewDTO rdto = reviewMapper.getReviewByRoute(no, route_no);
		String myRouteReview = "아직 작성한 리뷰가 없습니다.";
		if(rdto != null) {
			myRouteReview = rdto.getReview_content();
			}
		
		return myRouteReview;
	}
		  
	
	
}
