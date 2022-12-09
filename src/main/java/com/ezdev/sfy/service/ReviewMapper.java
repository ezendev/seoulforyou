package com.ezdev.sfy.service;

import java.util.*;

import org.apache.ibatis.annotations.Select;
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
    public int getUserByEmail(String member_email) {
		return sqlSession.selectOne("getUserByEmail", member_email);
	} 
	
	
}
