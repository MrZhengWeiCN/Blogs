package edu.blogs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.blogs.pojo.BlogUser;

public class AuthorizationInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object Handler) throws Exception {
		
		//从request中取session取user
		HttpSession session = request.getSession();
		BlogUser user = (BlogUser) session.getAttribute("user");
		if(user!=null){
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(900);
			return true;
		}
		String path = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ "/login";
		response.sendRedirect(path);
		return false;
	}

}
