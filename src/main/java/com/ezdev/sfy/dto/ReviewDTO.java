package com.ezdev.sfy.dto;

public class ReviewDTO {
   private int froute_no; //아이디 역할, 마이루트dto route_no 외래키
   private int mem_no;//아이디 역할, 멤버dto member_no 외래키
   private int review_no;//아이디 역할
   private String review_content;//리뷰내용
   private int review_rating;//별점

   
   
   public int getFroute_no() {
	return froute_no;
}
public void setFroute_no(int froute_no) {
	this.froute_no = froute_no;
}
public int getMem_no() {
	return mem_no;
}
public void setMem_no(int mem_no) {
	this.mem_no = mem_no;
}
public int getReview_no() {
	return review_no;
}
public void setReview_no(int review_no) {
	this.review_no = review_no;
}
public String getReview_content() {
	return review_content;
}
public void setReview_content(String review_content) {
	this.review_content = review_content;
}
public int getReview_rating() {
	return review_rating;
}
public void setReview_rating(int review_rating) {
	this.review_rating = review_rating;
}
   
}
