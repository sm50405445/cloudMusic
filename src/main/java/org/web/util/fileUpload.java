package org.web.util;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public class fileUpload {

	public void uploadExcute(Model model) throws IllegalStateException, IOException {
		
		System.out.println("파일업로드");
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest  multi = (MultipartHttpServletRequest)map.get("multi");
		
		//저장경로
		String path = "C:\\Users\\Administrator\\eclipse-workspace\\Spring_Mybatis\\src\\main\\webapp\\resources\\upload";

		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		MultipartFile musicFile = multi.getFile("musicFile");
		MultipartFile imgFile = multi.getFile("imgFile");
		

		File file = new File(path);
		if(file.exists()==false) {
			file.mkdirs();
		}
		
		String url = "";
		if(!musicFile.getOriginalFilename().endsWith(".mp3")&&!imgFile.getOriginalFilename().endsWith(".jpg")){
			
			url="fileNo";
		}else {
			//파일 중복명 처리
			String genId = UUID.randomUUID().toString();
			//본래파일 이름
			String MfileName = musicFile.getOriginalFilename();
			String IfileName = imgFile.getOriginalFilename();
			
			String saveMusicName = genId+"."+MfileName;
			String saveImgName = genId+"."+IfileName; 
			
			// 업로드한 파일을 특정파일로 저장하고 싶다면 MultipartFile.transferTo() 를 쓰면 편하다.
			file = new File(path,saveMusicName);
			musicFile.transferTo(file);
			file = new File(path,saveImgName);
			imgFile.transferTo(file);
		
			url = "fileOk";
			model.addAttribute("saveMusicName",saveMusicName);
			model.addAttribute("MfileName",MfileName);
			model.addAttribute("saveImgName",saveImgName);
			model.addAttribute("IfileName",IfileName);
		}
		
		
		model.addAttribute("url", url);
		
	}
}
