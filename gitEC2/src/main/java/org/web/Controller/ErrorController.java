package org.web.Controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

	
	@RequestMapping(value="/404error")
	public String error404(HttpServletResponse resp,Model model) {
		
		return "404error";
	}
}
