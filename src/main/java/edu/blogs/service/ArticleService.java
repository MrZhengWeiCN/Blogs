package edu.blogs.service;

import java.util.List;

import edu.blogs.common.BlogResult;
import edu.blogs.pojo.BlogArticle;
import edu.blogs.pojo.BlogArticleWithBLOBs;
import edu.blogs.pojo.BlogUser;

public interface ArticleService {
	List<BlogArticleWithBLOBs> findArticles(BlogUser user);
	List<BlogArticleWithBLOBs> findArticles(String category);
	BlogResult findArticles(Integer id);
	BlogResult  realdelete(Long id);
	BlogResult add(BlogArticleWithBLOBs article);
	void update(BlogArticle bloBs);
	List<BlogArticleWithBLOBs> serchArticle(String queryTitle);
	List<BlogArticleWithBLOBs> findAll();
	BlogResult delete(Integer id);
	List<BlogArticle> findRecycle();
	BlogResult changeStatus(Integer id,Byte status);
	void updateArticle(Integer id,String introduction,String content)throws Exception;
}
