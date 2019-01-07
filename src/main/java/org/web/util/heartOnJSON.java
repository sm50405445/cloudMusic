package org.web.util;

import java.util.ArrayList;

import org.web.DTO.FileDTO;

public class heartOnJSON {

	public ArrayList<Integer> heartJson(ArrayList<FileDTO> list,ArrayList<Integer> IdList,String userId) {
		
		for(FileDTO dto : list) {
			String flike = dto.getFlike();
			if(flike.contains(userId)) {				
				int fId = dto.getFid();
				IdList.add(fId);
			}
		}
		return IdList;
	}
}
