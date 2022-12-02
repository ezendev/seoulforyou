package com.ezdev.sfy;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezdev.sfy.dto.TourDTO;
import com.ezdev.sfy.service.TourMapper;

@Controller
public class TourController {
	@Autowired
	private TourMapper tourMapper;
	//여행지
	@RequestMapping("/tourList.do")
	public String tourList(HttpServletRequest req,@RequestParam(required=false) String region) {
		HttpSession session = req.getSession();
		session.removeAttribute("tourList");
		
		//세션에 "tourList" 키의 여행지 목록이 없다면 새로 만들어 저장한다
		if(session.getAttribute("tourList") == null) {
			List<TourDTO> list = tourMapper.listTour();
			session.setAttribute("tourList", list);			
		}
		   if(region != null) {
		         List<TourDTO> list = tourMapper.listTourByRegion(region);
		         session.setAttribute("tourList", list);
		      }
		return "tour/tourList";
	}
	   
	@RequestMapping(value="/tourFind.do")
	public String tourFind(HttpServletRequest req, @RequestParam Map<String, String> map) {
		HttpSession session = req.getSession();
		if(session.getAttribute("tourList") == null) {
			List<TourDTO> list = tourMapper.listTour();
			session.setAttribute("tourList", list);			
		}
		String sql=null;
		int tour_type = Integer.parseInt(map.get("searchType"));
		String word= map.get("keyword");
		if(tour_type !=0) {
			if(map.get("keyword").trim().equals("")) {
				sql = "select*from tour where tour_type='"+tour_type+"'";
			}else{
				sql ="select*from (select*from tour where tour_type='"+tour_type+"')A where lower(tour_name) like lower('%"+word+"%')";
			}
		}else {
			sql = "select*from tour where lower(tour_name) like lower('%"+word+"%')";
		}
		map.put("sql", sql);
		List<TourDTO> find = tourMapper.findTour(map);
			req.setAttribute("findList", find);
		
		return "myroute/myRoute";
	}

}