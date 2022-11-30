package com.ezdev.sfy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	//top.jsp 로고 -> 관리자페이지
	@RequestMapping("/admin.do")
	public String admin() {
		return "admin/index";
	}
	@RequestMapping("/Sample.do")
	public String sample() {
		return "admin/Sample";
	}
	@RequestMapping("/jusoPopup.do")
	public String joso() {
		return "admin/jusoPopup";
	}
	@RequestMapping("/layout-static.do")
	public String layoutStatic() {
		return "admin/layout-static";
	}
	@RequestMapping("/layout-sidenav-light.do")
	public String layoutSidenavLight() {
		return "admin/layout-sidenav-light";
	}
	@RequestMapping("/401.do")
	public String h401() {
		return "admin/401";
	}
	@RequestMapping("/404.do")
	public String h404() {
		return "admin/404";
	}
	@RequestMapping("/500.do")
	public String h500() {
		return "admin/500";
	}
	@RequestMapping("/charts.do")
	public String charts() {
		return "admin/charts";
	}
	@RequestMapping("/tables.do")
	public String tables() {
		return "admin/tables";
	}
	@RequestMapping("/login2.do")
	public String login() {
		return "admin/login2";
	}
	@RequestMapping("/register.do")
	public String register() {
		return "admin/register";
	}
	@RequestMapping("/password.do")
	public String password() {
		return "admin/password";
	}
	
	
}
