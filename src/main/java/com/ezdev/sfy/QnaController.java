package com.ezdev.sfy;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezdev.sfy.dto.QnaDTO;
import com.ezdev.sfy.service.MemberMapper;
import com.ezdev.sfy.service.QnaMapper;


@Controller
public class QnaController {
	
	@Autowired
	QnaMapper boardMapper;
	@Autowired
	MemberMapper memberMapper;
	
	@RequestMapping("/qnalist.do")
	
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
		int qna_no = countRow - (startRow - 1);
		req.setAttribute("listBoard", list);
		req.setAttribute("qna_no", qna_no);
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
	
	@RequestMapping(value="/myQna.do", method=RequestMethod.GET)
	public String read_MyQna(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("nowUserNo")==null) {
			req.setAttribute("msg", "로그인 후에  이용이 가능합니다.");
			req.setAttribute("url", "index.do");
			return "message";
		}
		return "mypage/mypage_qna";
	}
	
	@RequestMapping(value="/qnaWrite.do", method=RequestMethod.GET)
	public String writeForm_board(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("nowUserNo")==null) {
			req.setAttribute("msg", "로그인 후에  이용이 가능합니다.");
			req.setAttribute("url", "index.do");
			return "message";
		}
		return "pages/qnaWrite";
	}
	
	@RequestMapping(value="/qnaWrite.do", method=RequestMethod.POST)
	public String writePro_board(HttpServletRequest req, @ModelAttribute QnaDTO dto, BindingResult result) {
		HttpSession session = req.getSession();
		String member_id = (String)session.getAttribute("nowUserId");
		dto.setQna_writer(member_id);

		if (result.hasErrors()) {
			dto.setQna_no(0);
			dto.setQna_re_step(0);
			dto.setQna_re_level(0);
		}
		int res = boardMapper.insertBoard(dto);
		if (res>0) {
			req.setAttribute("msg", "게시글 등록 성공!! 게시글 목록 페이지로 이동합니다.");
			req.setAttribute("url", "qnalist.do");
		}else {
			req.setAttribute("msg", "게시글 등록 실패!! 게시글 등록 페이지로 이동합니다.");
			req.setAttribute("url", "qnaWrite.do");
		}


		return "message";
	}
	@RequestMapping(value="/qnaContent.do")
	public String content_board(HttpServletRequest req, @RequestParam int qna_no){
		QnaDTO dto = boardMapper.getBoard(qna_no, "qna_content");
		req.setAttribute("getBoard", dto);
		return "pages/qnaContent";
	}
	
	@RequestMapping(value="/update_qna.do", method=RequestMethod.GET)
	public String updateForm(HttpServletRequest req, @RequestParam int qna_no) {
		QnaDTO dto = boardMapper.getBoard(qna_no, "update");
		req.setAttribute("getBoard", dto);
		return "pages/qnaUpdate";
	}
	
	@RequestMapping(value="/update_qna.do", method=RequestMethod.POST)
	public String updatePro_board(HttpServletRequest req, 
							@ModelAttribute QnaDTO dto, BindingResult result) {
		int res = boardMapper.updateBoard(dto);
		if (res>0) {
			req.setAttribute("msg", "수정이 완료되었습니다.");
			req.setAttribute("url", "qnalist.do");
		}else if (res==0){
			req.setAttribute("msg", "수정을 실패하였습니다. 다시 작성해주세요.");
			req.setAttribute("url", "qnaContent.do?qna_no="+dto.getQna_no());
		}else{
			req.setAttribute("msg", "비밀번호가 틀렸습니다. 비밀번호를 다시 확인해 주세요.");
			req.setAttribute("url", "update_qna.do?qna_no="+dto.getQna_no());
		}
		return "message";
	}

	@RequestMapping(value="/qnaDelete.do")
	public String qna_delete(HttpServletRequest req, @ModelAttribute QnaDTO dto) {
		int res = boardMapper.deleteQna(dto);
		
		System.out.println(res);
		
		if (res>0) {
			req.setAttribute("msg", "글 삭제 성공!! 목록페이지로 이동합니다.");
		}else {
			req.setAttribute("msg", "글 삭제 실패!! 목록페이지로 이동합니다.");
		}
		req.setAttribute("url", "qnalist.do");
		return "message";
	}
}


















