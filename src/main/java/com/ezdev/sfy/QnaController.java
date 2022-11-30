package com.ezdev.sfy;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezdev.sfy.dto.QnaDTO;
import com.ezdev.sfy.service.QnaMapper;

@Controller
public class QnaController {
	
	@Autowired
	QnaMapper boardMapper;
	
	@RequestMapping("/qnalist.do")
	public String index() {
		return "pages/qnalist";
	}
	@RequestMapping(value = {"/qnaWrite.do"})
	public String qnaWrite() {
		return "pages/qnaWrite";
	}
	@RequestMapping("/list_board.do")
	public String listBoard(HttpServletRequest req, @RequestParam(required = false) String pageNum) {
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 5;
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int countRow = boardMapper.getCount();
		if (endRow > countRow) endRow = countRow;
		
		//List<BoardDTO> list = boardDAO.listBoard(startRow, endRow);
		List<QnaDTO> list = boardMapper.listBoard(startRow, endRow);
		int num = countRow - (startRow - 1);
		req.setAttribute("listBoard", list);
		req.setAttribute("num", num);
		int pageCount = countRow / pageSize + (countRow%pageSize==0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;		
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		return "pages/qnalist";
	}
	
	@RequestMapping(value="/write_board.do", method=RequestMethod.GET)
	public String writeForm_board() {
		return "pages/qnaWrite";
	}
	
	@RequestMapping(value="/write_board.do", method=RequestMethod.POST)
	public String writePro_board(HttpServletRequest req, 
			@ModelAttribute QnaDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setNum(0);
			dto.setRe_step(0);
			dto.setRe_level(0);
		}
		dto.setIp(req.getRemoteAddr());;
		int res = boardMapper.insertBoard(dto);
		if (res>0) {
			req.setAttribute("msg", "게시글 등록 성공!! 게시글 목록 페이지로 이동합니다.");
			req.setAttribute("url", "qnalist.do");
		}else {
			req.setAttribute("msg", "게시글 등록 실패!! 게시글 등록 페이지로 이동합니다.");
			req.setAttribute("url", "qnaWrite.do");
		}
		return "../message";
	}
	@RequestMapping(value="/content_board.do")
	public String content_board(HttpServletRequest req, @RequestParam int num){
		QnaDTO dto = boardMapper.getBoard(num, "content");
		req.setAttribute("getBoard", dto);
		return "pages/content";
	}
}
