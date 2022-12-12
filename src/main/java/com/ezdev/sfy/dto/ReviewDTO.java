package com.ezdev.sfy.dto;

public class ReviewDTO {
   private int review_no;//아이디 역할(id)
   private int froute_no; //아이디 역할(book_id), 마이루트dto route_no 외래키
   private int mem_no;//아이디 역할(user_id), 멤버dto member_no 외래키
   private String review_content;//리뷰내용
   private String review_star;//별점
   private int review_like;
   private String review_regdate;

   
   
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
public String getReview_star() {
	return review_star;
}
public void setReview_star(String review_star) {
	this.review_star = review_star;
}
public int getReview_like() {
	return review_like;
}
public void setReview_like(int review_like) {
	this.review_like = review_like;
}
public String getReview_regdate() {
	return review_regdate;
}
public void setReview_regdate(String review_regdate) {
	this.review_regdate = review_regdate;
}
   
}
