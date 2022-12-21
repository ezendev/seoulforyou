package com.ezdev.sfy;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezdev.sfy.dto.AdminDTO;
import com.ezdev.sfy.dto.AdminTempDTO;
import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.QnaDTO;
import com.ezdev.sfy.service.AdminMapper;
import com.ezdev.sfy.service.AdminTempMapper;
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
	AdminTempMapper adminTempMapper;
	
	//top.jsp 로고 -> 관리자페이지
	@RequestMapping("/admin.do")

	public String admin(HttpSession session, HttpServletRequest req) {
		
		AdminDTO dto = (AdminDTO)session.getAttribute("adto");
		String profile_img = dto.getAdmin_profileImg();
		int admin_no = dto.getAdmin_no();
		String admin_name = dto.getAdmin_name();
		String admin_id = dto.getAdmin_id(); //프로필 수정 페이지에 admin_id를 통하여 리스트 얻기 위해
		String admin_passwd = dto.getAdmin_passwd();
		String admin_email = dto.getAdmin_email();
		
		session.setAttribute("admin_no", admin_no);
		session.setAttribute("profile_img", profile_img); 
		session.setAttribute("admin_id", admin_id);
		session.setAttribute("admin_name", admin_name);
		session.setAttribute("admin_passwd", admin_passwd);
		session.setAttribute("admin_email", admin_email);
		//참고로 이때 profile_img는 업로드 된 이미지의 이름일뿐이다
		
		
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
	public String updateMember(HttpServletRequest req, @ModelAttribute MemberDTO dto) {
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
		
		return "admin/table_qna";
	}
	
	@RequestMapping("/fileUpload_ok.do")
	public String fileUploadOk() {
		return "admin/index";
	}
	
	//파일 업로드에 대해 폴더에 저장   
	@RequestMapping("/admin_input_ok.do")
	public String fileUpload(HttpServletRequest req, @ModelAttribute AdminDTO dto, BindingResult result) throws Exception{

		if(result.hasErrors()) {
			dto.setAdmin_profileImg("");
		}
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile files = mr.getFile("admin_profileImg");
		String filename = files.getOriginalFilename();
		System.out.println(filename); 
		
		if(filename == null || filename.trim().equals("")) {
			req.setAttribute("msg", "이미지를 첨부해주세요");
			req.setAttribute("url", "fileUpload_ok.do");
		}
		HttpSession session = req.getSession();
		String upPath = "C:\\admin";
		File target = new File(upPath, filename);
		try {
			files.transferTo(target);
		}catch(IOException e) {
			req.setAttribute("msg", "이미지 업로드 실패");
			req.setAttribute("url", "fileUpload_ok.do");
		}
		session.setAttribute("upPath", upPath);
		
		dto.setAdmin_profileImg(filename); 
		dto.setAdmin_name(req.getParameter("admin_name"));
		dto.setAdmin_id(req.getParameter("admin_id"));
		dto.setAdmin_passwd(req.getParameter("admin_passwd"));
		dto.setAdmin_email(req.getParameter("admin_email"));
		
		//열린 세션에 adto라는 이름에 위의 관리자계정 등록 값dto를 저장
		session.setAttribute("adto", dto);
		
		int res = adminMapper.insertAdmin(dto); 
		if(res>0) {
		req.setAttribute("msg","관리자계정 등록성공, 사진 변경완료");
		req.setAttribute("url", "fileUpload_ok.do");
		
		}else {
		req.setAttribute("msg","관리자계정 등록실패");
		req.setAttribute("url", "fileUpload_ok.do");
		 }
		return "message";
		}
	
	@RequestMapping("/admin_temp.do")
	public String adminTemp(HttpServletRequest req, @ModelAttribute AdminTempDTO dto)  {
		
		int res = adminTempMapper.upsertAdminTemp(dto);
		
		if(res>0) {
			req.setAttribute("msg","임시저장 완료");
			req.setAttribute("url", "table_qna.do");
			return "message";
			
			}else {
			req.setAttribute("msg","임시저장 실패");
			req.setAttribute("url", "table_qna.do");
			return "message";
			 }
		
	}
	@ResponseBody
	@RequestMapping(value="/tempList.do",produces = "application/text; charset=utf8")
	public String tempList(HttpServletRequest req) {

	int qno = Integer.parseInt(req.getParameter("temp_qno"));
	
	AdminTempDTO dto = adminTempMapper.getContent(qno);
	
	String qna_reply_content = dto.getQna_reply_content();
	
	
	return qna_reply_content;
	}
	
	@RequestMapping("/admin_temp_ok.do")
	public String tempOk(HttpServletRequest req, @ModelAttribute QnaDTO dto) {
		int res = adminTempMapper.tempOk(dto);
		
		if(res>0) {
			req.setAttribute("msg", "회원문의함 전송 완료");
			req.setAttribute("url", "table_qna.do");
			return "message";
		}else {
			req.setAttribute("msg", "회원문의함 전송 실패");
			req.setAttribute("url", "table_qna.do");
			return "message";
		}
	}
	
	@RequestMapping("/admin_temp_delete.do")
	public String tempDelete(HttpServletRequest req, @ModelAttribute QnaDTO dto) {
		int res = adminTempMapper.tempDelete(dto);
		
		if(res>0) {
			req.setAttribute("msg", "답변완료 성공");
			req.setAttribute("url", "table_qna.do");
			return "message";
		}else {
			req.setAttribute("msg", "답변완료 실패");
			req.setAttribute("url", "table_qna.do");
			return "message";
		}
		
	}
	
	
	@RequestMapping(value="/admin_login_ok.do", method= RequestMethod.POST)
	public String adminLoginOk(HttpServletRequest req, HttpServletResponse resp, 
	@RequestParam Map<String,String> map) {
		
	AdminDTO dto = adminMapper.getAdminId(map.get("admin_id"));
	
	if(dto == null) {
		req.setAttribute("msg", "해당하는 관리자 계정이 없습니다");
		req.setAttribute("url", "index.do");
	}else { 
		if(dto.getAdmin_passwd().equals(map.get("admin_passwd"))) {
			req.setAttribute("msg", dto.getAdmin_id() + "님 환영합니다");
			req.setAttribute("url", "index.do");

			//세션에 저장(해당 로그인 정보dto를 세션에 저장하여 로그인상태가 유지되도록 함)
			HttpSession session = req.getSession();
			session.setAttribute("adto", dto);
			
			//쿠키전송, 아이디를 기억하기 위해 
			Cookie cookie = new Cookie("saveAid", map.get("admin_id"));
			if(map.containsKey("saveAid")) cookie.setMaxAge(24*60*60);
			else cookie.setMaxAge(0);
			resp.addCookie(cookie);
		}else {
			req.setAttribute("msg", "비밀번호를 잘못눌렀습니다");
			req.setAttribute("url", "index.do");
		}
	}
	return "message";
	}

	@RequestMapping("/adminLogout.do")
	public String adminLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		req.setAttribute("msg", "관리자 로그아웃 되었습니다");
		req.setAttribute("url", "index.do");
		return "message";
	}
	
	@RequestMapping("/profile.do")
	public String profile() {
	
	return "admin/profile";
	}
	@RequestMapping("/admin_update.do")
	public String adminUpdate(HttpServletRequest req, @ModelAttribute AdminDTO dto) {
		int res = adminMapper.adminUpdate(dto);
		
		if(res>0) {
			req.setAttribute("msg", "관리자 정보 수정 완료");
			req.setAttribute("url", "index.do");
		}else {
			req.setAttribute("msg", "관리자 정보 수정 실패");
			req.setAttribute("url", "index.do");
		}
		return "message";
	}
	@RequestMapping("/admin_delete.do")
	public String adminDelete(HttpServletRequest req, @ModelAttribute AdminDTO dto) {
		int res = adminMapper.adminDelete(dto);
		
		if(res>0) {
			req.setAttribute("msg", "관리자 정보 삭제 완료");
			req.setAttribute("url", "adminLogout.do");
		}else {
			req.setAttribute("msg", "관리자 정보 삭제 실패");
			req.setAttribute("url", "index.do");
		}
		return "message";
		
	}
}

	

