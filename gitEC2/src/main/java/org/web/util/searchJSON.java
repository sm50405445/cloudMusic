package org.web.util;

import java.util.ArrayList;

import org.web.DTO.BoardDTO;

public class searchJSON {

	public String getJSON(ArrayList<BoardDTO> lists) {
		
		StringBuffer result = new StringBuffer("");
		result.append("{'result':[");
		for(BoardDTO dto : lists) {
			result.append("[{'value':'"+dto.getbId()+"'},");
			result.append("{'value':'"+dto.getuserId()+"'},");
			result.append("{'value':'"+dto.getTitle()+"'},");
			result.append("{'value':'"+dto.getMemo()+"'},");
			result.append("{'value':'"+dto.getHit()+"'},");
			result.append("{'value':'"+dto.getbIndent()+"'},");
			result.append("{'value':'"+dto.getbTime()+"'}],");
		}
		result.append("]}");
		return result.toString();
	}
}
