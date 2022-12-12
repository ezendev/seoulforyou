package com.ezdev.sfy;

import java.security.Principal;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.ReviewDTO;
import com.ezdev.sfy.service.MemberMapper;
import com.ezdev.sfy.service.ReviewMapper;

@Controller
public class ReviewController {
   @Autowired
   ReviewMapper reviewMapper;
   @Autowired
   MemberMapper memberMapper;
   
   
   
   @RequestMapping(value="/insert_review.do")
   public String insertreview(HttpServletRequest req, @ModelAttribute ReviewDTO redto) {
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
	
	 
}
