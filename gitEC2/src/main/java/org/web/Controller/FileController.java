package org.web.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.web.DAO.FDAO;
import org.web.DTO.FileDTO;
import org.web.util.fileDelete;
import org.web.util.fileUpload;
import org.web.util.heartOnJSON;

@Controller
public class FileController {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	FileDTO dto = new FileDTO();
	
	
	@RequestMapping(value="/fileformOk.bo", method = RequestMethod.POST)
	public String boardFileUpload(Model model,MultipartHttpServletRequest multi) throws IOException,ServletException{
		FDAO dao = sqlsession.getMapper(FDAO.class);
		model.addAttribute("multi",multi);
		fileUpload file = new fileUpload();
		file.uploadExcute(model);
		dao.fileUpload((String)multi.getParameter("userId"), (String)multi.getParameter("author"), (String)multi.getParameter("title"), (String)model.asMap().get("saveMusicName"),(String)model.asMap().get("MfileName"),(String)model.asMap().get("saveImgName"),(String)model.asMap().get("IfileName"));
		String url = model.asMap().get("url").toString();
		return url;
	}
	@RequestMapping(value="/fileuploadview.bo", method = RequestMethod.GET)
	public String fileuploadView(Model model) throws IOException,ServletException{
		FDAO dao = sqlsession.getMapper(FDAO.class);
		model.addAttribute("thumblists",dao.thumbnailSelectDo());
		return "index";
	}
	@RequestMapping(value="/fileDelete.bo", method = RequestMethod.GET)
	public String fileDelete(HttpServletRequest req,Model model) throws IOException,ServletException{
		FDAO dao = sqlsession.getMapper(FDAO.class);
		ArrayList<FileDTO> file = dao.musicView(Integer.parseInt(req.getParameter("fid")));
		org.web.util.fileDelete filedel = new fileDelete();
		filedel.fileDeleteExcute(file.get(0).getMusicFile(),file.get(0).getImgFile());
		dao.fileDeleteDo(Integer.parseInt(req.getParameter("fid")));
		return "start";
	}
	@RequestMapping(value="/like.bo", method = RequestMethod.POST)
	public @ResponseBody String like(@RequestParam("fId")int fId,@RequestParam("userId") String userId,Model model) throws IOException,ServletException, ParseException{
		FDAO dao = sqlsession.getMapper(FDAO.class);
		int result = 0;
		String flike = dao.flikeSearch(fId);
		if(flike.equals("")||flike.equals("null")) {
			dao.hitUp(fId);
			String Id = "{\"ID\":[\""+userId+"\"]}";
			dao.uplike(fId, Id);
			result = 2;
		}else {
			JSONParser jsParse = new JSONParser();
			JSONObject jsOb = (JSONObject)jsParse.parse(flike);
			//json 배열 키값 ex){\"ID\":[\""+userId+"\"]}
			JSONArray jsonArr = (JSONArray)jsOb.get("ID");
			if(jsonArr.contains(userId)==true) {
				dao.hitDown(fId);
				jsonArr.remove(userId);
				jsOb.put("ID", jsonArr);
				String MinusId = jsOb.toString();
				dao.uplike(fId, MinusId);
				result = 1;
			}else {
				dao.hitUp(fId);
				jsonArr.add(userId);
				System.out.println(jsonArr);
				jsOb.put("ID", jsonArr);
				System.out.println(jsOb);
				String PlusId = jsOb.toString();
				dao.uplike(fId, PlusId);
				result = 2;
			}
		}
		return String.valueOf(result);
	}
	@RequestMapping(value="/hitview.bo", method = RequestMethod.POST)
	public @ResponseBody String hitView(@RequestParam("fId")int fId,HttpServletRequest req,Model model) throws IOException,ServletException{
		FDAO dao = sqlsession.getMapper(FDAO.class);
		int value = dao.hitView(fId);
		return String.valueOf(value);
	}		
	@RequestMapping(value="/heartOn.bo", method = RequestMethod.POST)
	public @ResponseBody String heartOn(@RequestParam("userId")String userId,Model model) throws IOException,ServletException{
		FDAO dao = sqlsession.getMapper(FDAO.class);
		if(userId.equals(""))
			userId="null";
		ArrayList<FileDTO> list = new ArrayList<FileDTO>();
		ArrayList<Integer> IdList = new ArrayList<Integer>();
		heartOnJSON hJson = new heartOnJSON();
		list = dao.heartOn();
		return hJson.heartJson(list, IdList, userId).toString();
	}
	
	@RequestMapping(value="/musicview.bo", method = RequestMethod.GET)
	public String musicView(HttpServletRequest req,Model model) throws IOException,ServletException{
		FDAO dao = sqlsession.getMapper(FDAO.class);
		ArrayList<FileDTO> list = dao.musicView(Integer.parseInt(req.getParameter("fid")));
		model.addAttribute("list",list);
		return "musicView";
	}
}
