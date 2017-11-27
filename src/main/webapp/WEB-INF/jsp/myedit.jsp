<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>文章编写</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<form name="article" action="/article_add" method="post"  enctype="multipart/form-data">
		标题: <input type="text" name="title"><br> 
		分类:<select name="category">
		<c:forEach var="cate" items="${categoryList}">
			<option value="${cate.category}">${cate.category}</option>
		</c:forEach>
		</select><br>
		缩略图：<input type="file" name="imageEntity"><br>
		简介：<textarea rows="10" cols="100" name="introduction">写上文章的简介</textarea><br>
		内容:<textarea id="text-input" name="content" oninput="this.editor.update()"
              rows="40" cols="100">请在此写下你的文章</textarea>
     <h3>MarkDown编辑器预览界面</h3>         
    <div id="preview"> </div>
    <script src="/js/markdown.js"></script>
    <script>
      function Editor(input, preview) {
        this.update = function () {
          preview.innerHTML = markdown.toHTML(input.value);
        };
        input.editor = this;
        this.update();
      }
      var $ = function (id) { return document.getElementById(id); };
      new Editor($("text-input"), $("preview"));
    </script>
    <input type="submit" value="提交你的文章">
	</form>
</body>
</html>
