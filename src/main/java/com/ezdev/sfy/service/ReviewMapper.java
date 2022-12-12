package com.ezdev.sfy.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.*;

@Service
public class ReviewMapper {
    @Autowired
    private SqlSession sqlSession;
	
	 
    public int insertReview(ReviewDTO redto) {
    	return sqlSession.insert("insertReview", redto);
    }
    public int getUserById(String member_id) {
		return sqlSession.selectOne("getUserByEmail", member_id);
	} 
	public ReviewDTO getReview(int froute_no, String mode) {
		if(mode.equals("review_content")) {	
		}
		return sqlSession.selectOne("getReview", froute_no);
	}
	
}
