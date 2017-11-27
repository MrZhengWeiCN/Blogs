package edu.blogs.service;


import edu.blogs.common.BlogResult;
import edu.blogs.pojo.BlogUser;

public interface UserService {

	BlogResult regist(BlogUser user);
	BlogResult login(String email,String password);
	
}
