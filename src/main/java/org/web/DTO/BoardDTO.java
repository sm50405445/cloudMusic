package org.web.DTO;

import java.sql.Timestamp;

public class BoardDTO {
	
	private int bId;
	private String userId;
	private String title;
	private String memo;
	private int bgroup;
	private int bIndent;
	private int bStep;
	private int hit;
	private Timestamp bTime;
	
	
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public BoardDTO(int bId) {
		super();
		this.bId = bId;
	}



	public BoardDTO(String userId, String title, String memo) {
		super();
		this.userId = userId;
		this.title = title;
		this.memo = memo;
	}

	
	public BoardDTO(int bId, String userId, String title, String memo) {
		super();
		this.bId = bId;
		this.userId = userId;
		this.title = title;
		this.memo = memo;
	}

	
	public BoardDTO(int bId, String userId, String title, String memo, int hit) {
		super();
		this.bId = bId;
		this.userId = userId;
		this.title = title;
		this.memo = memo;
		this.hit = hit;
	}



	public BoardDTO(String userId, String title, String memo, int bgroup, int bIndent, int bStep) {
		super();
		this.userId = userId;
		this.title = title;
		this.memo = memo;
		this.bgroup = bgroup;
		this.bIndent = bIndent;
		this.bStep = bStep;
	}



	public BoardDTO(int bId, String userId, String title, String memo, int bgroup, int bIndent, int hit,
			Timestamp bTime) {
		super();
		this.bId = bId;
		this.userId = userId;
		this.title = title;
		this.memo = memo;
		this.bgroup = bgroup;
		this.bIndent = bIndent;
		this.hit = hit;
		this.bTime = bTime;
	}

	

	
	public BoardDTO(int bId, String userId, String title, String memo, int bgroup, int bIndent, int bStep, int hit,
			Timestamp bTime) {
		super();
		this.bId = bId;
		this.userId = userId;
		this.title = title;
		this.memo = memo;
		this.bgroup = bgroup;
		this.bIndent = bIndent;
		this.bStep = bStep;
		this.hit = hit;
		this.bTime = bTime;
	}

	public int getbStep() {
		return bStep;
	}

	public void setbStep(int bStep) {
		this.bStep = bStep;
	}


	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getuserId() {
		return userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getBgroup() {
		return bgroup;
	}

	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}

	public int getbIndent() {
		return bIndent;
	}

	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Timestamp getbTime() {
		return bTime;
	}

	public void setbTime(Timestamp bTime) {
		this.bTime = bTime;
	}
	
	
	

}
