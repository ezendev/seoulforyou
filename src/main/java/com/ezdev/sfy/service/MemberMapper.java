package com.ezdev.sfy.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.MemberDTO;


@Service
public class MemberMapper {
	
	@Autowired 
	private SqlSession sqlSession;
		
	public int insertMember(MemberDTO dto) {
		return  sqlSession.insert("insertMember", dto);
	}
	
	public int insertMypage(MemberDTO dto) {
		return sqlSession.insert("insertMypage", dto);
	}

	public List<MemberDTO> listMember(){
		return sqlSession.selectList("listMember");
	}
	public List<MemberDTO> listOfMember(){
		return sqlSession.selectList("listOfMember");
	}
	public int updateListMember(MemberDTO dto) {
		return sqlSession.update("updateListMember", dto);
		
	}
//마이페이지에서 회원탈퇴 할때
	public int deleteMember(int member_no) {
		return sqlSession.delete("deleteMember", member_no);
	}
//관리자페이지에서 회원탈퇴
	public int deleteListMember(MemberDTO dto) {
		return sqlSession.delete("deleteListMember", dto);
	}
	
	public MemberDTO getMemberNo(int member_no){
	return  sqlSession.selectOne("getMemberNo", member_no);
	}

	
	public int updateMember(MemberDTO dto) {
	return sqlSession.update("updateMember", dto);
	}

	public MemberDTO getMemberId(String member_id){
		return sqlSession.selectOne("getMemberId", member_id);
	}
	public MemberDTO getMemberEmail(String member_email) {
		return sqlSession.selectOne("getMemberEmail", member_email);
	}
	
	public int insertMemKakao(Map<String, String> userInfo) {
		return sqlSession.insert("insertMemKakao", userInfo);
	}
	
}

