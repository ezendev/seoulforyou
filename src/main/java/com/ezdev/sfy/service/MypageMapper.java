package com.ezdev.sfy.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.*;


@Service
public class MypageMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public MyPageDTO getMyPage(int no) {
		return sqlSession.selectOne("getMyPage", no);
	}

	public List<MemberDTO> listFriend(Map<String, Object> map){
		return sqlSession.selectList("listFriend", map);
	}
	public int insertFriend(Map<String, Object> map) {
		sqlSession.insert("insertFriendMe", map);
		return sqlSession.insert("insertFriendYou", map);
	}
	public int deleteFriend(Map<String, Integer> map) {
		return sqlSession.delete("deleteFriend", map);
	}
	public List<MemberDTO> listMypageMember(int startRow, int endRow){
		Map<String, Integer> map = new Hashtable<>();
		map.put("start", startRow);
		map.put("end", endRow);
		return sqlSession.selectList("listMypageMember", map);
	}
	public int listMypageMemberCount() {
		return sqlSession.selectOne("listMypageMemberCount");
	}
	public List<MemberDTO> findMember(Map<String, String> find){
		return sqlSession.selectList("findMember", find);
	}
	public int updateFavorite(Map<String,Object> map) {
		   return sqlSession.update("updateFavorite", map);
	   }
	   
	}

