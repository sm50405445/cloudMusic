package org.web.DAO;

import java.util.ArrayList;
import java.util.List;

import org.web.DTO.CartDTO;

public interface CDAO {

	public int insertCartMenu(int fId,String userName,String fileName,int goodsprice);
	public ArrayList<CartDTO> selectDo();
	public ArrayList<CartDTO> searchDo(List<Integer> IdNumber);
}
