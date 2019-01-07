package org.web.DTO;

public class MemberDTO {

	private String userId;
	private String userPw;
	private String userName;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	public MemberDTO(String userId) {
		super();
		this.userId = userId;
	}




	public MemberDTO(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}
	
	

	public MemberDTO(String userId, String userPw, String userName) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
