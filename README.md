<p>博客整体框架采用springmvc+spring+mybatis，并且使用了maven进行项目的管理，最后部署在阿里云上，前端页面参考了Tale和CSDN。</p>



<h2 id="项目简介">项目简介</h2>

<p>整个项目非常简单。 <br>
总共就涉及到三个表格： <br>
<img src="http://img.blog.csdn.net/20171128153303134?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" alt="这里写图片描述" title=""> <br>
Dao层的mapper文件使用逆向工程产生，免去了手写mapper.xml文件的烦恼，Service层基本上也是增删改查的业务逻辑，真个项目的JSP页面也非常简单，对于前段知识比较薄弱的同学完全没有问题。因此，此项目非常适合作为新手的入门项目。通过此项目可以学会如何用maven管理你的项目，熟悉SSM框架的整合。</p>

<h2 id="blog首页">Blog首页</h2>

<p><a href="http://120.79.38.132:8080/">点击这里跳转到博客首页</a></p>

<p><img src="http://img.blog.csdn.net/20171128150735653?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" alt="这里写图片描述" title=""></p>



<h2 id="某一个分类下的文章列表">某一个分类下的文章列表</h2>

<p><img src="http://img.blog.csdn.net/20171128151015253?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" alt="这里写图片描述" title=""></p>



<h2 id="文章内容页面">文章内容页面</h2>

<p><img src="http://img.blog.csdn.net/20171128151215987?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" alt="这里写图片描述" title=""></p>

<p>左上角文章搜索功能就不展示了。</p>



<h2 id="博客后台管理页面">博客后台管理页面</h2>

<p>首先需要登陆和注册 <br>
<img src="http://img.blog.csdn.net/20171128151512410?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" alt="这里写图片描述" title=""></p>

<p>登陆以后就是管理者个人中心，在这里可以对文章进行增删改查，以及对文章分类列表的管理，后台页面就使用了CSDN页面。电极头像以后跳转到博客首页。</p>

<p><img src="http://img.blog.csdn.net/20171128151802457?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" alt="这里写图片描述" title=""></p>

<p>删除会将文章放入回收站，回收站可以对文章进行恢复和彻底删除。</p>

<p><img src="http://img.blog.csdn.net/20171128152135930?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast" alt="这里写图片描述" title=""></p>

<p>此版本Blog为1.0版，只是用了最简单的SSM框架+Maven实现了博客的基本功能。在后续的版本中，我会加入Shiro安全框架和评论模块（评论模块对于小型博客来说我认为是可以取消的），以及美化后台UI(实在是太丑了！)，文章编辑界面加入markdow编辑器。</p>

<p>最后附上项目的github地址：<a href="https://github.com/MrZhengWeiCN/Blogs">https://github.com/MrZhengWeiCN/Blogs</a></p></div>

