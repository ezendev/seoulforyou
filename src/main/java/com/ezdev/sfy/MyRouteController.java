package com.ezdev.sfy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyRouteController {
	
	//나의여행 만들기
	@RequestMapping("/myRoute.do")
	public String my_route_1() {
		return "myroute/myRoute";
	}
	
	@RequestMapping("/myRouteAfter.do")
	public String my_route_2() {
		return "myroute/myRouteAfter";
	}
}
