package com.gls.winter;

import java.util.Date;

public class BoardVO {
	private int seq;
	private String category;
	private String title;
	private String writer; // 우선 닉네임 없이 아이디로
	private boolean lost;   // new
	private String content;
	private Date regdate;
	private String lost_found_date;  // new
	private String feature; // new
	private byte[] file_data;      // for file
	private int cnt;
	
//	private String photourl;
//  private String fileName;  // for file
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public boolean isLost() {
		return lost;
	}
	public void setLost(boolean lost) {
		this.lost = lost;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getLost_found_date() {
		return lost_found_date;
	}
	public void setLost_found_date(String lost_found_date) {
		this.lost_found_date = lost_found_date;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public byte[] getFile_data() {
		return file_data;
	}
	public void setFile_data(byte[] file_data) {
		this.file_data = file_data;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
 
	
}