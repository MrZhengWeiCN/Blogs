package edu.blogs.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import edu.blogs.common.BlogResult;
import edu.blogs.pojo.BlogCategory;
import edu.blogs.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/category")
	public String showCate() {
		return "category_add";
	}

	//分类类增加
	@RequestMapping("/cate_add")
	public String cateAdd(
			@RequestParam("imageEntity") CommonsMultipartFile file,
			BlogCategory category, Model model, HttpServletRequest request) {
		String imageURL = null;
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			String realPath = request.getSession().getServletContext()
					.getRealPath("WEB-INF/images");
			File newFile = new File(realPath, filename);
			try {
				file.transferTo(newFile);
			} catch (IllegalStateException | IOException e) {
				model.addAttribute("error", "图片上传出错了");
				return "error";
			}
			imageURL = "/images" + "/" + filename;
		}
		category.setImage(imageURL);
		BlogResult result = categoryService.add(category);
		if (result.getStatus() == 500) {
			model.addAttribute("error", result.getMsg());
			model.addAttribute("backURL", "/cate_add");
			return "error";
		} else {
			model.addAttribute("message", "分类增加成功！");
			model.addAttribute("backURL", "/user_login");
			return "success";
		}
	}
}
