package com.ezdev.sfy;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezdev.sfy.service.MyRouteMapper;
import com.ezdev.sfy.service.TourMapper;
import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.MyRouteDTO;
import com.ezdev.sfy.dto.TourDTO;

@Controller
public class MyRouteController {
	@Autowired
	TourMapper tourMapper;
	@Autowired
	MyRouteMapper myRouteMapper;
	//나의여행 만들기
	@RequestMapping("/myRoute.do")
	public String my_route_1() {
		return "myroute/myRoute";
	}
	
	//after페이지로 이동 전, 값을 넘기기
		@RequestMapping(value="/myRouteAfter.do")
		public String my_route_2(HttpServletRequest req, @RequestParam Map<String, String> map) {
			HttpSession session = req.getSession();
			String itinerary = map.get("startDate")+'~'+map.get("endDate");
			
			
			Map<String, String> strMap = new Hashtable<>();
			strMap.put("hashtag", map.get("trip_thema"));
			strMap.put("region", map.get("region"));
			strMap.put("route_itinerary", itinerary);
			
			session.setAttribute("route1", strMap);
			return "myroute/myRouteAfter";
		}
	
		//insert
		@RequestMapping(value="/upload.do", method=RequestMethod.POST)
		public String routeUpload(HttpServletRequest req, @ModelAttribute MyRouteDTO dto, BindingResult result, @RequestParam Map<String, String> rmap) throws Exception {
			if(result.hasErrors()) {
				dto.setRoute_img("");
			}
			//이미지 업로드
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile file = mr.getFile("filename");
			String file_name = file.getOriginalFilename();
			
			//파일이름이 동일하면 덮어씌워지기 때문에 이를 보완하기 위해 UUID사용('랜덤이름_원래 이름'으로 저장)
			String uuid = UUID.randomUUID().toString();
			file_name = uuid +'_'+file_name;
			if(file_name==null || file_name.trim().equals("")) {
				req.setAttribute("msg", "이미지를 등록해주세요");
				req.setAttribute("url", "myRouteAfter.do");
				return "message";
			}
			HttpSession session = req.getSession();
			String upPath = session.getServletContext().getRealPath("/resources/myRouteImg");
			System.out.println("upPath = " + upPath);
			File target = new File(upPath, file_name);
			try {
				file.transferTo(target);
			}catch(IOException e) {
				e.printStackTrace();
				req.setAttribute("msg", "이미지 업로드 중 오류 발생, 다시 등록해주세요");
				req.setAttribute("url", "myRouteAfter.do");
				return "message";
			}
			session.setAttribute("upPath", upPath);
			dto.setRoute_img(file_name);
			
			//after페이지의 content와 subject를 dto에 넣기
			dto.setRoute_subject(rmap.get("route_subject"));
			dto.setRoute_content(rmap.get("route_content"));
			
			//앞 페이지의 hashtag, itinerary, region을 dto에 넣기
			Map<String, String> map=(Map<String, String>) session.getAttribute("route1");
			dto.setRoute_hashtag(map.get("hashtag"));
			dto.setRoute_itinerary(map.get("route_itinerary"));
			dto.setRoute_region(map.get("region"));
			
			//myRoute는 세션에 담겨 있던 것이므로 session에서 꺼내기(','를 구분자 tour_no를 정렬)
			List<TourDTO> routeList = (List<TourDTO>)session.getAttribute("myRoute");
			String tour="";
			for(TourDTO tdto : routeList) {
				String tour_no = String.valueOf(tdto.getTour_no());
					if(routeList.size()==1) {
						tour+= tour_no;
					}else {
					tour += ','+ tour_no;
					}
			}
			//첫 번째 루트 번호에서도 ','가 찍혀서 인덱스 1번을 제거
			String route_tour=tour.substring(1);
			dto.setRoute_tour(route_tour);
			
			
			MemberDTO mdto = (MemberDTO)session.getAttribute("mdto");
			int mem_no = mdto.getMember_no();
			dto.setMem_no(mem_no);
			
			int res = myRouteMapper.insertRoute(dto);
			if(res>0) {
				//여행루트 만든 후에 선택되었던 필터가 리셋되기 위해 세션 종료
				session.removeAttribute("myRoute");
				session.removeAttribute("findList");
				session.removeAttribute("searchType");
				session.removeAttribute("trip_thema");
				session.removeAttribute("region");
				session.removeAttribute("startDate");
				session.removeAttribute("endDate");
				req.setAttribute("msg", "나의 여행이 등록되었습니다. 마이페이지로 이동합니다.");//일단은 인덱스로 이동
				req.setAttribute("url", "index.do");
			}else {
				req.setAttribute("msg", "나의 여행 등록에 실패하였습니다. 메인 화면으로 이동합니다.");
				req.setAttribute("url", "index.do");
			}
			return "message";
		}
	
		@RequestMapping(value="/addList.do", method=RequestMethod.GET)
		public String addList(HttpServletRequest req, @RequestParam (required=false)int tour_no) {
			HttpSession session =req.getSession();
			TourDTO rdto =tourMapper.getTour(tour_no);
			List<TourDTO> routeList = (List)session.getAttribute("myRoute");
			if(routeList==null) {
				routeList = new ArrayList<>();
			}
			routeList.add(rdto);
			System.out.println(rdto.getTour_name());
			session.setAttribute("myRoute", routeList);
			 return "redirect: myRouteList.do";
		}
		
		@RequestMapping(value="/myRouteList.do", method=RequestMethod.GET)
		public String myRouteList() {
			return "myroute/myRoute";
		}
		
		@RequestMapping(value="/delList.do", method=RequestMethod.GET)
		public String delList(HttpServletRequest req, @RequestParam (required=false)int tour_no) {
			HttpSession session = req.getSession();
			List<TourDTO> routeList = (List)session.getAttribute("myRoute");
			for(TourDTO dto : routeList) {
				if(tour_no == dto.getTour_no()) {
					routeList.remove(dto);
					break;
				}
			}
			return "redirect: myRouteList.do";
		}

	}

		