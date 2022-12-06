package com.ezdev.sfy;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezdev.sfy.dto.AdminDTO;
import com.ezdev.sfy.service.AdminMapper;

import jdk.nashorn.internal.runtime.logging.Logger;
// @Controller -> Url, @Service ->처리, @Repository -> dao, @Component -> 구성, @RestController -> url과 ajax
//12.05재수정입니다..
@Controller
public class AdminController {
	
	@Autowired
	AdminMapper adminMapper;
	
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
		public String fileUpload(HttpServletRequest req) {
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("filename");
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/adminImg");
		System.out.println("upPath =" + upPath);
		
		File target = new File(upPath, mf.getOriginalFilename());
		try {
			mf.transferTo(target);
		}catch(IOException e) {
			e.printStackTrace();
		}
		req.setAttribute("msg","파일업로드 성공");
		req.setAttribute("url", "admin.do");
		
		return "message";
		
		}
	@RequestMapping("/admin_input_ok.do")
	public String adminInputOk(HttpServletRequest req,
			@ModelAttribute AdminDTO dto, BindingResult result){
		if(result.hasErrors()) {
			dto.setAdmin_id("");
			dto.setAdmin_name("");
			dto.setAdmin_email("");
			dto.setAdmin_passwd("");
			dto.setAdmin_passwd_confirm("");
			dto.setAdmin_profileImg("");
		}
		int res = adminMapper.insertAdmin(dto);
		if(res>0) {
			req.setAttribute("msg", "저장성공");
			req.setAttribute("url","admin.do");
		}else {
			req.setAttribute("msg","저장실패");
			req.setAttribute("url","admin.do");
		}
		return "message";
	}
		
		
		
	}
	

