package com.ezdev.sfy.dto;

public class QnaDTO {
	private int qna_no;
	private String qna_writer;
	private String qna_subject;
	private String qna_passwd;
	private String qna_regdate;
	private int qna_readcount;
	private String qna_content;
	private int qna_re_step;
	private int qna_re_level;
	private String qna_reply_content;
	private String qna_reply_regdate;
	private String brddeleteflag;
	
	public String getBrddeleteflag() {
		return brddeleteflag;
	}
	public void setBrddeleteflag(String brddeleteflag) {
		this.brddeleteflag = brddeleteflag;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_passwd() {
		return qna_passwd;
	}
	public void setQna_passwd(String qna_passwd) {
		this.qna_passwd = qna_passwd;
	}
	public String getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(String qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	public int getQna_readcount() {
		return qna_readcount;
	}
	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_re_step() {
		return qna_re_step;
	}
	public void setQna_re_step(int qna_re_step) {
		this.qna_re_step = qna_re_step;
	}
	public int getQna_re_level() {
		return qna_re_level;
	}
	public void setQna_re_level(int qna_re_level) {
		this.qna_re_level = qna_re_level;
	}
	public String getQna_reply_content() {
		return qna_reply_content;
	}
	public void setQna_reply_content(String qna_reply_content) {
		this.qna_reply_content = qna_reply_content;
	}
	public String getQna_reply_regdate() {
		return qna_reply_regdate;
	}
	public void setQna_reply_regdate(String qna_reply_regdate) {
		this.qna_reply_regdate = qna_reply_regdate;
	}

}