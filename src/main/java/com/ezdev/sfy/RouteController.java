package com.ezdev.sfy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RouteController {
	
	//여행루트
	@RequestMapping("/routeList.do")
	public String routeList() {
		return "route/routeList";
	}
		
	//여행루트 - 내 위치에서 경로찾기
	@RequestMapping("/routeTraffic.do")
	public String routeTraffic() {
		return "route/routeTraffic";
	}

}
