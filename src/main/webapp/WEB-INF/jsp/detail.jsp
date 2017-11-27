<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- saved from url=(0033)https://tale.biezhi.me/article/13 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="keywords" content="${article.title }">
    <meta name="description" content="${article.title }">
    <link rel="shortcut icon" href="/image/博客.png">
    <link rel="apple-touch-icon" href="/image/apple-touch-icon.png">
    <title>${article.title }</title>
    <link href="/css/xcode.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>

    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>#instantclick{position:fixed;top:0;left:0;width:100%;pointer-events:none;z-index:2147483647;transition:opacity .25s .1s}.instantclick-bar{background:#29d;width:100%;margin-left:-100%;height:2px;transition:all .25s}</style></head>
<body gtools_scp_screen_capture_injected="true">
<!--[if lt IE 8]>
<div class="browsehappy" role="dialog">
    当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href="http://browsehappy.com/" target="_blank">升级你的浏览器</a>。
</div>
<![endif]-->
<header id="header" class="header bg-white animated headroom--not-bottom slideDown headroom--top">
    <div class="navbar-container">
        <a href="/" class="navbar-logo">
            <img src="/image/wxb主页.png" alt="Tale Blog">
        </a>
       <div class="navbar-menu">
       		<iframe frameborder="no" border="10" marginwidth="0" marginheight="0" width=298 height=52 src="//music.163.com/outchain/player?type=2&id=25650033&auto=1&height=32"></iframe>
            <div class="navbar-menu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="navbar-menu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="navbar-menu"><fmt:formatDate value="<%=new Date() %>" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            <div class="navbar-menu"><a href="/aboutme">&nbsp&nbsp&nbsp关于我&nbsp&nbsp&nbsp</a></div>
            <a href="javascript:void(0);">搜索</a>
        </div>
        <div class="navbar-search" onclick="">
            <span class="icon-search"></span>
            <form role="search" onsubmit="return false;">
                <span class="search-box">
                    <input type="text" id="search-inp" class="input" placeholder="搜索功能还未实现..." maxlength="30" autocomplete="off">
                </span>
            </form>
        </div>
        <div class="navbar-mobile-menu" onclick="">
            <span class="icon-menu cross"><span class="middle"></span></span>
                <li><a href="https://tale.biezhi.me/about">搜索</a></li>
            </ul>
        </div>
    </div>
</header>
<article class="main-content page-page" itemscope="" itemtype="http://schema.org/Article">
    <div class="post-header">
        <h1 class="post-title" itemprop="name headline">
            <a href="/article/${article.id}">${article.title }</a>
        </h1>
        <div class="post-data">
            <time datetime="2017-02-24" itemprop="datePublished">发布于&nbsp;&nbsp;<fmt:formatDate value="${article.createdate }" pattern="yyyy-MM-dd hh:mm:ss"/>&nbsp;&nbsp;</time>
            / <%-- <a href="/cat_article/${article.category}"> --%><%-- &nbsp;&nbsp;${article.category}&nbsp;&nbsp; --%><%-- </a> / <a href="https://tale.biezhi.me/article/13#comments">&nbsp;&nbsp;${article.readed}评论&nbsp;&nbsp;</a> --%> /
            &nbsp;&nbsp;${article.readed}浏览
        </div>
    </div>
    <div id="post-content" class="post-content" itemprop="articleBody">
        <p class="post-tags"><a href="/cat_article/${cateId}">${article.category}</a></p>
        <h3 id="directory0135095502823684651">${article.title}</h3>
		<p>${article.content}</p>

        <p class="post-info"><br><strong>本站文章除注明转载/出处外，均为本站原创或翻译，转载前请务必署名<br></strong>
        </p>
    </div>
</article>
<div id="post-bottom-bar" class="post-bottom-bar">
    <div class="bottom-bar-inner">
    <div class="bottom-bar-items social-share left">
            <span class="bottom-bar-item">Share : </span>
            <span class="bottom-bar-item bottom-bar-facebook"><a href="https://www.facebook.com/sharer/sharer.php?u=<%=basePath%>article/${article.id}" target="_blank" title="${article.title}" rel="nofollow">facebook</a></span>
            <span class="bottom-bar-item bottom-bar-twitter"><a href="https://twitter.com/intent/tweet?url=<%=basePath%>article/${article.id}&text=${article.title}" target="_blank" title="${article.title}" rel="nofollow">Twitter</a></span>
            <span class="bottom-bar-item bottom-bar-weibo"><a href="http://service.weibo.com/share/share.php?url=<%=basePath%>article/${article.id}&amp;title=${article.title}" target="_blank" title="${article.title}" rel="nofollow">Weibo</a></span>
            <span class="bottom-bar-item bottom-bar-qrcode"><a href="//pan.baidu.com/share/qrcode?w=300&amp;h=300&amp;url=<%=basePath%>article/${article.id}" target="_blank" rel="nofollow">QRcode</a></span>
        </div>
        <div class="bottom-bar-items right">
            <span class="bottom-bar-item"><a href="/article/${article.id-1>0?article.id-1:1}" title="上一篇">←</a></span>
            <span class="bottom-bar-item"><a href="/article/${article.id+1}" title="下一篇">→</a></span>
            <span class="bottom-bar-item"><a href="#footer" title="回到底部">↓</a></span>
            <span class="bottom-bar-item"><a href="#" title="回到顶部">↑</a></span>
        </div>
    </div>
</div>
<script type="text/javascript">
    (function () {
        window.TaleComment = {
            reply: function (coid) {
                $('#comment-form input[name=coid]').val(coid);
                $("html,body").animate({scrollTop: $('div.comment-container').offset().top}, 500);
                $('#comment-form #textarea').focus();
            },
            subComment: function () {
                $.ajax({
                    type: 'post',
                    url: '/comment',
                    data: $('#comment-form').serialize(),
                    async: false,
                    dataType: 'json',
                    success: function (result) {
                        $('#comment-form input[name=coid]').val('');
                        if (result && result.success) {
                            window.location.reload();
                        } else {
                            if (result.msg) {
                                alert(result.msg);
                                window.location.reload();
                            }
                        }
                    }
                });
                return false;
            }
        };
    })();

    function getCommentCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg))
            return unescape(decodeURI(arr[2]));
        else
            return null;
    }

    function addCommentInputValue() {
        document.getElementById('author').value = getCommentCookie('tale_remember_author');
        document.getElementById('mail').value = getCommentCookie('tale_remember_mail');
        document.getElementById('url').value = getCommentCookie('tale_remember_url');
    }

    addCommentInputValue();
</script>
<footer id="footer" class="footer bg-white">
  <div class="footer-social">
    <div class="footer-container clearfix">
      <div class="social-list">
        <footer id="footer2" class="footer bg-white">
          <div class="footer-meta">
            <div class="footer-container">
              <div class="meta-item meta-copyright">
                <div class="meta-copyright-info">  <a href="/" class="info-logo">
                        <img src="/image/study.png" alt="Tale Blog">
                    </a>
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
                <li>
                    <a href="/article/${rencent.id}">${rencent.title}</a>
                </li>
                </c:forEach>
            </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
  </div>
</footer>
<div id="directory-content" class="directory-content">
  <div id="directory"><ul><li><a href="https://tale.biezhi.me/article/13#directory0135095502823684651"><!-- 1 2014年总结 --></a></li><li><a href="https://tale.biezhi.me/article/13#directory0135095502823684652"><!-- 2 2015年展望 --></a></li></ul></div>
</div>
<script>
    $('#directory').html('');
    var postDirectoryBuild = function() {
        var postChildren = function children(childNodes, reg) {
                var result = [],
                    isReg = typeof reg === 'object',
                    isStr = typeof reg === 'string',
                    node, i, len;
                for (i = 0, len = childNodes.length; i < len; i++) {
                    node = childNodes[i];
                    if ((node.nodeType === 1 || node.nodeType === 9) &&
                        (!reg ||
                        isReg && reg.test(node.tagName.toLowerCase()) ||
                        isStr && node.tagName.toLowerCase() === reg)) {
                        result.push(node);
                    }
                }
                return result;
            },
            createPostDirectory = function(article, directory, isDirNum) {
                var contentArr = [],
                    titleId = [],
                    levelArr, root, level,
                    currentList, list, li, link, i, len;
                levelArr = (function(article, contentArr, titleId) {
                    var titleElem = postChildren(article.childNodes, /^h\d$/),
                        levelArr = [],
                        lastNum = 1,
                        lastRevNum = 1,
                        count = 0,
                        guid = 1,
                        id = 'directory' + (Math.random() + '').replace(/\D/, ''),
                        lastRevNum, num, elem;
                    while (titleElem.length) {
                        elem = titleElem.shift();
                        contentArr.push(elem.innerHTML);
                        num = +elem.tagName.match(/\d/)[0];
                        if (num > lastNum) {
                            levelArr.push(1);
                            lastRevNum += 1;
                        } else if (num === lastRevNum ||
                            num > lastRevNum && num <= lastNum) {
                            levelArr.push(0);
                            lastRevNum = lastRevNum;
                        } else if (num < lastRevNum) {
                            levelArr.push(num - lastRevNum);
                            lastRevNum = num;
                        }
                        count += levelArr[levelArr.length - 1];
                        lastNum = num;
                        elem.id = elem.id || (id + guid++);
                        titleId.push(elem.id);
                    }
                    if (count !== 0 && levelArr[0] === 1) levelArr[0] = 0;

                    return levelArr;
                })(article, contentArr, titleId);
                currentList = root = document.createElement('ul');
                dirNum = [0];
                for (i = 0, len = levelArr.length; i < len; i++) {
                    level = levelArr[i];
                    if (level === 1) {
                        list = document.createElement('ul');
                        if (!currentList.lastElementChild) {
                            currentList.appendChild(document.createElement('li'));
                        }
                        currentList.lastElementChild.appendChild(list);
                        currentList = list;
                        dirNum.push(0);
                    } else if (level < 0) {
                        level *= 2;
                        while (level++) {
                            if (level % 2) dirNum.pop();
                            currentList = currentList.parentNode;
                        }
                    }
                    dirNum[dirNum.length - 1]++;
                    li = document.createElement('li');
                    link = document.createElement('a');
                    link.href = '#' + titleId[i];
                    link.innerHTML = !isDirNum ? contentArr[i] :
                        dirNum.join('.') + ' ' + contentArr[i] ;
                    li.appendChild(link);
                    currentList.appendChild(li);
                }
                directory.appendChild(root);
            };
        createPostDirectory(document.getElementById('post-content'),document.getElementById('directory'), true);
    };
    postDirectoryBuild();
</script>
<script src="/js/headroom.min.js"></script>
<script src="/js/highlight.min.js"></script>
<script src="/js/instantclick.min.js"></script>
<script type="text/javascript">
        var postDirectory = new Headroom(document.getElementById("directory-content"), {
            tolerance: 0,
            offset : 100,
            classes: {
                initial: "initial",
                pinned: "pinned",
                unpinned: "unpinned"
            }
        });
    var header = new Headroom(document.getElementById("header"), {
        tolerance: 10,
        offset : 80,
        classes: {
            initial: "animated",
            pinned: "slideDown",
            unpinned: "slideUp"
        }
    });
    header.init();
    $('#search-inp').keypress(function (e) {
        var key = e.which; //e.which是按键的值
        if (key == 13) {
            var q = $(this).val();
            if (q && q != '') {
                window.location.href = '/search/' + q;
            }
        }
    });
</script>
<script data-no-instant="">
    InstantClick.on('change', function (isInitialLoad) {
        var blocks = document.querySelectorAll('pre code');
        for (var i = 0; i < blocks.length; i++) {
            hljs.highlightBlock(blocks[i]);
        }
        if (isInitialLoad === false) {
            if (typeof ga !== 'undefined') ga('send', 'pageview', location.pathname + location.search);
        }
    });
    InstantClick.init('mousedown');
</script>

</body></html>