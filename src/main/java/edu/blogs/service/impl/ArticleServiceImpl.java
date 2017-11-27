package edu.blogs.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.blogs.common.BlogResult;
import edu.blogs.mapper.BlogArticleMapper;
import edu.blogs.mapper.BlogCategoryMapper;
import edu.blogs.pojo.BlogArticle;
import edu.blogs.pojo.BlogArticleExample;
import edu.blogs.pojo.BlogArticleExample.Criteria;
import edu.blogs.pojo.BlogArticleWithBLOBs;
import edu.blogs.pojo.BlogCategory;
import edu.blogs.pojo.BlogCategoryExample;
import edu.blogs.pojo.BlogUser;
import edu.blogs.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private BlogArticleMapper articleMapper;
	@Autowired
	private BlogCategoryMapper categoryMapper;

	//根据User查询所有文章
	@Override
	public List<BlogArticleWithBLOBs> findArticles(BlogUser user) {
		BlogArticleExample example = new BlogArticleExample();
		edu.blogs.pojo.BlogArticleExample.Criteria createCriteria = example
				.createCriteria();
		createCriteria.andUseridEqualTo(user.getId().intValue());
		createCriteria.andStatusEqualTo((byte)1);
		List<BlogArticleWithBLOBs> list = articleMapper
				.selectByExampleWithBLOBs(example);
		return list;
	}

	//查询分类下文章
	@Override
	public List<BlogArticleWithBLOBs> findArticles(String category) {
		BlogArticleExample example = new BlogArticleExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andCategoryEqualTo(category);
		createCriteria.andStatusEqualTo((byte)1);;
		List<BlogArticleWithBLOBs> articles = articleMapper
				.selectByExampleWithBLOBs(example);
		return articles;
	}

	@Override
	public BlogResult realdelete(Long id) {
		try {
			articleMapper.deleteByPrimaryKey(id.intValue());
			return BlogResult.ok();
		} catch (Exception e) {
			return BlogResult.build(500, e.getMessage() + "文章删除失败！");
		}
	}

	@Override
	public BlogResult add(BlogArticleWithBLOBs article) {
		// 补全属性id,readed，status，date
		article.setReaded(0);
		// 1表示正常
		article.setStatus((byte) 1);
		Date createDate = new Date();
		article.setCreatedate(createDate);
		// 分类表中增加文章的数量
		String category = article.getCategory();
		BlogCategoryExample example = new BlogCategoryExample();
		edu.blogs.pojo.BlogCategoryExample.Criteria createCriteria = example
				.createCriteria();
		createCriteria.andCategoryEqualTo(category);
		List<BlogCategory> cates = categoryMapper.selectByExample(example);
		BlogCategory cate = cates.get(0);
		cate.setTotal(cate.getTotal() + 1);
		try {
			articleMapper.insert(article);// 插入以后在增加数量
			categoryMapper.updateByPrimaryKey(cate);
			return BlogResult.ok();
		} catch (Exception e) {
			return BlogResult.build(500, e.getMessage());
		}
	}

	@Override
	public BlogResult findArticles(Integer id) {
		try {
			BlogArticleWithBLOBs article = articleMapper.selectByPrimaryKey(id);
			return BlogResult.ok(article);
		} catch (Exception e) {
			return BlogResult.build(500, "你所要浏览的文章飞走啦！");
		}
	}

	// 修改阅读数量
	@Override
	public void update(BlogArticle bloBs) {
		articleMapper.updateByPrimaryKey(bloBs);
	}

	//根据文章题目搜索文章，后期可以使用solr代替
	@Override
	public List<BlogArticleWithBLOBs> serchArticle(String queryTitle) {
		BlogArticleExample example = new BlogArticleExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andStatusEqualTo((byte)1);
		createCriteria.andTitleLike("%"+queryTitle+"%");
		List<BlogArticleWithBLOBs> serchArticle = articleMapper
				.selectByExampleWithBLOBs(example);
		return serchArticle;
	}

	//找出所有的文章
	@Override
	public List<BlogArticleWithBLOBs> findAll() {
		BlogArticleExample example = new BlogArticleExample();
		Criteria createCriteria = example .createCriteria();
		createCriteria.andStatusEqualTo((byte)1);
		List<BlogArticleWithBLOBs> result = articleMapper.selectByExampleWithBLOBs(example);
		return result;
	}

	//放入回收站
	@Override
	public BlogResult delete(Integer id) {
		BlogArticleWithBLOBs article = articleMapper.selectByPrimaryKey(id);
		article.setStatus((byte)2);
		String category = article.getCategory();
		BlogCategoryExample example = new BlogCategoryExample();
		edu.blogs.pojo.BlogCategoryExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andCategoryEqualTo(category);
		List<BlogCategory> cate = categoryMapper.selectByExample(example );
		Integer total = cate.get(0).getTotal();
		cate.get(0).setTotal(total-1);
		try {
			//类目下的文章减一
			categoryMapper.updateByPrimaryKey(cate.get(0));
			articleMapper.updateByPrimaryKeyWithBLOBs(article);
			return BlogResult.ok();
		} catch (Exception e) {
			return BlogResult.build(500, "删除失败"+e.getMessage());
		}
	}

	//查找回收站里面的文章
	@Override
	public List<BlogArticle> findRecycle() {
		BlogArticleExample example = new BlogArticleExample();
		Criteria createCriteria = example.createCriteria();
		//放入回收站的文章
		createCriteria.andStatusEqualTo((byte)2);
		List<BlogArticle> list = articleMapper.selectByExample(example );
		return list;
	}

	@Override
	public BlogResult changeStatus(Integer id, Byte status) {
		BlogArticleWithBLOBs article = articleMapper.selectByPrimaryKey(id);
		article.setStatus(status);
		try {
			articleMapper.updateByPrimaryKeyWithBLOBs(article);
			return BlogResult.ok();
		} catch (Exception e) {
			return BlogResult.build(500, e.getMessage());
		}
	}

	//编辑文章，只需要改变简介和内容
	@Override
	public void updateArticle(Integer id, String introduction, String content) throws Exception{
		BlogArticleWithBLOBs article = articleMapper.selectByPrimaryKey(id);
		article.setContent(content);
		article.setIntroduction(introduction);
		articleMapper.updateByPrimaryKeyWithBLOBs(article);
	}
}
