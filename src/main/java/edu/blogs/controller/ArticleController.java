package edu.blogs.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


import edu.blogs.common.BlogResult;
import edu.blogs.pojo.BlogArticle;
import edu.blogs.pojo.BlogArticleWithBLOBs;
import edu.blogs.pojo.BlogCategory;
import edu.blogs.pojo.BlogUser;
import edu.blogs.service.ArticleService;
import edu.blogs.service.CategoryService;

/**
 * 文章控制管理 增 删 改 查
 * 
 * @author Administrator
 * 
 */
@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private CategoryService categoryService;

	// 回收站删除文件
	@RequestMapping("/realdel/{id}")
	public String realdel(@PathVariable Long id, Model model) {
		BlogResult result = articleService.realdelete(id);
		if (result.getStatus() == 500) {
			model.addAttribute("error", result.getMsg());
			return "error";
		} else {
			model.addAttribute("backURL", "/recycle");
			return "success";
		}
	}
	
	//回收站的文章回复，status==1
	@RequestMapping("/returnTo/{id}")
	public String returnTo(@PathVariable Integer id,Model mode,String category){
		BlogResult result = articleService.changeStatus(id, (byte)1);
		if (result.getStatus() == 500) {
		    mode.addAttribute("error", result.getMsg());
			return "error";
		} else {
			BlogCategory cate = categoryService.findByName(category);
			//目录类别加1
			cate.setTotal(cate.getTotal()+1);
			try {
				categoryService.update(cate);
			} catch (Exception e) {
				mode.addAttribute("error", e.getMessage());
				return "error";
			}
			mode.addAttribute("message", "恢复成功！");
			mode.addAttribute("backURL", "/recycle");
			return "success";
		}
	}
	
	//文章列表删除文件，放入回收站，status==2.
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable Integer id,Model model,HttpServletRequest request){
		BlogResult result = articleService.delete(id);
		if(result.getStatus()==500){
			model.addAttribute("error", result.getMsg());
			model.addAttribute("backURL", "/user_login");
			return "error";
		}
		model.addAttribute("message", "文章删除成功，已放入回收站！");
		model.addAttribute("backURL", "/user_login");
		//将session缓存的内容删除
		HttpSession session = request.getSession();
		session.setAttribute("adminPage", null);
		return "success";
	}
	
	//文章发表页面
	@RequestMapping("/myedit")
	public String showPage( Model model) {
		List<BlogCategory> categoryList = categoryService.findAll();
		model.addAttribute("categoryList", categoryList);
		return "myedit";
	}

	// 文章发表 需要上传图片
	@RequestMapping("/article_add")
	public String add(@RequestParam("imageEntity") CommonsMultipartFile file,
			BlogArticleWithBLOBs article, Model model, HttpServletRequest request) {
		String imageURL = null;
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String realPath = request.getSession().getServletContext()
					.getRealPath("WEB-INF/images");
			File newFile = new File(realPath,filename);
			try {
				file.transferTo(newFile);
			} catch (IllegalStateException | IOException e) {
				model.addAttribute("error", "图片上传出错了");
				model.addAttribute("backURL", "/article_add");
				return "error";
			}
			imageURL = "/images"+"/"+filename;
		}
		//设置Uid
		BlogUser user = (BlogUser) request.getSession().getAttribute("user");
		article.setUserid(user.getId().intValue());
		//设置缩略图的URL
		article.setImage(imageURL);
		BlogResult result = articleService.add(article);
		if(result.getStatus()==500){
			model.addAttribute("error", "发表文章失败");
			model.addAttribute("backURL", "/article_add");
			return "error";
		}else {
			model.addAttribute("message", "文章发表成功！");
			model.addAttribute("backURL", "/user_login");
			return "success";
		}
	}


	//文章重新编辑页面跳转
	@RequestMapping("/reedit/{id}")
	public String reedit(@PathVariable Integer id,Model model){
		BlogResult result = articleService.findArticles(id);
		BlogArticle article = (BlogArticle) result.getData();
		model.addAttribute("article", article);
		return "reedit";
	}
	
	//文章重新编辑实现
	@RequestMapping("article_reedit")
	public String article_reedit(Model model,Integer id, String introduction, String content){
		try {
			articleService.updateArticle(id, introduction, content);
			model.addAttribute("message", "重新编辑成功!");
			model.addAttribute("backURL", "/user_login");
			return "success";
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			return "error";
		}
	}
	
	// 查询 根据分类查询，结果展示在前台和个人中心(暂时没有用到)
	@RequestMapping("/article_cate/{category}")
	public String findByCate(@PathVariable String category, Model model) {
		List<BlogArticleWithBLOBs> articles = articleService.findArticles(category);
		model.addAttribute("articles", articles);
		return "list";
	}
}
