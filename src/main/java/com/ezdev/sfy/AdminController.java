package com.ezdev.sfy;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jdk.nashorn.internal.runtime.logging.Logger;
// @Controller -> Url, @Service ->처리, @Repository -> dao, @Component -> 구성, @RestController -> url과 ajax
//12.05재수정입니다..
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
	@RequestMapping("/table_member.do")
	public String tableMember() {
		return "admin/table_member";
	}
	@RequestMapping("/table_qna.do")
	public String tableQna() {
		return "admin/table_qna";
	}
	@RequestMapping("/fileUpload_ok.do")
		public void fileUpload(HttpServletRequest req) {
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("filename");
		String filename = mf.getOriginalFilename();
		
		if(filename==null||filename.trim().equals("")) {
			System.out.println("파일전송이 안되었습니다");
			return;
		}
		
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/monkey");
		System.out.println("upPath =" + upPath);
		System.out.println("filename =" + filename);
		
		File file = new File(upPath, filename);
		try {
			mf.transferTo(file);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
}
