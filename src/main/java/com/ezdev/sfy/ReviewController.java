package com.ezdev.sfy;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
   
   
   
   @RequestMapping(value="/review_insert.do")
   public String insertreview(HttpServletRequest req) {

	   return "route/routeList";
   }
 
}
