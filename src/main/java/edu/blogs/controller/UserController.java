package edu.blogs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.blogs.common.BlogResult;
import edu.blogs.common.Page;
import edu.blogs.pojo.BlogArticle;
import edu.blogs.pojo.BlogArticleWithBLOBs;
import edu.blogs.pojo.BlogCategory;
import edu.blogs.pojo.BlogUser;
import edu.blogs.service.ArticleService;
import edu.blogs.service.CategoryService;
import edu.blogs.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/user_regist")
	public String regist(BlogUser user, Model model, String backURL) {
		BlogResult result = userService.regist(user);
		if (result.getStatus() == 500) {
			model.addAttribute("error", result.getMsg());
			return "regist";
		} else {
			model.addAttribute("message", "注册成功");
			model.addAttribute("backURL", backURL);
			return "success";
		}
	}

	@RequestMapping("/user_login")
	public String login(String email, String password, Model model,
			@RequestParam(value = "page", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		BlogUser user = (BlogUser) session.getAttribute("user");
		if (user == null) {
			BlogResult result = userService.login(email, password);
			if (result.getStatus() == 500) {
				model.addAttribute("error", result.getMsg());
				model.addAttribute("email", email);
				model.addAttribute("password", password);
				return "login";
			}
			// 登陆成功
			user = (BlogUser) result.getData();
			session.setMaxInactiveInterval(1800);
			// user放入session中
			session.setAttribute("user", user);
		}
		List<BlogArticleWithBLOBs> articles = (List<BlogArticleWithBLOBs>) session
				.getAttribute("articles");
		// 先从seesion中招，如果有的就直接用
		if (articles == null) {
			articles = articleService.findArticles(user);
		}
		// 创建pagePOJO,先从session中获得
		Page adminPage = (Page) session.getAttribute("adminPage");
		if (adminPage == null) {
			adminPage = new Page();
			adminPage.setCurrentPage(pageNo);
			adminPage.setTotalRecord(articles.size());
			int totalPage = articles.size() / Page.ADMIN_ARTICLE_RECROD;
			totalPage = (articles.size() % Page.ADMIN_ARTICLE_RECROD == 0 ? totalPage
					: totalPage + 1);
			adminPage.setTotalPage(totalPage);
		} else
			adminPage.setCurrentPage(pageNo);
		session.setAttribute("adminPage", adminPage);
		// 获得分页内容
		if (pageNo * Page.ADMIN_ARTICLE_RECROD >= articles.size()) {
			articles = articles.subList((pageNo - 1)
					* Page.ADMIN_ARTICLE_RECROD, articles.size());
		} else
			articles = articles.subList((pageNo - 1)
					* Page.ADMIN_ARTICLE_RECROD, pageNo
					* Page.ADMIN_ARTICLE_RECROD);
		// 加载分类内容
		List<BlogCategory> categoryList = categoryService.findAll();
		model.addAttribute("url", "user_login");
		model.addAttribute("adminPage", adminPage);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("articles", articles);
		model.addAttribute("user", user);
		return "list";
	}

	//安全退出
	@RequestMapping("logout")
	public String logout(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "login";
	}
	
	@RequestMapping("/adminCatArt/{category}")
	public String adminCatArt(@PathVariable String category, Model model,
			@RequestParam(value = "page", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<BlogArticleWithBLOBs> articles = articleService
				.findArticles(category);
		Page adminCatArtPage = new Page();
		adminCatArtPage.setCurrentPage(pageNo);
		adminCatArtPage.setTotalRecord(articles.size());
		int totalPage = articles.size() / Page.ADMIN_ARTICLE_RECROD;
		totalPage = (articles.size() % Page.ADMIN_ARTICLE_RECROD == 0 ? totalPage
				: totalPage + 1);
		adminCatArtPage.setTotalPage(totalPage);
		/* session.setAttribute("adminCatArtPage", adminCatArtPage); */
		// 获得分页内容
		if (pageNo * Page.ADMIN_ARTICLE_RECROD >= articles.size()) {
			articles = articles.subList((pageNo - 1)
					* Page.ADMIN_ARTICLE_RECROD, articles.size());
		} else
			articles = articles.subList((pageNo - 1)
					* Page.ADMIN_ARTICLE_RECROD, pageNo
					* Page.ADMIN_ARTICLE_RECROD);
		// 加载分类内容
		List<BlogCategory> categoryList = categoryService.findAll();
		model.addAttribute("url", "adminCatArt/" + category);
		model.addAttribute("adminPage", adminCatArtPage);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("articles", articles);
		return "list";
	}

	// 展示回收站里面的数据
	@RequestMapping("/recycle")
	public String showRecycle(Model model,
			@RequestParam(value = "page", defaultValue = "1") int pageNo) {
		List<BlogArticle> articles = articleService.findRecycle();
		List<BlogCategory> categoryList = categoryService.findAll();
		Page adminCatArtPage = new Page();
		adminCatArtPage.setCurrentPage(pageNo);
		adminCatArtPage.setTotalRecord(articles.size());
		int totalPage = articles.size() / Page.ADMIN_ARTICLE_RECROD;
		totalPage = (articles.size() % Page.ADMIN_ARTICLE_RECROD == 0 ? totalPage
				: totalPage + 1);
		adminCatArtPage.setTotalPage(totalPage);
		/* session.setAttribute("adminCatArtPage", adminCatArtPage); */
		// 获得分页内容
		if (pageNo * Page.ADMIN_ARTICLE_RECROD >= articles.size()) {
			articles = articles.subList((pageNo - 1)
					* Page.ADMIN_ARTICLE_RECROD, articles.size());
		} else
			articles = articles.subList((pageNo - 1)
					* Page.ADMIN_ARTICLE_RECROD, pageNo
					* Page.ADMIN_ARTICLE_RECROD);
		model.addAttribute("url", "recycle");
		model.addAttribute("adminPage", adminCatArtPage);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("articles", articles);
		return "listRecycle";
	}
}
