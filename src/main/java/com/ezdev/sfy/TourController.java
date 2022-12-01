package com.ezdev.sfy;

import java.util.List;

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
	public String tourList(HttpServletRequest req
			, @RequestParam(required = false) String pageNum
			, @RequestParam(required=false) String region
			, @RequestParam(required=false) String tourType) {
		
		HttpSession session = req.getSession();
		
		// 페이징
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8;
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int countRow = tourMapper.getTourCount();
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
		
		if(tourType != null) { //필터선택시 -> 리로드 후 여행지 메뉴로 들어온 것으로 인식하는 문제
			List<TourDTO> list = tourMapper.listTourByType(tourType, startRow, endRow);
			session.setAttribute("tourList", list);
	        return "tour/tourList";
	        
		}else if(region != null) { //지도 눌러서 들어오면
	         List<TourDTO> list = tourMapper.listTourByRegion(region);
	         session.setAttribute("tourList", list);
	         return "tour/tourList";
	         
	    }else { //여행지 메뉴로 들어오면
	    	List<TourDTO> list = tourMapper.listTour(startRow, endRow);
	  		session.setAttribute("tourList", list);
	  		return "tour/tourList";
	    }
	}
	   
	@RequestMapping(value="/tourFind.do")
	public String tourFind(HttpServletRequest req, @RequestParam(required=false)String keyword) {
		HttpSession session = req.getSession();
		if(session.getAttribute("tourList") == null) {
			List<TourDTO> list = tourMapper.listTour();
			session.setAttribute("tourList", list);			
		}
			List<TourDTO> find = tourMapper.findTour(keyword);
			req.setAttribute("findList", find);
		
		return "myroute/myRoute";
	}

}