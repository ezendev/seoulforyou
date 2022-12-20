package com.ezdev.sfy.dto;

public class ReviewDTO {
   private int review_no;
   private int review_route_no;
   private int mem_no;
   private String review_content;
   private String review_star;
   private String review_regdate;

   

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

public String getReview_regdate() {
	return review_regdate;
}
public void setReview_regdate(String review_regdate) {
	this.review_regdate = review_regdate;
}
public int getReview_route_no() {
	return review_route_no;
}
public void setReview_route_no(int review_route_no) {
	this.review_route_no = review_route_no;
}
   
}
