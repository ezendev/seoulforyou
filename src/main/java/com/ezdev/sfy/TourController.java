package com.ezdev.sfy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourController {
	
	//여행지
	@RequestMapping("/tourList.do")
	public String tour() {
		return "tour/tourList";
	}

	/*
	//여행지 - 상세보기
	@RequestMapping("/tourView.do")
	public String selected_travel() {
		return "tour/tourView";
	}
	*/
}
