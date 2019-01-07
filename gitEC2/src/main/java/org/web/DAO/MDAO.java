package org.web.DAO;

import java.util.ArrayList;

import org.web.DTO.MemberDTO;

public interface MDAO {

	public int insertDo(MemberDTO dto);
	public String LoginDo(String userId);
	public int IdcheckedDo(String userId);
	public int deleteDo(String userId, String userPw);
	public ArrayList<MemberDTO> memberInfo(String Id,String Pw);
	public int updateDo(MemberDTO dto);
	public String MemberInfoChk(String InfoId);
}
