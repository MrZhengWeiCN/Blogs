<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0069)http://www.17sucai.com/preview/314507/2015-04-15/code/code/login.html -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
    <title>博客登陆</title>
    
    <script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script>
    <script src="/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" href="/css/easyui.css" type="text/css">
    <link rel="stylesheet" href="/css/icon.css" type="text/css">

    
    
    <style type="text/css">
		body
		{
			font: normal 14px/1.4 "Helvetica Neue","HelveticaNeue",Helvetica,Arial,sans-serif;
		}
		div
		{
			display:block;
		}
		a
		{
			text-decoration:none;
			opacity: 1;
			color: #fff;
		 }
		 input,button{ outline:none; }
		::-moz-focus-inner{border:0px;}   /*去除按钮点击时出现的虚线边框*/
        .login_bg
        {
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			background-image:url(/image/1.jpg);
			background-size: cover;
        }
		.login_header {
			position:absolute;
			top:0;
			left:0;
			right:0;
			}
		.container {
			position:relative;
			top:50%;
			margin: 0 auto;
			width: 260px;
			}
		#logo
		{
			display: block;
			text-align: center;
			font-weight: bold;
			font-size: 50px;
			color: white;
			height: 100%;
		}
		#subheading 
		{
		  position: relative;
		  width: 517px;
		  left: 50%;
		  margin: 10px 0 16px -258px;
		  font-size: 15px;
		  font-weight: bold;
		  color: #fff;
		  text-align: center;
		}
		.signup_forms
		{
			width:260px;
			height:145px;	
		}
		.signup_forms_container
		{
			width:260px;
			
			overflow: hidden;
			background: #fff;
			border-radius:3px;	
		}
		.form_user,.form_password
		{
			width:260px;
			height:45px;
			margin:0px;
        	padding:0px;
			border:0px;	
		}
		.form_password{border-top: 1px solid #e3e3e3;}
		.signup_forms input
		{
			padding: 11px 10px 11px 13px;
			width: 100%;
			margin:0px;
        	background: 0;
			font: 16px/1.4 "Helvetica Neue","HelveticaNeue",Helvetica,Arial,sans-serif;
			border:0px;	
		}
		#signup_forms_submit{
		  margin-top:8px;		
		  width:260px;
		  height:45px;
		  background:#529ECC;
		  border:0px;
		  border-radius:3px;
		  cursor:pointer;       <!--CSS属性设置鼠标为手型--> 
		 }
		 #signup_forms_submit span
		 {
			 color: #fff;
			 font: "Helvetica Neue",Arial,Helvetica,sans-serif;
			 font-size:16px;
		}
		.footer
		 {
			position: fixed;
			top: auto;
			right: 0;
			bottom: 0;
			left: 0;
		 }
		 .footer_signup_link
		 {
			 position: absolute;
			 width:141px;
			 height:78px;
			 bottom: 0;
			 padding: 0 20px;
			 margin: 0 0 13px 0;
			 line-height: 25px;
			 text-align: center;
			 opacity: 1;
			 color: #fff;
		 }
		 .signup_link
		 {
			  display: block;
			  height: 45px;
			  padding: 0 10px;
			  margin: 0 0 8px 0;
			  font-size: 16px;
			  font-weight: bold;
			  line-height: 45px;
			  border: 0;
			  border-radius: 2px;
			  color: #fff;
              background: rgba(255,255,255,0.33);
		}
		.link
		{
			font-size: 14px;
			padding-right: 5px;
			margin-right: 12px;
			color: #fff;
		}
		.design_show
		{
			position: fixed;
			bottom: 0;
			right: 0;
			padding: 0 12px;
			margin: 0 0 13px 0;
			line-height: 25px;
		}
		.designer_info
		{
			position: relative;
			color: #FFFFFF;
		}
		#face
		{
			margin: 0 0 0 10px;
			vertical-align: middle;
			border-radius:20px;
			padding: 0;
			height: 24px;
			width: 24px;
		}
    </style>
	<script type="text/javascript">
		
		$(function(){
			$("button").click(function(){
			if($("#signup_email").val()==""||$("#signup_password").val()=="")
			{
				$.messager.alert('警告','账号和密码不能为空!');
				 
			}
			else
			{
				$("#sign_form").submit();
			}
		});
	});
    </script>
</head>
<body>
    <div id="login_bg" class="login_bg" style="background-image:url(images/u3.jpg);"></div>
    <div class="login_header">
    	<span></span>
    </div>
    
    <div class="container">
    	<div class="form_header">
        	<h1 id="logo">Blogs</h1>
			<h2 id="subheading">畅你所想</h2>
        </div>
        <div class="signup_forms">
            	<div id="signup_forms_container" class="signup_forms_container">
                    	<form class="signup_form_form" id="sign_form" method="post" action="/user_login">
                        	<div class="signup_account" id="signup_account">
                            	<div class="form_user">	
        							<input type="text" name="email" placeholder="邮箱" id="signup_email" value=${email }>
                                </div>
                                <div class="form_password">
           							<input type="password" name="password" placeholder="密码" id="signup_password" value=${password }>
        						</div>
                            </div>
                            
               					 <button type="submit" id="signup_forms_submit" ><span><strong>立即登陆</strong></span></button>
                            <div class="error">
                            	<span><strong>${error}</strong></span>
                            </div>
                            </form></div>
            				</div>
                         
                  		   
    			</div>
    	
    <div class="footer">
    	<div class="footer_signup_link">
        	<a class="signup_link" href="http://localhost:8081/regist">没有账号？</a>
           <!--  <a href="https://www.baidu.com/" target="_blank" class="link unnamed_1">Patent</a> -->
            <a href="http://www.17sucai.com/preview/314507/2015-04-15/code/code/login.html#" target="_blank" class="link unnamed_2"><strong>关于我</strong></a>
        </div>
        <div class="design_show">
        	<div class="designer_info">
            	<a href="http://www.17sucai.com/preview/314507/2015-04-15/code/code/login.html#">北京时间：<strong><fmt:formatDate value="<%=new Date() %>" pattern="yyyy-MM-dd hh:mm:ss"/></strong></a>
                <a href="http://www.17sucai.com/preview/314507/2015-04-15/code/code/login.html#" target="_blank" class="face"><img id="face" src="/image/face.jpg" alt="designed by RayZhang"></a>
            </div>
        </div>
    </div>

</body></html>