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
	/*
	public List<MemberDTO> listMember(){
		return sqlSession.selectList("listMember");
	}
	
	public  List<MemberDTO> findMember(Map<String, String> map){
		return  sqlSession.selectList("findMember", map);
	}
	
	public int deleteMember(int no) {
		return sqlSession.delete("deleteMember", no);
	}
	*/
	public MemberDTO getMemberNo(int member_no){
	return  sqlSession.selectOne("getMemberNo", member_no);
	}
	/*
	public int updateMember(MemberDTO dto) {
	return sqlSession.update("updateMember", dto);
	}
	
	public String searchMember(Map<String, String> map) {
		return  sqlSession.selectOne("searchMember", map);
	}
	*/
	public MemberDTO getMemberId(String member_id){
		return sqlSession.selectOne("getMemberId", member_id);
	}
}

