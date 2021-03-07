package com.gls.winter;

import java.io.Serializable;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO implements Serializable{
	
	private static final long serialVersionUID = 74458L;
	
	private int seq;
	private String category;
	private String title;
	private String writer;   // 우선 닉네임 없이 아이디로
	private boolean lost;    // new
	private String content;  
	private Date regdate;
	private String lost_found_date;  // new
	private String feature; // new
	private String photourl;  // 파일인 경우 파일 경로 / 인터넷 상의 사진인 경우 url
	private MultipartFile photofile;
	private int cnt;
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
	public String getPhotourl() {
		return photourl;
	}
	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}
	public MultipartFile getPhotofile() {
		return photofile;
	}
	public void setPhotofile(MultipartFile photofile) {
		this.photofile = photofile;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
//  private byte[] file_data;      // for file
//  private String fileName;  // for file - 필요없을듯?
	
	

}