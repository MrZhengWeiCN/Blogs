package edu.blogs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//页面跳转作用
@Controller
public class PageController {

	
	@RequestMapping("/login")
	public String showlogin() {
		return "login";
	}
	@RequestMapping("/regist")
	public String showregist() {
		return "regist";
	}
}
