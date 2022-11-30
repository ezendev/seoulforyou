package com.ezdev.sfy.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezdev.sfy.dto.QnaDTO;

@Service
public class QnaMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<QnaDTO> listBoard(int startRow, int endRow){
			Map<String, Integer> map = new Hashtable<>();
			map.put("start", startRow);
			map.put("end", endRow);
			return sqlSession.selectList("listBoard", map);
	}
	
	public  int insertBoard(QnaDTO dto) {
			String sql = null;
			if (dto.getNum() == 0) {
				sql = "update board set re_step = re_step + 1";
			}else {
				sql = "update board set re_step = re_step + 1 where re_step > "+dto.getRe_step();
				dto.setRe_step(dto.getRe_step()+1);
				dto.setRe_level(dto.getRe_level()+1);
			}
			Map<String, String> map = new Hashtable<>();
			map.put("sql", sql);
			sqlSession.update("plusRe_step", map);
			return sqlSession.insert("insertBoard", dto);
	}
	public QnaDTO getBoard(int num, String mode) {
		if (mode.equals("content")) {
			sqlSession.update("plusReadcount", num);
		}
		return  sqlSession.selectOne("getBoard", num);
}
	
	public int getCount() {
			return sqlSession.selectOne("getCount");
	}
}