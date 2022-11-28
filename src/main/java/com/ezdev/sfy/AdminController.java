package com.ezdev.sfy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	//top.jsp 로고 -> 관리자페이지
	@RequestMapping("/admin.do")
	public String admin() {
		return "admin/admin";
	}
}
