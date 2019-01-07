package org.web.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.web.DAO.MDAO;
import org.web.DTO.MemberDTO;



@Controller
public class MemberController{

		@Autowired
		private SqlSessionTemplate sqlSession;
		
		MemberDTO dto = new MemberDTO();
		
		
		
		@RequestMapping("/insert.mo")
		public String insert(HttpServletRequest req,HttpServletResponse resp,Model model) throws ServletException, IOException {
			MDAO dao = sqlSession.getMapper(MDAO.class);
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPw(req.getParameter("userPw"));
			dto.setUserName(req.getParameter("userName"));
			dao.insertDo(dto);
			return "login";
		}
		
		@RequestMapping(value="/login.mo",method=RequestMethod.POST)
		public @ResponseBody String login(@RequestParam("userId")String userId,@RequestParam("userPw") String userPw, Model model,HttpServletRequest req) throws ServletException, IOException {
			MDAO dao = sqlSession.getMapper(MDAO.class);
			String password = dao.LoginDo(userId);
			int result = 0;
			if(password.equals(userPw)) {
				result = 1;
				HttpSession session = req.getSession();
				session.setAttribute("sessionId", userId);
				session.setMaxInactiveInterval(60*60);
			}
			return String.valueOf(result);
		}
		
		@RequestMapping("/idchecked.mo")
		public @ResponseBody String idchekced(@RequestParam("userId")String userId,Model model) throws ServletException, IOException {
			MDAO dao = sqlSession.getMapper(MDAO.class);
			return String.valueOf(dao.IdcheckedDo(userId));
		}
		
		@RequestMapping("/logout.mo")
		public @ResponseBody String logout(HttpServletRequest req,Model model) throws ServletException, IOException {
			HttpSession session = req.getSession();
			int result = 0;
			if(session.getAttribute("sessionId")!=null) {
				session.invalidate();
				result = 1;
			}
			return String.valueOf(result);
		}
		@RequestMapping("/memberInfo.mo")
		public String memberinfo(HttpServletRequest req,HttpServletResponse resp,Model model) throws ServletException, IOException {
			MDAO dao = sqlSession.getMapper(MDAO.class);
			ArrayList<MemberDTO> list = dao.memberInfo(req.getParameter("InfoId"),req.getParameter("InfoPw"));
			model.addAttribute("info",list);
			return "boardlistpersonalview";
		}
		
		@RequestMapping("/Infochk.mo")
		public @ResponseBody String memberInfoChk(@RequestParam("InfoId") String InfoId,@RequestParam("InfoPw") String InfoPw,Model model) throws ServletException, IOException {
			MDAO dao = sqlSession.getMapper(MDAO.class);
			String password = dao.MemberInfoChk(InfoId);
			int result = 0;
			if(password.equals(InfoPw)) {
				result = 1;
				return String.valueOf(result);
			}
			return String.valueOf(result);
		}
		@RequestMapping("/memberdelete.mo")
		public @ResponseBody String memberDelete(@RequestParam("delId") String delId,@RequestParam("delPw") String delPw,HttpServletRequest req,HttpServletResponse resp,Model model) throws ServletException, IOException {
			MDAO dao = sqlSession.getMapper(MDAO.class);
			HttpSession session = req.getSession();
			session.invalidate();
			return String.valueOf(dao.deleteDo(delId, delPw));
		}
		@RequestMapping("/memberUpdate.mo")
		public String memberUpdate(HttpServletRequest req,Model model) throws ServletException, IOException {
			MDAO dao = sqlSession.getMapper(MDAO.class);
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPw(req.getParameter("userPw"));
			dto.setUserName(req.getParameter("userName"));
			dao.updateDo(dto);
			return "start";
			
		}
	
	}

