package com.ezdev.sfy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezdev.sfy.dto.TourDTO;
import com.ezdev.sfy.service.TourMapper;

@Controller
public class TourController {
	@Autowired
	private TourMapper tourMapper;
	
	//여행지
	@RequestMapping("/tourList.do")
	public String tourList(HttpServletRequest req) {
		List<TourDTO> list = tourMapper.listTour();
		
		req.setAttribute("listTour", list);
		
		return "tour/tourList";
	}

}
