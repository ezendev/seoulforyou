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
import com.ezdev.sfy.service.MemberMapper;
import com.ezdev.sfy.dto.MemberDTO;
import com.ezdev.sfy.dto.MyRouteDTO;
import com.ezdev.sfy.dto.TourDTO;

@Controller
public class MyRouteController {
	@Autowired
	TourMapper tourMapper;
	@Autowired
	MyRouteMapper myrouteMapper;
	@Autowired
	MemberMapper memberMapper;
	
	
	//나의여행 만들기페이지로 이동
	@RequestMapping("/myRoute.do")
	public String my_route_1(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("myRoute");
		session.removeAttribute("findList");
		session.removeAttribute("trip_thema");
		session.removeAttribute("region");
		session.removeAttribute("startDate");
		session.removeAttribute("endDate");
		session.removeAttribute("searchType");
		return "myroute/myRoute";
	}

	//검색으로 tour찾기
	@RequestMapping(value="/tourFind.do")
	public String tourFind(HttpServletRequest req, @RequestParam Map<String, String> map) {
		HttpSession session = req.getSession();
		String sql=null;
		int tour_type = Integer.parseInt(map.get("searchType"));
		String word= map.get("keyword");
		if(tour_type !=0) {
			if(map.get("keyword")==null) {
				sql = "select*from tour where tour_type='"+tour_type+"'";
			}else{
				sql ="select*from (select*from tour where tour_type='"+tour_type+"')A where lower(tour_name) like lower('%"+word+"%')";
			}
		}else {
			if(map.get("keyword")==null) {
				sql ="select*from tour";
			}else {
				sql = "select*from tour where lower(tour_name) like lower('%"+word+"%')";
				}
		}
		map.put("sql", sql);
		List<TourDTO> find = myrouteMapper.findTour(map);
		session.setAttribute("findList", find);
		session.setAttribute("searchType", map.get("searchType"));
		session.setAttribute("trip_thema", map.get("trip_thema"));
		session.setAttribute("region", map.get("region"));
		session.setAttribute("startDate", map.get("startDate"));
		session.setAttribute("endDate", map.get("endDate"));
			return "myroute/myRoute";
	}
	
	
	//일정 만들기
	//일정에 장소 추가
	@RequestMapping(value="/addList.do", method=RequestMethod.GET)
	public String addList(HttpServletRequest req, @RequestParam (required=false)int tour_no) {
		HttpSession session =req.getSession();
		TourDTO rdto =myrouteMapper.getTour(tour_no);
		List<TourDTO> routeList = (List)session.getAttribute("myRoute");
		if(routeList==null) {
			routeList = new ArrayList<>();
		}
		routeList.add(rdto);
		session.setAttribute("myRoute", routeList);
		return "redirect: myRouteList.do";
	}
	
	//페이지로 이동	
	@RequestMapping(value="/myRouteList.do", method=RequestMethod.GET)
	public String myRouteList() {
		return "myroute/myRoute";
	}
	
	//일정에서 장소 삭제	
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
	
	//게시글 등록
	//myroute페이지의 값을 myrouteAfter에 넘기기
	@RequestMapping(value="/myRouteAfter.do")
	public String my_route_2(HttpServletRequest req, @RequestParam Map<String, String> map) {
		HttpSession session = req.getSession();
		String itinerary = map.get("startDate")+'~'+map.get("endDate");
		session.setAttribute("route_itinerary", itinerary);
		return "myroute/myRouteAfter";
	}
	
		
	//게시글 작성, 이미지 업로드 하기
	@RequestMapping(value="/upload.do", method=RequestMethod.POST)
	public String routeUpload(HttpServletRequest req, @ModelAttribute MyRouteDTO dto, BindingResult result, @RequestParam Map<String, String> afterMap) throws Exception {
		if(result.hasErrors()) {
				dto.setRoute_img("");
				dto.setRoute_no(0);
		}
		//이미지 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		String file_name = file.getOriginalFilename();
	
		if(file_name==null || file_name.trim().equals("")) {
			req.setAttribute("msg", "이미지를 등록해주세요");
			req.setAttribute("url", "myRouteAfter.do");
			return "message";
		}

		//파일이름이 동일하면 덮어씌워지기 때문에 이를 보완하기 위해 UUID사용('랜덤이름_원래 이름'으로 저장)
		String uuid = UUID.randomUUID().toString();
		file_name = uuid +'_'+file_name;
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/myRouteImg");
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
		dto.setRoute_subject(afterMap.get("route_subject"));
		dto.setRoute_content(afterMap.get("route_content"));
		
		//앞 페이지의 hashtag, itinerary, region을 dto에 넣기		
		dto.setRoute_hashtag((String)session.getAttribute("trip_thema"));
		dto.setRoute_itinerary((String)session.getAttribute("route_itinerary"));
		dto.setRoute_region((String)session.getAttribute("region"));
			
		//myRoute는 세션에 담겨 있던 것이므로 session에서 꺼내기(','를 구분자 tour_no를 정렬)
		List<TourDTO> routeList = (List<TourDTO>)session.getAttribute("myRoute");
		if(routeList==null) {
			req.setAttribute("msg", "일정을 만들어주세요!");
			req.setAttribute("url", "myRoute.do");
			return "message";
		}
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
		
		int res = myrouteMapper.insertRoute(dto);
		if(res>0) {
			//여행루트 만든 후에 선택되었던 필터가 리셋되기 위해 세션 종료
			session.removeAttribute("myRoute");
			session.removeAttribute("findList");
			session.removeAttribute("trip_thema");
			session.removeAttribute("region");
			session.removeAttribute("startDate");
			session.removeAttribute("endDate");
			session.removeAttribute("searchType");
			req.setAttribute("msg", "나의 여행이 등록되었습니다. 마이페이지로 이동합니다.");//일단은 인덱스로 이동
			req.setAttribute("url", "mypage_route.do");
		}else {
			req.setAttribute("msg", "나의 여행 등록에 실패하였습니다. 메인 화면으로 이동합니다.");
			req.setAttribute("url", "index.do");
			}
		return "message";
		}
	
	//myroute삭제
	@RequestMapping(value="/myroute_delRoute.do")
	public String mypage_deleteRoute(HttpServletRequest req, @RequestParam Map<String, String>map) {
		HttpSession session = req.getSession();
		int route_no = Integer.parseInt(map.get("route_no"));
		int no =(int) session.getAttribute("nowUserNo");
		MemberDTO dto = memberMapper.getMemberNo(no);
		if(dto.getMember_passwd().trim().equals(map.get("passwd"))) {
			int res = myrouteMapper.delMyroute(route_no);
			if(res>0) {
				req.setAttribute("msg", "게시글 삭제 성공!! 마이루트 페이지로 이동합니다.");
			}else{
				req.setAttribute("msg", "게시글 삭제 실패!! 마이루트 페이지로 이동합니다.");
			}
		}else {
			req.setAttribute("msg", "비밀번호가 틀립니다. 다시 입력해주세요");
		}
		req.setAttribute("url", "mypage_route.do");
		return "message";
	}
	//-------------------------------------------------------------------------------------------------------------//
	//edit
	//MyRoute 수정 폼으로 이동
	@RequestMapping(value ="/myroute_editRoute.do", method=RequestMethod.GET)
	public String mypageRoute_edit(HttpServletRequest req, @RequestParam int route_no) {
		HttpSession session = req.getSession();
		session.removeAttribute("findList");
		session.removeAttribute("searchType");
		session.removeAttribute("trip_thema");
		session.removeAttribute("region");
		session.removeAttribute("startDate");
		session.removeAttribute("endDate");
		session.removeAttribute("editRoute");
		
		MyRouteDTO dto = myrouteMapper.getRoute(route_no);
		String route= dto.getRoute_tour();
		String[]array =route.split(",");
		int tour_no;
		List<TourDTO> editRoute = (List)session.getAttribute("editRoute");
		if(editRoute==null) {
			editRoute = new ArrayList<>();
		}
		for(int i=0; i<array.length; i++) {
			tour_no=(int) Integer.parseInt(array[i]);
			TourDTO rdto =myrouteMapper.getTour(tour_no);
			editRoute.add(rdto);
		}
		
		session.setAttribute("editRoute", editRoute);
		session.setAttribute("getRoute", dto);
			
		String str=dto.getRoute_itinerary();
		String endDate =str.substring(str.lastIndexOf("~")+1);
		String startDate = str.substring(0, str.indexOf("~"));
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		session.setAttribute("route_no", route_no);
		return "myroute/edit_myroute";
	}
	
	//검색으로 tour찾기(edit)
		@RequestMapping(value="/edit_tourFind.do")
		public String editpage_tourFind(HttpServletRequest req, @RequestParam Map<String, String> map) {
			HttpSession session = req.getSession();
			String sql=null;
			int tour_type = Integer.parseInt(map.get("searchType"));
			String word= map.get("keyword");
			if(tour_type !=0) {
				if(map.get("keyword")==null) {
					sql = "select*from tour where tour_type='"+tour_type+"'";
				}else{
					sql ="select*from (select*from tour where tour_type='"+tour_type+"')A where lower(tour_name) like lower('%"+word+"%')";
				}
			}else {
				if(map.get("keyword")==null) {
					sql ="select*from tour";
				}else {
					sql = "select*from tour where lower(tour_name) like lower('%"+word+"%')";
					}
			}
			Map<String, String> sqlMap = new Hashtable<>();
			sqlMap.put("sql", sql);
			List<TourDTO> find = myrouteMapper.findTour(sqlMap);
			session.setAttribute("findList", find);
			session.setAttribute("searchType", map.get("searchType"));
			session.setAttribute("trip_thema", map.get("trip_thema"));
			session.setAttribute("region", map.get("region"));
			session.setAttribute("startDate", map.get("startDate"));
			session.setAttribute("endDate", map.get("endDate"));
				return "myroute/edit_myroute";
		}
	//일정 만들기
	//일정에 장소 추가
	@RequestMapping(value="/edit_addList.do", method=RequestMethod.GET)
	public String edit_addList(HttpServletRequest req, @RequestParam (required=false)int tour_no) {
		HttpSession session =req.getSession();
		TourDTO rdto =myrouteMapper.getTour(tour_no);
		List<TourDTO> editRoute = (List)session.getAttribute("editRoute");
		editRoute.add(rdto);
		session.setAttribute("editRoute", editRoute);
		return "redirect: myroute_editList.do";
	}
		
	//페이지로 이동	
	@RequestMapping(value="/myroute_editList.do", method=RequestMethod.GET)
	public String myroute_eidtList() {
		return "myroute/edit_myroute";
	}
		
	//일정에서 장소 삭제	
	@RequestMapping(value="/edit_delList.do", method=RequestMethod.GET)
	public String myroute_delList(HttpServletRequest req, @RequestParam (required=false)int tour_no) {
		HttpSession session = req.getSession();
		List<TourDTO> editRoute = (List)session.getAttribute("editRoute");
		for(TourDTO dto : editRoute) {
			if(tour_no == dto.getTour_no()) {
				editRoute.remove(dto);
				break;
			}
		}
		return "redirect: myroute_editList.do";
	}
				
	//editAfter이전에 값 넘기기
	@RequestMapping(value="/myroute_editRoute_after.do")
	public String mypageRoute_edit1(HttpServletRequest req, @RequestParam Map<String, String> map) {
		HttpSession session = req.getSession();
		
		int route_no =(int)session.getAttribute("route_no");
		MyRouteDTO dto = myrouteMapper.getRoute(route_no);
		session.setAttribute("getRoute", dto);
		
		String upPath = session.getServletContext().getRealPath("/resources/myRouteImg");
		session.setAttribute("upPath", upPath);
		String route_hashtag=map.get("trip_thema");	
		String route_region=map.get("region");	
		String startDate=map.get("startDate");	
		String endDate=map.get("endDate");
		String itinerary= startDate+"~"+endDate;
		session.setAttribute("route_itinerary", itinerary);
		session.setAttribute("route_hashtag", route_hashtag);
		session.setAttribute("route_region", route_region);
		return "myroute/edit_myrouteAfter";
	}

		
	//MyRoute 수정하기
	@RequestMapping(value="/update_MyRoute.do", method=RequestMethod.POST)
	public String mypageRoute_edit_ok(HttpServletRequest req, @ModelAttribute MyRouteDTO mdto, @RequestParam Map<String, String> rmap) throws Exception {
		HttpSession session = req.getSession();
		int route_no = (int)session.getAttribute("route_no");
		MyRouteDTO dto = myrouteMapper.getRoute(route_no);
		
		//이미지 업로드
		MultipartHttpServletRequest editmr = (MultipartHttpServletRequest)req;
		MultipartFile editFile = editmr.getFile("editFile");
		String edit_name = editFile.getOriginalFilename();
	
		if(editFile == null || edit_name.trim().equals("")) {
			mdto.setRoute_img(dto.getRoute_img());
		}else {		
			//파일이름이 동일하면 덮어씌워지기 때문에 이를 보완하기 위해 UUID사용('랜덤이름_원래 이름'으로 저장)
			String uuid = UUID.randomUUID().toString();
			edit_name = uuid +'_'+edit_name;
			
			String upPath = session.getServletContext().getRealPath("/resources/myRouteImg");
			File target = new File(upPath, edit_name);
			try {
				editFile.transferTo(target);
			}catch(IOException e) {
				e.printStackTrace();
				req.setAttribute("msg", "이미지 업로드 중 오류 발생, 다시 등록해주세요");
				req.setAttribute("url", "myroute_editRoute_after.do");
				return "message";
			}
			mdto.setRoute_img(edit_name);
		}
		//after페이지의 content와 subject를 dto에 넣기
		mdto.setRoute_subject(rmap.get("route_subject"));
		mdto.setRoute_content(rmap.get("route_content"));
		//세션에 담은  hashtag,region을 dto에 넣기

		mdto.setRoute_itinerary((String)session.getAttribute("route_itinerary"));
		mdto.setRoute_hashtag((String)session.getAttribute("route_hashtag"));
	
		mdto.setRoute_region((String)session.getAttribute("route_region"));
		
		//myRoute는 세션에 담겨 있던 것이므로 session에서 꺼내기(','를 구분자 tour_no를 정렬)
		List<TourDTO> editRoute = (List<TourDTO>)session.getAttribute("editRoute");
		if(editRoute==null) {
			req.setAttribute("msg", "일정을 만들어주세요!");
			req.setAttribute("url", "myroute_editRoute.do");
			return "message";
		}
		String tour="";
		for(TourDTO tdto : editRoute) {
			String tour_no = String.valueOf(tdto.getTour_no());
				if(editRoute.size()==1) {
					tour+= tour_no;
				}else {
				tour += ','+ tour_no;
				}
		}
		//첫 번째 루트 번호에서도 ','가 찍혀서 인덱스 1번을 제거
		String route_tour=tour.substring(1);
		mdto.setRoute_tour(route_tour);
		mdto.setRoute_no(route_no);

		int res = myrouteMapper.updateRoute(mdto);
		if(res>0) {
			req.setAttribute("msg", "나의 여행이 수정되었습니다. 마이페이지로 이동합니다.");
			req.setAttribute("url", "mypage_route.do");
		}else {
			System.err.println();
			req.setAttribute("msg", "나의 여행 수정에 실패하였습니다. 마이페이지로 이동합니다.");
			req.setAttribute("url", "mypage_route.do");
		}
		return "message";
	}
	

}

