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

	public List<MypageDTO> listFriend(){
		return sqlSession.selectList("listFriend");
	}
	public int insertFriend(MemberDTO memberdto) {
		return sqlSession.insert("insertFriend", memberdto);
	}
	public int deleteFriend(int friend_num) {
		return sqlSession.delete("deleteFriend", friend_num);
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
}
