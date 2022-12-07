package com.ezdev.sfy.dto;

public class MyRouteDTO {

	private int route_no;
	private int mem_no;
	private String route_subject;
	private String route_content;
	private String route_img;
	private String route_itinerary; //여행기간
	private String route_tour; //루트(tour_no를 구분자로 저장)
	private int route_readcount;
	private String route_region;
	private String route_hashtag;
	private String route_regdate;

	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getRoute_region() {
		return route_region;
	}
	public void setRoute_region(String route_region) {
		this.route_region = route_region;
	}
	
	public int getRoute_no() {
		return route_no;
	}
	public void setRoute_no(int route_no) {
		this.route_no = route_no;
	}
	public String getRoute_subject() {
		return route_subject;
	}
	public void setRoute_subject(String route_subject) {
		this.route_subject = route_subject;
	}
	public String getRoute_content() {
		return route_content;
	}
	public void setRoute_content(String route_content) {
		this.route_content = route_content;
	}
	public String getRoute_img() {
		return route_img;
	}
	public void setRoute_img(String route_img) {
		this.route_img = route_img;
	}
	public String getRoute_itinerary() {
		return route_itinerary;
	}
	public void setRoute_itinerary(String route_itinerary) {
		this.route_itinerary = route_itinerary;
	}
	public String getRoute_tour() {
		return route_tour;
	}
	public void setRoute_tour(String route_tour) {
		this.route_tour = route_tour;
	}
	public int getRoute_readcount() {
		return route_readcount;
	}
	public void setRoute_readcount(int route_readcount) {
		this.route_readcount = route_readcount;
	}
	public String getRoute_hashtag() {
		return route_hashtag;
	}
	public void setRoute_hashtag(String route_hashtag) {
		this.route_hashtag = route_hashtag;
	}
	public String getRoute_regdate() {
		return route_regdate;
	}
	public void setRoute_regdate(String route_regdate) {
		this.route_regdate = route_regdate;
	}
}
