package com.ezdev.sfy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezdev.sfy.service.TourMapper;

@Controller
public class TourController {
	//@Autowired
	//private TourMapper tourMapper;
	
	//여행지
	@RequestMapping("/tourList.do")
	public String tourList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		TourMapper tlist = (TourMapper)session.getAttribute("tourList");
		if(tlist == null) {
			tlist = new TourMapper();
		}
		
		tlist.selectAllTour("all");
		session.setAttribute("tourList", tlist);
		
		return "tour/tourList";
	}

}
