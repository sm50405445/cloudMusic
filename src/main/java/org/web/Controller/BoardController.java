package org.web.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.web.DAO.BDAO;
import org.web.DTO.BoardDTO;
import org.web.util.searchJSON;



@Controller
public class BoardController extends HttpServlet{

	
		@Autowired
		private SqlSession sqlSession;
		
		BoardDTO dto = new BoardDTO();
		
		String url="";
		
		
		@RequestMapping(value="/insert.bo", method = RequestMethod.POST)
		public String insert(HttpServletRequest req,Model model) throws IOException,ServletException {
		BDAO dao = sqlSession.getMapper(BDAO.class);
		dto.setuserId(req.getParameter("userId"));
		dto.setTitle(req.getParameter("title"));
		dto.setMemo(req.getParameter("memo"));
		dao.insertDo(dto);
		
		return "goingBo/BoardListbo";
		
		}
		@RequestMapping(value="/boardList.bo", method = RequestMethod.GET)
		public String list(HttpServletRequest req,Model model) throws IOException,ServletException{
			BDAO dao = sqlSession.getMapper(BDAO.class);
			//전체 게시물 수
			int AllCount = dao.getAllCount();
			//한 화면에 보여질 페이지 수
			int pageSize = 10;
			String pageNum = (String)req.getParameter("pageNum");
			//첫페이지 없으면 1로 초기화
			if(pageNum==null) {
				pageNum="1";
			}
			//인트화
			int currPageNum = Integer.parseInt(pageNum);
			//게시물 번호수 매기기 위한 변수 전체 개수는 AllCount임
			int countNumbering = dao.getAllCount();
			if(currPageNum>1) {
				//2페이지 첫번째 게시글 번호는 11번임
				countNumbering = (countNumbering-(currPageNum-1)*pageSize);
			}
			ArrayList<BoardDTO> doNext = dao.getNext();
			
			int pagenumber = 0;
			
			if(doNext.size()==0) {
				pagenumber = currPageNum;
			}else {
				int next = doNext.get(0).getbId()+1;
				pagenumber = next-(currPageNum-1)*10;
			}
			
			model.addAttribute("AllCount",AllCount);
			model.addAttribute("members",dao.list(pagenumber));
			model.addAttribute("pageSize",pageSize);
			model.addAttribute("currPageNum",currPageNum);
			model.addAttribute("countNumbering",countNumbering);

			return "boardlist";
		}
		@RequestMapping(value="/boardView.bo",method = RequestMethod.GET)
		public String boardView(HttpServletRequest req,Model model) throws IOException,ServletException{
			BDAO dao = sqlSession.getMapper(BDAO.class);
			dao.uphit(Integer.parseInt(req.getParameter("bId")));
			model.addAttribute("list",dao.boardView(Integer.parseInt(req.getParameter("bId"))));
			return "boardView";
		}
		@RequestMapping(value="/boardUpdate.bo", method = RequestMethod.GET)
		public String boardupdate(HttpServletRequest req,Model model) throws IOException,ServletException{
			BDAO dao = sqlSession.getMapper(BDAO.class);
			dao.UpdateDo(Integer.parseInt(req.getParameter("bId")), req.getParameter("userId"), req.getParameter("title"), req.getParameter("memo"));
			return "goingBo/BoardListbo";
		}
		@RequestMapping(value="/boardDelete.bo", method = RequestMethod.GET)
		public String boardDelete(HttpServletRequest req,Model model) throws IOException,ServletException{
			BDAO dao = sqlSession.getMapper(BDAO.class);
			dao.DeleteDo(Integer.parseInt(req.getParameter("bId")));
			return "goingBo/BoardListbo";
		}
		@RequestMapping(value="/boardReply.bo", method = RequestMethod.POST)
		public String boardReply(HttpServletRequest req,Model model) throws IOException,ServletException{
			BDAO dao = sqlSession.getMapper(BDAO.class);
			dao.replyshape(Integer.parseInt(req.getParameter("Bgroup")), Integer.parseInt(req.getParameter("bStep")));
			dao.reply((String)req.getParameter("userId"), (String)req.getParameter("title"), (String)req.getParameter("memo"), Integer.parseInt(req.getParameter("Bgroup")), Integer.parseInt(req.getParameter("bIndent"))+1, Integer.parseInt(req.getParameter("bStep"))+1);
			return "goingBo/BoardListbo";
		}

		@RequestMapping(value="/boardSearch.bo", method = RequestMethod.POST)
		public String boardSearch(HttpServletRequest req,Model model) throws IOException,ServletException{
			BDAO dao = sqlSession.getMapper(BDAO.class);
			String option_value = req.getParameter("option");
			String search_value = req.getParameter("search");
			String order = req.getParameter("order");
			
			ArrayList<BoardDTO> members = dao.SearchDo(option_value, search_value, order);
			model.addAttribute("members",members);
			
			return "boardsearchlist";
		}

		@RequestMapping(value="/boardpersonalUpdate.bo", method = RequestMethod.GET)
		public String PersonalView(HttpServletRequest req,Model model) throws IOException,ServletException{
			BDAO dao = sqlSession.getMapper(BDAO.class);
			String userId = req.getParameter("userId");
			int AllCount = dao.PersonalgetAllCount(userId);
			System.out.println(AllCount);
			int pageSize = 10;
			String pageNum = (String)req.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			int currPageNum = Integer.parseInt(pageNum);
			int countNumbering = dao.PersonalgetAllCount(userId);
			if(currPageNum>1) {
				countNumbering = (countNumbering-(currPageNum-1)*pageSize);
			}
			
			ArrayList<BoardDTO> doNext = dao.PersonalgetNext(userId);
			
			int pagenumber = 0;
			
			if(doNext.size()==0) {
				pagenumber = currPageNum;
			}else {
				int next = doNext.get(0).getbId()+1;
				pagenumber = next-(currPageNum-1)*10;
			}
			
			
			model.addAttribute("AllCount",AllCount);
			model.addAttribute("members",dao.personalView(pagenumber,userId));
			model.addAttribute("countNumbering",countNumbering);
			model.addAttribute("pageSize",pageSize);
			model.addAttribute("currPageNum",currPageNum);

			return "boardpersonallist";
		}
		
		
		
		
	
		//링크 간 연결
		@RequestMapping(value="/boardInsert")
		public String bInsert() {
			
			return "boardInsert";
		}
		@RequestMapping(value="/boardlistpersonalview")
		public String bListPView() {
			return "boardlistpersonalview";
		}
		@RequestMapping(value="/boardReply")
		public String bReply(@RequestParam("userId")String userId,@RequestParam("bId")int bId,@RequestParam("bIndent")int bIndent,@RequestParam("bStep")int bStep,@RequestParam("bGroup")int bgroup,Model model) {
			
			model.addAttribute("userId",userId);
			model.addAttribute("bId",bId);
			model.addAttribute("bIndent",bIndent);
			model.addAttribute("bStep",bStep);
			model.addAttribute("bgroup",bgroup);
			return "boardReply";
		}
		@RequestMapping(value="/boardUpdate")
		public String bUpdate(@RequestParam("bId")int bId,@RequestParam("title")String title,@RequestParam("memo")String memo,Model model) throws ServletException, IOException {
			
			model.addAttribute("bId",bId);
			model.addAttribute("title",title);
			model.addAttribute("memo",memo);
			
			return "boardUpdate";
		}
		@RequestMapping(value="/cartList")
		public String cList() {
			return "cartList";
		}
		@RequestMapping(value="/fileform")
		public String fForm() {
			return "fileform";
		}
		@RequestMapping(value="/fileNo")
		public String fileNo() {
			return "fileNo";
		}
		@RequestMapping(value="/fileOk")
		public String fileOk() {
			return "fileOk";
		}
		@RequestMapping(value="/header")
		public String header() {
			return "header";
		}
		@RequestMapping(value="/index")
		public String index() {
			return "index";
		}
		@RequestMapping(value="/join")
		public String join() {
			return "join";
		}
		@RequestMapping(value="/login")
		public String login() {
			return "login";
		}
		@RequestMapping(value="/memberUpdate")
		public String update() {
			return "memberUpdate";
		}
		@RequestMapping(value="/musicSale")
		public String musicsale(@RequestParam("fid")int fId,@RequestParam("userId")String userId,@RequestParam("musicFileRealName")String musicFileRealName,Model model) {
			model.addAttribute("fId",fId);
			model.addAttribute("userId",userId);
			model.addAttribute("musicFileRealName",musicFileRealName);
			return "musicSale";
		}
		@RequestMapping(value="/musicView")
		public String mView() {
			return "musicView";
		}
		@RequestMapping(value="/")
		public String start() {
			return "start";
		}

}
	

