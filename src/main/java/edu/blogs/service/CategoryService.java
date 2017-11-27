package edu.blogs.service;

import java.util.List;

import edu.blogs.common.BlogResult;
import edu.blogs.pojo.BlogArticleWithBLOBs;
import edu.blogs.pojo.BlogCategory;

public interface CategoryService {

	List<BlogCategory> findAll();

	BlogResult add(BlogCategory category);
	
	BlogCategory findById(Integer id);

	BlogCategory findByName(String category);

	void update(BlogCategory cate)throws Exception;
}
