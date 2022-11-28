package com.ezdev.sfy.dto;

import java.util.List;

public class TourDTO {
	private int tour_no;
	private int tour_type;
	private String tour_name;
	private String tour_postal;
	private String tour_addr;
	private String tour_hp;
	private String tour_open_time;
	private String tour_open_day;
	private String tour_close_day;
	private String tour_traffic;
	
	private List<TourDTO> tourDtoList;
	
	public List<TourDTO> getTourDtoList() {
		return tourDtoList;
	}
	public void setTourDtoList(List<TourDTO> tourDtoList) {
		this.tourDtoList = tourDtoList;
	}
		
	public TourDTO() {
		super();
	}
	public TourDTO(int tour_no,int tour_type,String tour_name, String tour_postal, String tour_addr,String tour_hp,
			String tour_open_time,String tour_open_day,String tour_close_day,String tour_traffic) {
			super();
			this.tour_no=tour_no;
			this.tour_type=tour_type;
			this.tour_name=tour_name;
			this.tour_postal=tour_postal;
			this.tour_addr=tour_addr;
			this.tour_hp=tour_hp;
			this.tour_open_time=tour_open_time;
			this.tour_open_day=tour_open_day;
			this.tour_close_day=tour_close_day;
			this.tour_traffic=tour_traffic;
	}
	public int getTour_no() {
		return tour_no;
	}
	public void setTour_no(int tour_no) {
		this.tour_no = tour_no;
	}
	public int getTour_type() {
		return tour_type;
	}
	public void setTour_type(int tour_type) {
		this.tour_type = tour_type;
	}
	public String getTour_name() {
		return tour_name;
	}
	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}
	public String getTour_postal() {
		return tour_postal;
	}
	public void setTour_postal(String tour_postal) {
		this.tour_postal = tour_postal;
	}
	public String getTour_addr() {
		return tour_addr;
	}
	public void setTour_addr(String tour_addr) {
		this.tour_addr = tour_addr;
	}
	public String getTour_hp() {
		return tour_hp;
	}
	public void setTour_hp(String tour_hp) {
		this.tour_hp = tour_hp;
	}
	public String getTour_open_time() {
		return tour_open_time;
	}
	public void setTour_open_time(String tour_open_time) {
		this.tour_open_time = tour_open_time;
	}
	public String getTour_open_day() {
		return tour_open_day;
	}
	public void setTour_open_day(String tour_open_day) {
		this.tour_open_day = tour_open_day;
	}
	public String getTour_close_day() {
		return tour_close_day;
	}
	public void setTour_close_day(String tour_close_day) {
		this.tour_close_day = tour_close_day;
	}
	public String getTour_traffic() {
		return tour_traffic;
	}
	public void setTour_traffic(String tour_traffic) {
		this.tour_traffic = tour_traffic;
	}
	
}
