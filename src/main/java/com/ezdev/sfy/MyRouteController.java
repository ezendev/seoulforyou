package com.ezdev.sfy;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	@RequestMapping(value="/upload.do")
	public String fileUpload_ok(HttpServletRequest req) {
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
		System.out.println("upPath = " + upPath);
		File target = new File(upPath, file.getOriginalFilename());
		try {
			file.transferTo(target);
		}catch(IOException e) {
			e.printStackTrace();
		}
		req.setAttribute("msg", "파일업로드 끝!!");
		req.setAttribute("url", "myRoute.do");
		
		return "message";
	}
}

	
