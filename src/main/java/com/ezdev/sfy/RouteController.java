package com.ezdev.sfy;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezdev.sfy.dto.MyRouteDTO;
import com.ezdev.sfy.dto.TourDTO;
import com.ezdev.sfy.service.MyRouteMapper;
import com.ezdev.sfy.service.TourMapper;

@Controller
public class RouteController {
	@Autowired
	MyRouteMapper myrouteMapper;
	@Autowired
	TourMapper tourMapper;
	//여행루트
	@RequestMapping("/routeList.do")
	public String routeList(HttpServletRequest req
			, @RequestParam(required = false) String pageNum
			, @RequestParam(required=false) String routeType) {
		
		HttpSession session = req.getSession();
		
		//여행지 타입
		if (routeType == null) {
			routeType = "0";
		}
		req.setAttribute("routeType", routeType);
		
		//페이징
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8;
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int countRow = 0;
		// countRow 구하기
		if(!routeType.equals("0")) {
			countRow = myrouteMapper.getRouteCountByType(routeType); //타입별불러오기

			//그외
		}else {
			countRow = myrouteMapper.getRouteCount(); //전부불러오기
		}
		
		if (endRow > countRow) endRow = countRow;
		int pageCount = countRow / pageSize + (countRow%pageSize==0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;		
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		 //여행루트메뉴로 들어오면
		if(routeType.equals("0")){ 
			List<MyRouteDTO> list = myrouteMapper.listRoutePart(startRow, endRow);
			req.setAttribute("listRoute", list);
			//필터 선택시
	    }else {
			List<MyRouteDTO> list = myrouteMapper.listRouteByType(routeType, startRow, endRow);
			req.setAttribute("listRoute", list);
		}
		
	   //이미지 불러오기
		String upPath = session.getServletContext().getRealPath("/resources/myRouteImg");
	    session.setAttribute("upPath",upPath);
	   
		return "route/routeList";
	}
	
	//여행루트 - 내 위치에서 경로찾기
	@RequestMapping("/routeTraffic.do")
	public String routeTraffic() {
		return "route/routeTraffic";
	}
	
	@RequestMapping(value="/getTourImg.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String getTourImg(HttpServletRequest req) {
		int route_no=Integer.parseInt(req.getParameter("no"));
		
		MyRouteDTO dto=myrouteMapper.getRoute(route_no);
		String img =dto.getRoute_img();
		return img;
	}
	@RequestMapping(value="/getReadcount.do")
	@ResponseBody
		public String plusReadcount(HttpServletRequest req) {
			int no=Integer.parseInt(req.getParameter("no"));
			
			int res=myrouteMapper.plusReadcount(no);
			MyRouteDTO dto=myrouteMapper.getRoute(no);
			if(res>0) {
				int count=dto.getRoute_readcount();
				String readcount =Integer.toString(count);
				return readcount;
			}else {
				return "0";				
			}
		}
	@RequestMapping(value="/getRouteKakao.do")
	@ResponseBody
	public Map<String, Object> map(HttpServletRequest req, HttpSession session){
		int route_no = Integer.parseInt(req.getParameter("no"));
		MyRouteDTO dto = myrouteMapper.getRoute(route_no);
		String route = dto.getRoute_tour();
		String []array = route.split(",");
		int tour_no;
		List<TourDTO> routeView = (List)session.getAttribute("routeView");
		if(routeView==null) {
			routeView = new ArrayList<>();
		}
		//리스트에 담기
		for(int i=0; i<array.length; i++) {
			tour_no=(int) Integer.parseInt(array[i]);
			TourDTO rdto =tourMapper.getTour(tour_no);
			routeView.add(rdto);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("routeView", routeView);
	
		return map;
		
	}
}


