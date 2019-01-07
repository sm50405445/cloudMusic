package org.web.util;

import java.io.File;

public class fileDelete {

	public void fileDeleteExcute(String musicName,String imgName) {
		
		String path = "C:\\Users\\Administrator\\eclipse-workspace\\Spring_Mybatis\\src\\main\\webapp\\resources\\upload";
		File musicFile = new File(path,musicName);
		File imgFile = new File(path,imgName);
		
		if(musicFile.exists()&&musicFile.isFile()&&imgFile.exists()&&imgFile.isFile()) {
			musicFile.delete();
			imgFile.delete();
		}else {
			System.out.println("파일삭제실패");
		}
	}
}
