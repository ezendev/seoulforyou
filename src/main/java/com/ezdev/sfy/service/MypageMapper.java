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

	 public List<ReviewDTO> listReview(int startRow, int endRow, int no){
		 Map<String, Integer> map = new Hashtable<>();
			map.put("start", startRow);
			map.put("end", endRow);
			map.put("no", no);
		 return sqlSession.selectList("listReview", map);
	    }
	 public int listReviewCount(int no) {
		 return sqlSession.selectOne("listReviewCount", no);
	 }

	//myRoute(list, find만 mypage에서)
		public List<MyRouteDTO> listMyroute(int no, int startRow, int endRow) {
			Map<String, Integer> map = new Hashtable<>();
			map.put("no", no);
			map.put("start", startRow);
			map.put("end", endRow);
			return sqlSession.selectList("listMyroute", map);
		}
		public int getCountRoute(int no) {
			return sqlSession.selectOne("getCountRoute", no);
		}
		
		public int getCountRouteFilter(int no, String route_hashtag) {
			Map<String, Object> map = new Hashtable<>();
			map.put("no", no);
			map.put("route_hashtag", route_hashtag);
			return sqlSession.selectOne("getCountRouteFilter", map);
		}
		public List<MyRouteDTO> filterMyroute(Map<String, Object> filterMap) {
			return sqlSession.selectList("filterMyroute", filterMap);
		}

		// Favorite
		public int updateFavorite(Map<String,Object> map) {
			   return sqlSession.update("updateFavorite", map);
		   }
		
		public int updateRouteFavorite(Map<String, Object> map) {
			return sqlSession.update("updateRouteFavorite", map);
		}
		
		public int deleteFavorite(Map<String, Object> map) {
			return sqlSession.update("deleteFavorite", map);
		}
		
		public int deleteRouteFavorite(Map<String, Object> map) {
			return sqlSession.update("deleteRouteFavorite", map);
		}

		public List<TourDTO> listFavoriteTour(int no) {
			return sqlSession.selectList("listFavoriteTour", no);
		}

		public List<MyRouteDTO> listFavoriteRoute(int no) {
			return sqlSession.selectList("listFavoriteRoute", no);
		}
	   

	}

