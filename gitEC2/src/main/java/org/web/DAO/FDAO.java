package org.web.DAO;

import java.util.ArrayList;

import org.json.simple.parser.ParseException;
import org.web.DTO.FileDTO;

public interface FDAO {

	public ArrayList<FileDTO> thumbnailSelectDo();
	public ArrayList<FileDTO> musicView(int Id);
	public int fileDeleteDo(int id);
	public int fileUpload(String userId, String author, String title, String musicFile, String musicFileRealName,
			String imgFile, String imgFileRealName);
	public String flikeSearch(int fId);
	public void hitUp(int fId);
	public void hitDown(int fId);
	public int uplike(int fId,String userId) throws ParseException;
	public Integer hitView(int fId);
	public ArrayList<FileDTO> heartOn();
}
