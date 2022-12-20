package com.ezdev.sfy;

import java.security.Principal;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezdev.sfy.dto.MemberDTO;
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
   
   
   
   @RequestMapping(value="/insert_review.do")
   public String insertreview(HttpServletRequest req, HttpSession session ,@ModelAttribute ReviewDTO redto) {
	   int no =(int) session.getAttribute("nowUserNo");
	   redto.setMem_no(no);
	   
	   if(redto.getReview_content() != null) {
		   req.setAttribute("msg", "이미 등록된 리뷰가 있습니다.");
		   req.setAttribute("url", "routeList.do");
		   return "message";
	   }
	   
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
	@RequestMapping(value="/update_review.do", method=RequestMethod.GET)
	public String updatereview(HttpServletRequest req, @RequestParam (required = false)int review_no) {
		ReviewDTO redto = reviewMapper.getReview(review_no);
		req.setAttribute("getReview", redto);
		return "mypage/mypage_review";
	}
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
	
	@RequestMapping(value="/listReview.do")
	   public String listReview(HttpServletRequest req) {
		int route_no = Integer.parseInt(req.getParameter("route_no"));
		
		List<ReviewDTO> rlist = reviewMapper.listRouteReview(route_no);
		req.setAttribute("listReview", rlist);
		
		return "route/review_ajax_list";
	}
	
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
