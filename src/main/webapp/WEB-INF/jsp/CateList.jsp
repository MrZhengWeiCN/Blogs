<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- saved from url=(0023)https://tale.biezhi.me/ -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Cache-Control" content="no-transform">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta name="keywords" content="博客系统，SSM框架">
<meta name="description" content="博客系统，SSM框架">
<link rel="shortcut icon" href="/image/博客.png">
<link rel="apple-touch-icon" href="/images/教育博客.png">
<title>博客首页</title>
<link href="/css/xcode.min.css" rel="stylesheet">
<link href="/css/style.min.css" rel="stylesheet">
<script src="/css/jquery.min.js"></script>

<!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
#instantclick {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	pointer-events: none;
	z-index: 2147483647;
	transition: opacity .25s .1s
}

.instantclick-bar {
	background: #29d;
	width: 100%;
	margin-left: -100%;
	height: 2px;
	transition: all .25s
}
</style>
</head>
<body class="bg-grey" gtools_scp_screen_capture_injected="true">
	<!--[if lt IE 8]>
<div class="browsehappy" role="dialog">
    当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href="http://browsehappy.com/" target="_blank">升级你的浏览器</a>。
</div>
<![endif]-->
	<header id="header"
		class="header bg-white animated headroom--not-bottom slideDown headroom--top">
		<div class="navbar-container">
			<a href="/" class="navbar-logo"> <img src="/image/wxb主页.png"
				alt="Tale Blog"> </a>
			<div class="navbar-menu">
				<fmt:formatDate value="<%=new Date() %>"
					pattern="yyyy-MM-dd HH:mm:ss" />
			</div>
			<div class="navbar-menu">
				<a href="/aboutme">&nbsp&nbsp&nbsp关于我&nbsp&nbsp&nbsp</a>
			</div>
			<div class="navbar-menu">搜索</div>
			<div class="navbar-search" onclick="">
				<span class="icon-search"></span>
				<form role="search" onsubmit="return false;">
					<span class="search-box"> <input type="text" id="search-inp"
						class="input" placeholder="搜索功能还未实现..." maxlength="30"
						autocomplete="off"> </span>
				</form>
			</div>
			<div class="navbar-mobile-menu" onclick="">
				<span class="icon-menu cross"><span class="middle"></span>
				</span>
				<!-- <ul>
                <li><a href="https://tale.biezhi.me/archives">归档</a></li>
                <li><a href="https://tale.biezhi.me/links">友链</a></li>
                <li><a href="https://tale.biezhi.me/about">关于</a></li>
            </ul> -->
			</div>
		</div>
	</header>
	<div class="main-content index-page clearfix">
		<div class="post-lists">
			<div class="post-lists-body">
				<c:forEach items="${cateList}" var="cate" varStatus="vs">
					<div class="post-list-item">
						<div class="post-list-item-container">
							<div class="item-thumb bg-deepgrey"
								style="background-image:url(${cate.image});"></div>
							<a href="/cat_article/${cate.id}">
								<div class="item-desc">
									<p>${cate.category}</p>
								</div> </a>
							<div class="item-slant reverse-slant bg-deepgrey"></div>
							<div class="item-slant"></div>
							<div class="item-label">
								<div class="item-title">
									<a href="/cat_article/${cate.id}">${cate.category}</a>
								</div>
								<div class="item-meta clearfix">
									<div class="item-meta-ico bg-ico-image"
										style="background: url(/image/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
									<div class="item-meta-cat">
										<a href="javascript:void(0);">
											<%-- ${cate.category}( --%>${cate.total}<!-- ) -->篇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="lists-navigator clearfix">
			<ol class="page-navigator">

				<li class="current">&nbsp;&nbsp;共${frontCatePage.totalPage }页</li>
				<li class="previous"><a
					href="/?page=${frontCatePage.currentPage<=1?1:frontCatePage.currentPage-1}">${frontCatePage.currentPage<=1?
						"&nbsp;":"前一页" }</a>
				</li>
				<li>&nbsp;&nbsp;当前第${frontCatePage.currentPage }页</li>

				<li class="next"><a href="/?page=${frontCatePage.currentPage>=frontCatePage.totalPage?frontCatePage.totalPage:frontArtPage.currentPage+1}">${frontCatePage.currentPage>=frontCatePage.totalPage?
						"&nbsp;":"下一页" }</a>
				</li>
			</ol>
		</div>
	</div>
	<footer id="footer" class="footer bg-white">
		<div class="footer-social"></div>
		<div class="footer-meta">
			<div class="footer-container">
				<div class="meta-item meta-copyright">
					<div class="meta-copyright-info">
						<a href="/" class="info-logo"> <img src="/image/study.png"
							alt="Tale Blog"> </a>
						<div class="info-text">
							<p>记录下学习生活中的点滴</p>
							<!-- <p>Powered by <a href="https://github.com/otale/tale" target="_blank" rel="nofollow">Tale</a>
                        </p>
                        <p>© 2017 <a href="https://github.com/biezhi">biezhi</a></p> -->
						</div>
					</div>
				</div>

				<div class="meta-item meta-posts">
					<h3 class="meta-title">最新文章</h3>
					<c:forEach var="rencent" items="${ sessionScope.recentArticles}">
						<li><a href="/article/${rencent.id}">${rencent.title}</a></li>
					</c:forEach>
				</div>
				
					<!-- <object width="260" height="90"
						data="http://music.163.com/style/swf/widget.swf?sid=19971812&type=0&auto=0&width=310&height=430"
						type="application/x-shockwave-flash"></object>
				 -->
			</div>
		</div>
	</footer>

	<script src="./Tale Blog_files/headroom.min.js"></script>
	<script src="/js/highlight.min.js"></script>
	<script src="/js/instantclick.min.js"></script>
	<script type="text/javascript">
		var header = new Headroom(document.getElementById("header"), {
			tolerance : 10,
			offset : 80,
			classes : {
				initial : "animated",
				pinned : "slideDown",
				unpinned : "slideUp"
			}
		});
		header.init();
		$('#search-inp').keypress(function(e) {
			/* var key = e.which; //e.which是按键的值
			if (key == 13) { */
				var q = $(this).val();
				if (q && q != '') {
					window.location.href = '/search/' + q;
				}
			/* } */
		});
	</script>
	<script data-no-instant="">
		InstantClick.on('change',
				function(isInitialLoad) {
					var blocks = document.querySelectorAll('pre code');
					for ( var i = 0; i < blocks.length; i++) {
						hljs.highlightBlock(blocks[i]);
					}
					if (isInitialLoad === false) {
						if (typeof ga !== 'undefined')
							ga('send', 'pageview', location.pathname
									+ location.search);
					}
				});
		InstantClick.init('mousedown');
	</script>

</body>
</html>