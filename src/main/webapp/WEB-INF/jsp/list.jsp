<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- saved from url=(0035)http://write.blog.csdn.net/postlist -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="shortcut icon" href="/image/博客.png">
<script src="/js/hm.js"></script>
<script type="text/javascript" src="/js/tingyun-rum.js"></script>
<!-- <script type="text/javascript">
		var protocol = window.location.protocol;
		document.write('<script type="text/javascript" src="' + protocol
				+ '//csdnimg.cn/pubfooter/js/repoAddr2.js?v=' + Math.random()
				+ '"></' + 'script>');
	</script> -->
<script type="text/javascript" src="/js/repoAddr2.js"></script>

<title>博客后台</title>

<link type="text/css" rel="Stylesheet" href="/css/main.css">
<!--new top-->
<link rel="stylesheet" href="/css/index.css">
<!--new top-->

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery-version.js"></script>
<script type="text/javascript" src="/js/csdn.js"></script>
<script type="text/javascript" src="/js/master.js"></script>
<script type="text/javascript">
	var statichost = "http://static.blog.csdn.net";
</script>
<script type="text/javascript">
	function logout(){
		if(confirm("确定退出吗？")){
			location.href="/logout";
		}
	}
</script>


<script type="text/javascript" charset="utf-8" src="/js/tracking.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/main.js"></script>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body>
	<!-- <div class="csdn-toolbar csdn-toolbar-skin-black ">
		<div class="container row center-block ">
			<div class="col-md-3 pull-left logo clearfix">
				<a href="http://www.csdn.net/?ref=toolbar" title="CSDN首页"
					target="_blank" class="icon"></a><a title="频道首页"
					href="http://blog.csdn.net/?ref=toolbar_logo" class="img blog-icon"></a>
			</div>
		</div>
	</div>
	new top
	<script id="toolbar-tpl-scriptId" fixed="true" prod="blog" skin="black"
		domain="http://blog.csdn.net" src="/js/html.js"
		type="text/javascript"></script> -->
	<!--new top-->
	<div id="wrap">

		<div class="head">

			<div class="user_info">
				<dl>
					<dt>
						<a href="/"><img
							src="/image/3_qq_37169817.jpg" alt="qq_37169817"> </a>
					</dt>
					<dd>
						<ul>
							<li class="user_name">
							<a href="/" class="user_name">${user.username }的博客</a>
							<button class="logout" onclick="logout()">安全退出</button>
							</li>
						</ul>
					</dd>
				</dl>
			</div>

			<div style="float:right; margin-top:20px; color:Red;"></div>
		</div>


		<div class="tabs_header">
			<ul id="ul_tab" class="tabs" style="width:120%">
				<li class="active"><a
					href="http://write.blog.csdn.net/postlist"><span>文章管理</span> </a>
				</li>
				<li><a href="/category"><span>类别增加</span> </a>
				</li>
				<!-- <li><a href="http://write.blog.csdn.net/feedback"><span>评论管理</span>
				</a>
				</li>
				<li><a href="http://write.blog.csdn.net/postlist/0/all/draft"><span>草稿箱</span>
				</a>
				</li> -->
				<li><a href="/recycle"><span>回收站</span>
				</a>
				</li>

				<li id="btn_postedit" class="write"><a
					href="/myedit"><strong>写新文章</strong>
				</a></li>
			</ul>
		</div>
		<script type="text/javascript">
			setTab();
		</script>


		<script type="text/javascript" src="/js/postlist.js"></script>

		<div id="sel_div" class="h_status">
			类别：<select id="selectcat" onchange="self.location.href=options[selectedIndex].value">
			<option value="/user_login">全部&nbsp;&nbsp;&nbsp;&nbsp;</option>
				<c:forEach var="cate" items="${categoryList}">
					<option value="/adminCatArt/${cate.category}">${cate.category}(${cate.total})</option>
				</c:forEach>
			<option value="/user_login">所有文章&nbsp;&nbsp;&nbsp;&nbsp;</option>

			</select> 
			<!-- 类型：<select id="selType"><option value="all">全部&nbsp;&nbsp;&nbsp;&nbsp;</option>
				<option value="original">原创</option>
				<option value="repost">转载</option>
				<option value="translated">翻译</option>
			</select> -->
			&nbsp; <!-- 属性:<select id="selBoleArticle"><option value="">请选择&nbsp;&nbsp;&nbsp;&nbsp;</option>
				<option value="allbole">全部&nbsp;&nbsp;&nbsp;&nbsp;</option>
				<option value="allcomment">@博乐文章</option>
				<option value="otherbole">其他文章</option>
			</select> -->
			&nbsp; <span id="selBolePanle" style="display:none">博乐:
			<select
				id="selBole"><option value="allcomment">全部&nbsp;&nbsp;&nbsp;&nbsp;</option>
					<option value="nocheckcomment">未审核</option>
					<option value="checknotpasscomment">审核未通过</option>
					<option value="comment">已点评</option>
					<option value="nocomment">未点评</option>
			</select>&nbsp;</span>

		</div>
		<table id="lstBox" cellspacing="0">
			<tbody>
				<tr>
					<th class="tdleft">标题</th>
					<th style="width:50px;">&nbsp</th>
					<th style="width:50px;">状态</th>
					<th style="width:50px;">阅读</th>
					<th style="width:50px;">类别</th>
					<th style="width:70px;">评论权限</th>
					<th style="width:170px;">操作</th>
				</tr>
				<c:forEach items="${articles}" var="article" varStatus="vs">
					<tr class="">
						<td class="tdleft"><a href="/article/${article.id}"
							target="_blank">${article.title }</a><span class="gray">(<fmt:formatDate
									value="${article.createdate }" pattern="yyyy-MM-dd" />)</span>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>${article.status==1?"正常":"回收站"}</td>
						<td>${article.readed }</td>
						<td>${article.category }</td>
						<td><a
							href="javascript:void(0)"
							class="lock">禁止评论</a>
						</td>
						<td><a href="/reedit/${article.id}">编辑</a>|
							<a href="/delete/${article.id }" name="del">删除</a> | <a
							href="javascript:void(0);"
							onclick="javascript:return setcat(this,78428949);" class="cat">分类</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="page_nav">
			<span> 共${adminPage.totalRecord }条
				&nbsp;&nbsp;共${adminPage.totalPage }页&nbsp;&nbsp;</span>
				<span><a
					href="/${url }?page=${adminPage.currentPage<=1?1:adminPage.currentPage-1}">${adminPage.currentPage<=1?
						"首页":"上一页" }</a>
			</span><strong>当前第${adminPage.currentPage }页</strong>
			<span><a href="/${url }?page=${adminPage.currentPage>=adminPage.totalPage?adminPage.totalPage:adminPage.currentPage+1}">${adminPage.currentPage>=adminPage.totalPage?
					"末页":"下一页" }</a>
			</span>
		</div>

		<!-- <div id="setcat_div" style="display:none;">
			<div class="frame">
				<input name="close" type="button" class="close"
					onclick="cancel_cat()">
				<div id="setcat_box">
					<label><input type="checkbox" value="7220371"><span
						id="other7220371">JAVA(13)</span> </label><label><input
						type="checkbox" value="7220372"><span id="other7220372">JAVA并发(8)</span>
					</label><label><input type="checkbox" value="7220375"><span
						id="other7220375">JAVAEE(2)</span> </label><label><input
						type="checkbox" value="7228893"><span id="other7228893">JVM(5)</span>
					</label><label><input type="checkbox" value="7262296"><span
						id="other7262296">计算机网络基础(3)</span> </label><label><input
						type="checkbox" value="7265677"><span id="other7265677">数据库(3)</span>
					</label>
				</div>
				<p style="text-align:center;">
					<input type="button" value="确定" class="btn_01" onclick="save_cat()">
				</p>
			</div>
		</div> -->

		<script type="text/javascript">
			$(function() {
				$("#lstBox tr").each(function() {
					var tr = $(this);
					if (tr.text().indexOf("待审核") > -1) {
						var tds = $(tr.find("td")[5]);
						var a = $(tds.find("a"));
						a.each(function() {
							if ($(this).text().indexOf("置顶") > -1) {
								$(this).remove();
								tds.html(tds.html().replace("|  |", "|"));
							}
						});
					}
				});
			});
		</script>

	</div>


	<script type="text/javascript" src="/js/cnick.js"></script>

	<script type="text/javascript">
		document
				.write('<script type="text/javascript" src="http://c.csdnimg.cn/pubfooter/js/publib_footer.js?'
						+ Math.floor(new Date() / 120000).toString(36)
						+ '="></' + 'script>');
	</script>
	<link rel="stylesheet" type="text/css" href="/js/pub_footer_2014.css">
	<!-- <div class="pub_fo">
		<div id="pub_footerall" class="pub_footer_new">
			<dl>
				<dt>-----------------------------------------不过为了自己的热爱罢了！</dt>
				
			</dl>
		</div>
	</div> -->
	<div id="note1" class="csdn_note"
		style="display:none; position:absolute; z-index:9999; width:440px">
		<span class="notice_top_arrow"><span class="inner"></span> </span>
		<div class="box"></div>
	</div>
	<div class="csdn_notice_tip"
		style="position: absolute; z-index: 9990; width: 170px; left: -72px; top: 18px; display: block;">
		<a href="javascript:void 0" class="close2"></a>
	</div>
	<script id="noticeScript" type="text/javascript"
		btnid="header_notice_num" wrapid="note1" count="5" subcount="5"
		src="/js/notify.js"></script>
	<!--new top-->
</body>
</html>