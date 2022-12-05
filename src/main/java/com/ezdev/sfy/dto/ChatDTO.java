package com.ezdev.sfy.dto;

public class ChatDTO {
	private int chat_no;
	private int chat_room;
	private String chat_send_nick;
	private String chat_recv_nick;
	private String chat_send_time;
	private String chat_read_time;
	private String chat_content;
	private String chat_read_chk;
	
	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String other_nick;
	
	// 현재 사용자 nick
	private String nick;
	
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

	public String getChat_send_nick() {
		return chat_send_nick;
	}

	public void setChat_send_nick(String chat_send_nick) {
		this.chat_send_nick = chat_send_nick;
	}

	public String getChat_recv_nick() {
		return chat_recv_nick;
	}

	public void setChat_recv_nick(String chat_recv_nick) {
		this.chat_recv_nick = chat_recv_nick;
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

	public String getOther_nick() {
		return other_nick;
	}

	public void setOther_nick(String other_nick) {
		this.other_nick = other_nick;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getUnread() {
		return unread;
	}

	public void setUnread(int unread) {
		this.unread = unread;
	}
	
	
}
