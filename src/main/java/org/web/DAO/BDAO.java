package org.web.DAO;

import java.util.ArrayList;

import org.web.DTO.BoardDTO;
import org.web.DTO.FileDTO;

public interface BDAO {

	public int insertDo(BoardDTO dto);
	
	public int insertBgroupSub();
	
	public void uphit(int bId);
	
	public ArrayList<BoardDTO> getNext();
	
	public ArrayList<BoardDTO> PersonalgetNext(String userId);
	
	public ArrayList<BoardDTO> list(int count);
	
	public void replyshape(int strGroup, int strStep);
	
	public void reply(String userId, String title, String memo, int bgroup, int bIndent, int bStep);
	
	public int getAllCount();
	
	public int PersonalgetAllCount(String userId);
	
	public ArrayList<BoardDTO> boardView(int Id);
	
	public void UpdateDo(int bId,String userId,String title,String memo);
	
	public int DeleteDo(int bId);
	
	public ArrayList<BoardDTO> SearchDo(String option,String search,String order);
	
	public ArrayList<BoardDTO> personalView(int pagenumber,String userId);
	
	public ArrayList<FileDTO> thumbnailSelectDo();
	
	public ArrayList<FileDTO> musicView(int Id);
	
	public int fileDeleteDo(int id);
	
}
