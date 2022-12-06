package com.ezdev.sfy.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.*;
import com.ezdev.sfy.mypage.Criteria;

@Service
public class MypageMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<MypageDTO> listFriend(){
		return sqlSession.selectList("listFriend");
	}
	public int insertFriend(MypageDTO dto) {
		return sqlSession.insert("insertFriend", dto);
	}
	public int deleteFriend(int friend_num) {
		return sqlSession.delete("deleteFriend", friend_num);
	}
}
