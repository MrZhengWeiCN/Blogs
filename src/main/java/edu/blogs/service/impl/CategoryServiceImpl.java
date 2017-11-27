package edu.blogs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.blogs.common.BlogResult;
import edu.blogs.mapper.BlogCategoryMapper;
import edu.blogs.pojo.BlogCategory;
import edu.blogs.pojo.BlogCategoryExample;
import edu.blogs.pojo.BlogCategoryExample.Criteria;
import edu.blogs.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private BlogCategoryMapper categoryMapper;
	
	@Override
	public List<BlogCategory> findAll() {
		BlogCategoryExample example = new BlogCategoryExample();
		Criteria createCriteria = example.createCriteria();
		List<BlogCategory> list = categoryMapper.selectByExample(example);
		return list;
	}

	//分类表的
	@Override
	public BlogResult add(BlogCategory category) {
		//补全属性
		String cate = category.getCategory();
		BlogCategoryExample example = new BlogCategoryExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andCategoryEqualTo(cate);
		List<BlogCategory> cateList = categoryMapper.selectByExample(example );
		if(cateList!=null&&cateList.size()>0){
			return BlogResult.build(500, "分类已存在，请勿重复添加！");
		}
		category.setTotal(0);
		try {
			categoryMapper.insert(category);
			return BlogResult.ok();
		} catch (Exception e) {
			return BlogResult.build(500, "新增分类失败，原因："+e.getMessage());
		}
	}

	@Override
	public BlogCategory findById(Integer id) {
		BlogCategory cate = categoryMapper.selectByPrimaryKey(id);
		return cate;
	}

	@Override
	public BlogCategory findByName(String category) {
		BlogCategoryExample example = new BlogCategoryExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andCategoryEqualTo(category);
		List<BlogCategory> categ = categoryMapper.selectByExample(example );
		return categ.get(0);
	}

	@Override
	public void update(BlogCategory cate)throws Exception {
		categoryMapper.updateByPrimaryKey(cate);
	}



}
