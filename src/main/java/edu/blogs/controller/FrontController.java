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

@Controller
public class FrontController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/cat_article/{cateId}")
	public String showArtcileList(@PathVariable Integer cateId, Model model,
			HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "1") int pageNo) {

		BlogCategory cate = categoryService.findById(cateId);
		List<BlogArticleWithBLOBs> articles = (List<BlogArticleWithBLOBs>) articleService
				.findArticles(cate.getCategory());
		HttpSession session = request.getSession();
		Page<BlogArticleWithBLOBs> frontArtPage = (Page<BlogArticleWithBLOBs>) session
				.getAttribute("frontArtPage");
		if (frontArtPage == null) {
			frontArtPage = new Page<BlogArticleWithBLOBs>();
			frontArtPage.setCurrentPage(pageNo);
			frontArtPage.setTotalRecord(articles.size());
			int totalPage = articles.size() / Page.FRONT_ARTICLE_RECROD;
			totalPage = (articles.size() % Page.FRONT_ARTICLE_RECROD == 0 ? totalPage
					: totalPage + 1);
			frontArtPage.setTotalPage(totalPage);
		} else
			frontArtPage.setCurrentPage(pageNo);
		session.setAttribute("frontArtPage", frontArtPage);
		// 获得分页内容
		articles = frontArtPage.getResultList(pageNo, articles,
				Page.FRONT_ARTICLE_RECROD);
		model.addAttribute("cateName", cate.getCategory());
		model.addAttribute("frontArtPage", frontArtPage);
		model.addAttribute("articles", articles);
		model.addAttribute("cateId", cateId);
		return "ArtcileList";
	}

	@RequestMapping("/")
	public String showCateList(Model model,
			@RequestParam(value = "page", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		List<BlogCategory> cateList = categoryService.findAll();
		// 创建pagePOJO,先从session中获得
		HttpSession session = request.getSession();
		Page<BlogCategory> frontCatePage = (Page<BlogCategory>) session
				.getAttribute("frontCatePage");
		if (frontCatePage == null) {
			frontCatePage = new Page<BlogCategory>();
			frontCatePage.setCurrentPage(pageNo);
			frontCatePage.setTotalRecord(cateList.size());
			int totalPage = cateList.size() / Page.FRONT_CATEGORY_RECROD;
			totalPage = (cateList.size() % Page.FRONT_CATEGORY_RECROD == 0 ? totalPage
					: totalPage + 1);
			frontCatePage.setTotalPage(totalPage);
		} else
			frontCatePage.setCurrentPage(pageNo);
		session.setAttribute("frontCatePage", frontCatePage);
		// 获得分页内容
		cateList = frontCatePage.getResultList(pageNo, cateList,
				Page.FRONT_CATEGORY_RECROD);
		BlogUser user = new BlogUser();
		user.setId((long) 1);
		List<BlogArticleWithBLOBs> articles = articleService.findArticles(user);
		List<BlogArticleWithBLOBs> recentArticles = articles.subList(
				articles.size() - 5, articles.size());
		session.setMaxInactiveInterval(1800);
		session.setAttribute("recentArticles", recentArticles);
		model.addAttribute("frontCatePage", frontCatePage);
		model.addAttribute("cateList", cateList);
		return "CateList";
	}

	@RequestMapping("/aboutme")
	public String aboutme() {
		return "aboutMe";
	}
	
	//前台文章详情展示
	@RequestMapping("/article/{id}")
	public String findById(@PathVariable Integer id, Model model) {
		BlogResult result = articleService.findArticles(id);
		if (result.getStatus() == 500) {
			model.addAttribute("error", result.getMsg());
			return "error";
		}
		// 成功就展示页面
		BlogArticle article = (BlogArticle) result.getData();
		//阅读量，这里只是简单的和数据库存取，流量大了以后可以考虑使用缓存
		article.setReaded(article.getReaded()+1);
		articleService.update(article);
		String category = article.getCategory();
		BlogCategory cate = categoryService.findByName(category);
		model.addAttribute("cateId", cate.getId());
		model.addAttribute("article", article);
		return "detail";
	}

	@RequestMapping("/search/{querytitle}")
	public String search(@PathVariable String querytitle, Model model,
			@RequestParam(value = "page", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<BlogArticleWithBLOBs> serchArticle = articleService
				.serchArticle(querytitle);
		Page<BlogArticleWithBLOBs> searchPage = (Page<BlogArticleWithBLOBs>) session
				.getAttribute("searchPage");
		if (searchPage == null) {
			searchPage = new Page<BlogArticleWithBLOBs>();
			searchPage.setCurrentPage(pageNo);
			searchPage.setTotalRecord(serchArticle.size());
			int totalPage = serchArticle.size() / Page.FRONT_ARTICLE_RECROD;
			totalPage = (serchArticle.size() % Page.FRONT_ARTICLE_RECROD == 0 ? totalPage
					: totalPage + 1);
			searchPage.setTotalPage(totalPage);
		} else
			searchPage.setCurrentPage(pageNo);
		session.setAttribute("searchPage", searchPage);
		// 获得分页内容
		serchArticle = searchPage.getResultList(pageNo, serchArticle,
				Page.FRONT_ARTICLE_RECROD);
		model.addAttribute("searchPage", searchPage);
		model.addAttribute("serchArticle", serchArticle);
		return "SearchList";
	}
}
