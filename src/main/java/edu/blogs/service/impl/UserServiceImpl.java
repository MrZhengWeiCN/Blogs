package edu.blogs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.blogs.common.BlogResult;
import edu.blogs.mapper.BlogArticleMapper;
import edu.blogs.mapper.BlogUserMapper;
import edu.blogs.pojo.BlogArticle;
import edu.blogs.pojo.BlogArticleExample;
import edu.blogs.pojo.BlogUser;
import edu.blogs.pojo.BlogUserExample;
import edu.blogs.pojo.BlogUserExample.Criteria;
import edu.blogs.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private BlogUserMapper userMapper;
	@Autowired
	private BlogArticleMapper articleMapper;
	
	@Override
	public BlogResult regist(BlogUser user) {
		String email = user.getEmail();
		String username = user.getUsername();
		BlogUserExample example = new BlogUserExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmailEqualTo(email);
		List<BlogUser> list = userMapper.selectByExample(example);
		if(list.size()>0){
			return BlogResult.build(500, "邮箱已经被注册");
		}
		createCriteria.andUsernameEqualTo(username);
		list = userMapper.selectByExample(example);
		if(list.size()>0){
			return BlogResult.build(500, "用户名已经被注册");
		}
		//插入表格
		userMapper.insert(user);
		return BlogResult.ok();
	}

	//用户登陆
	@Override
	public BlogResult login(String email, String password) {
		BlogUserExample example = new BlogUserExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmailEqualTo(email);
		List<BlogUser> users = userMapper.selectByExample(example );
		if(users==null && users.size()==0){
			return BlogResult.build(500, "邮箱或密码错误");
		}
		BlogUser user = users.get(0);
		if(!user.getPassword().equals(password))
			return BlogResult.build(500, "邮箱或密码错误");
		return BlogResult.ok(user);
	}

}
