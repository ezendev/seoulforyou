package com.ezdev.sfy;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.QnaDTO;
import com.ezdev.sfy.service.AdminMapper;
import com.ezdev.sfy.service.MemberMapper;
import com.ezdev.sfy.service.MyRouteMapper;
import com.ezdev.sfy.service.QnaMapper;

// @Controller -> Url, @Service ->처리, @Repository -> dao, @Component -> 구성, @RestController -> url과 ajax
//12.05재수정입니다..
@Controller
public class AdminController {
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	MemberMapper memberMapper;

	@Autowired	
	QnaMapper qnaMapper;
	
	@Autowired
	MyRouteMapper myrouteMapper;
	
	//top.jsp 로고 -> 관리자페이지
	@RequestMapping("/admin.do")

	public String admin(HttpSession session) {
		
		// 1. 2주간 회원가입자 수 집계
		int[] memberChartArr = adminMapper.countMemberByWeek();
		session.setAttribute("memberChartValue", memberChartArr);


		/*
		// 2. 요일별 리뷰갯수가 들어갈 배열
		int[] reviewChartArr = adminMapper.countReviewByWeek();
		session.setAttribute("reviewChartValue", routeChartArr);
		*/


		// 3. 루트테마별 갯수가 들어갈 배열
		int[] routeChartArr = new int[5];
		// 루트테마 이름이 들어간 배열
		String[] routeHashArr = new String[] {"힐링", "미식", "한류", "명소", "쇼핑"};
		
		// 루트테마 이름으로 갯수를 세서 배열에 넣기
		for(int i=0; i<routeChartArr.length; i++) {
			// 최종 넘겨줄 map
			Map<String, String> map = new HashMap<>();
			map.put("hashtag", routeHashArr[i]);
			int num = adminMapper.countRouteByHash(map);
			routeChartArr[i] = num;
		}
		session.setAttribute("routeChartValue", routeChartArr);
		
		
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
	
	@RequestMapping("/table_member.do")
	public String tableMember(HttpServletRequest req) {
		List<MemberDTO> list = memberMapper.listMember2();
		req.setAttribute("listMember2", list);

		return "admin/table_member";
	}
	@RequestMapping("/member_update.do")
	public String updateMember(HttpServletRequest req, @ModelAttribute MemberDTO dto,
	BindingResult result) {
		int res = memberMapper.updateMember2(dto);
		
		if(res>0) {
			req.setAttribute("msg", "회원 정보 수정완료");
			req.setAttribute("url", "table_member.do");
			
		}else{
			req.setAttribute("msg", "회원 정보 수정실패");
			req.setAttribute("url", "table_member.do");
		}
		return "message";
	}
	@RequestMapping("/member_delete.do")
	public String deleteMember(HttpServletRequest req, @ModelAttribute MemberDTO dto, BindingResult result) {
		int res = memberMapper.deleteMember2(dto);
		
		System.out.println(res);
		
		if(res>0) {
			req.setAttribute("msg", "회원 정보 삭제완료");
			req.setAttribute("url", "table_member.do");
			
		}else{
			req.setAttribute("msg", "회원 정보 삭제실패");
			req.setAttribute("url", "table_member.do");
		}
		return "message";
		
	}
	
	@RequestMapping("/table_qna.do")
	public String qnaList(HttpServletRequest req) {
		List<QnaDTO> qlist = qnaMapper.listQna2();
		req.setAttribute("listQna2", qlist);
		
		System.out.println(qlist);
		
		return "admin/table_qna";
	}
	
	//파일 업로드에 대해 폴더에 저장   
	@RequestMapping("/admin_input_ok.do")
		public String fileUpload(HttpServletRequest req, @ModelAttribute AdminDTO dto, 
				BindingResult result) throws Exception{
		if (result.hasErrors()) {
			dto.setAdmin_profileImg("");
		}
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile files = mr.getFile("admin_profileImg");
		String filename = files.getOriginalFilename();
		if(filename == null || filename.trim().equals("")) {
			req.setAttribute("msg", "이미지를 첨부해주세요");
			req.setAttribute("url", "fileUpload_ok.do");
			return "message";
		}
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/temp_admin");
		File target = new File(upPath, filename);
		try {
			files.transferTo(target);
		}catch(IOException e) {
			req.setAttribute("msg", "이미지 업로드 실패");
			req.setAttribute("url", "fileUpload_ok.do");
			return "message";
		}
		session.setAttribute("upPath", upPath);
		
		dto.setAdmin_profileImg(filename); 
		
		dto.setAdmin_name(req.getParameter("admin_name"));
		dto.setAdmin_id(req.getParameter("admin_id"));
		dto.setAdmin_passwd(req.getParameter("admin_passwd"));
		dto.setAdmin_email(req.getParameter("admin_email"));
		
		int res = adminMapper.insertAdmin(dto); 
		if(res>0) {
		req.setAttribute("msg","관리자계정 등록성공");
		req.setAttribute("url", "fileUpload_ok.do");
		return "message";
		
		}else {
		req.setAttribute("msg","관리자계정 등록실패");
		req.setAttribute("url", "fileUpload_ok.do");
		return "message";
		 }
		}
	
	@RequestMapping("/fileUpload_ok.do")
	public String fileUploadOk() {
		return "admin/index";
	}
	}
	

