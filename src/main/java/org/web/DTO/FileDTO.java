package org.web.DTO;

import java.sql.Timestamp;

public class FileDTO {

	private int Fid;
	private String userId;
	private String author;
	private String title;
	private String musicFile;
	private String musicFileRealName;
	private String imgFile;
	private String imgFileRealName;
	private Timestamp fday;
	private int fhit;
	private String flike;
	
	public FileDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public FileDTO(int fid, String flike) {
		super();
		Fid = fid;
		this.flike = flike;
	}

	public FileDTO(int fid, String userId, String author, String title, String musicFile, String musicFileRealName,
			String imgFile, String imgFileRealName, Timestamp fday, int fhit) {
		super();
		Fid = fid;
		this.userId = userId;
		this.author = author;
		this.title = title;
		this.musicFile = musicFile;
		this.musicFileRealName = musicFileRealName;
		this.imgFile = imgFile;
		this.imgFileRealName = imgFileRealName;
		this.fday = fday;
		this.fhit = fhit;
	}

	

	public FileDTO(int fid, String userId, String author, String title, String musicFile, String musicFileRealName,
			String imgFile, String imgFileRealName, Timestamp fday, int fhit, String flike) {
		super();
		Fid = fid;
		this.userId = userId;
		this.author = author;
		this.title = title;
		this.musicFile = musicFile;
		this.musicFileRealName = musicFileRealName;
		this.imgFile = imgFile;
		this.imgFileRealName = imgFileRealName;
		this.fday = fday;
		this.fhit = fhit;
		this.flike = flike;
	}



	public int getFid() {
		return Fid;
	}
	public void setFid(int fid) {
		Fid = fid;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMusicFile() {
		return musicFile;
	}
	public void setMusicFile(String musicFile) {
		this.musicFile = musicFile;
	}
	public String getMusicFileRealName() {
		return musicFileRealName;
	}
	public void setMusicFileRealName(String musicFileRealName) {
		this.musicFileRealName = musicFileRealName;
	}



	public String getImgFile() {
		return imgFile;
	}



	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}



	public String getImgFileRealName() {
		return imgFileRealName;
	}



	public void setImgFileRealName(String imgFileRealName) {
		this.imgFileRealName = imgFileRealName;
	}



	public Timestamp getFday() {
		return fday;
	}
	public void setFday(Timestamp fday) {
		this.fday = fday;
	}
	public int getFhit() {
		return fhit;
	}
	public void setFhit(int fhit) {
		this.fhit = fhit;
	}
	public String getFlike() {
		return flike;
	}
	public void setFlike(String flike) {
		this.flike = flike;
	}

	
	
}
