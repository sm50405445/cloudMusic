package org.web.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.web.DAO.CDAO;
import org.web.DTO.CartDTO;

@Controller
public class CartController extends HttpServlet{


	@Autowired
	private SqlSessionTemplate sqlSession;
	
		
		
		
		@RequestMapping("/musicSale.ca")
		public String InsertCart(HttpServletRequest req,Model model) throws IOException,ServletException{
			CDAO dao = sqlSession.getMapper(CDAO.class);
			dao.insertCartMenu(Integer.parseInt(req.getParameter("fId")), (String)req.getParameter("userId"), (String)req.getParameter("musicFileRealName"), Integer.parseInt(req.getParameter("goodsprice")));
			return "start";
		}
		@RequestMapping("/musicList.ca")
		public String musicList(HttpServletRequest req,Model model) throws IOException,ServletException{
			CDAO dao = sqlSession.getMapper(CDAO.class);
			model.addAttribute("lists",dao.selectDo());
			return "MusicSaleList";
		}
		@RequestMapping("/cartList.ca")
		public @ResponseBody String cartListSession(@RequestParam("IdArr") ArrayList<Integer> IdArr,@RequestParam("NumArr") ArrayList<Integer> NumArr,HttpServletRequest req,Model model) throws IOException,ServletException{
			HttpSession session = req.getSession();
			
			session.setAttribute("IdArr", IdArr);
			session.setAttribute("NumArr", NumArr);
			
			int result = 0;
			if(IdArr.size()!=0&&NumArr.size()!=0) {
				result = 1;
			}else {
				result = -1;
			}
			return String.valueOf(result);
		}
		@RequestMapping("/cartSearch.ca")
		public String cartSearch(HttpServletRequest req,Model model) throws IOException,ServletException{
			CDAO dao = sqlSession.getMapper(CDAO.class);
			HttpSession session = req.getSession();
			List<Integer> IdArr =(ArrayList<Integer>)session.getAttribute("IdArr");
			ArrayList<Integer> NumArr = (ArrayList<Integer>)session.getAttribute("NumArr");
			
			System.out.println(IdArr+"아이디배열");
			System.out.println(NumArr+"개수배열");
			
			if(IdArr==null||NumArr==null) {
				
				int total = 0;
				model.addAttribute("total", total);
				
			}else {
			
				ArrayList<CartDTO> shoppingList = dao.searchDo(IdArr);
				int total = 0;
				for(int i = 0;i<shoppingList.size();i++) {
					total += (shoppingList.get(i).getGoodsPrice()*(NumArr.get(i)));
				}
				
				model.addAttribute("shoppingList", shoppingList);
				model.addAttribute("total", total);
				model.addAttribute("NumArr", NumArr);
			}
			return "cartList";
		}
		
		
}

