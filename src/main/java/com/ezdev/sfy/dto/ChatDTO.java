package com.ezdev.sfy.dto;

public class ChatDTO {
	private int chat_no;
	private int chat_room;
	private int chat_send_no;
	private int chat_recv_no;
	private String chat_send_time;
	private String chat_read_time;
	private String chat_content;
	private String chat_read_chk;
	
	// 현재 사용자의 메세지 상대 no를 담는다.
	private int other_no;
	
	// 현재 사용자의 메세지 상대 name을 담는다.
	private String other_name;
	
	// 현재 사용자 no
	private int no;
	
	// 안읽은 메세지 갯수
	private int unread;

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	public int getChat_room() {
		return chat_room;
	}

	public void setChat_room(int chat_room) {
		this.chat_room = chat_room;
	}

	public String getChat_send_time() {
		return chat_send_time;
	}

	public void setChat_send_time(String chat_send_time) {
		this.chat_send_time = chat_send_time;
	}

	public String getChat_read_time() {
		return chat_read_time;
	}

	public void setChat_read_time(String chat_read_time) {
		this.chat_read_time = chat_read_time;
	}

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}

	public String getChat_read_chk() {
		return chat_read_chk;
	}

	public void setChat_read_chk(String chat_read_chk) {
		this.chat_read_chk = chat_read_chk;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getOther_no() {
		return other_no;
	}

	public void setOther_no(int other_no) {
		this.other_no = other_no;
	}

	public int getNick() {
		return no;
	}

	public void setNick(int no) {
		this.no = no;
	}

	public int getUnread() {
		return unread;
	}

	public void setUnread(int unread) {
		this.unread = unread;
	}

	public int getChat_send_no() {
		return chat_send_no;
	}

	public void setChat_send_no(int chat_send_no) {
		this.chat_send_no = chat_send_no;
	}

	public int getChat_recv_no() {
		return chat_recv_no;
	}

	public void setChat_recv_no(int chat_recv_no) {
		this.chat_recv_no = chat_recv_no;
	}

	public String getOther_name() {
		return other_name;
	}

	public void setOther_name(String other_name) {
		this.other_name = other_name;
	}
	
	
}
