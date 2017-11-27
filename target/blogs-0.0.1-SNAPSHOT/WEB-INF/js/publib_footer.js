;(function () {
protocol = location.protocol.substr(0, 4) === 'http' ? '' : 'http:';
document.write("<link rel='stylesheet' type='text/css' href='" + protocol + "//csdnimg.cn/pubfooter/css/pub_footer_2014.css' />");
document.write("<div class='pub_fo'>");
document.write("<div id='pub_footerall' class='pub_footer_new'>");
document.write("<dl>");
document.write("<dt></dt>");
document.write(" <dd class='foot_sub_menu'><a href='http://www.csdn.net/company/about.html' target='_blank'>公司简介</a><span>|</span><a href='http://www.csdn.net/company/recruit.html' target='_blank'>招贤纳士</a><span>|</span><a href='http://www.csdn.net/company/marketing.html' target='_blank'>广告服务</a><span>|</span><a href='http://www.csdn.net/company/contact.html' target='_blank'>联系方式</a><span>|</span><a href='http://www.csdn.net/company/statement.html' target='_blank'>版权声明</a><span>|</span><a href='http://www.csdn.net/company/layer.html' target='_blank'>法律顾问</a><span>|</span><a href='mailto:webmaster@csdn.net'>问题报告</a><span>|</span><a target='_blank' href='http://www.csdn.net/friendlink.html'>合作伙伴</a><span>|</span><a href='http://bbs.csdn.net/forums/Service' target='_blank'>论坛反馈</a></dd>");
document.write("<dd class='foot_contact'><a href='#' target='_blank' class='qq qqcustomer_s'>网站客服</a><a href='http://wpa.qq.com/msgrd?v=3&uin=2251809102&site=qq&menu=yes' target='_blank' class='qq'>杂志客服</a><a href='http://e.weibo.com/csdnsupport/profile' target='_blank' class='weibo'>微博客服</a><a href='mailto:webmaster@csdn.net' class='email' title='联系邮箱'>webmaster@csdn.net</a><span class='phone' title='服务热线'>400-660-0108</span><span class='interval'>|</span><span>北京创新乐知信息技术有限公司 版权所有</span><span class='interval'>|</span><span>江苏知之为计算机有限公司</span><span class='interval'>|</span><span>江苏乐知网络技术有限公司</span></dd>");
document.write("<dd  class='foot_copyright'><span>京&nbsp;ICP&nbsp;证&nbsp;09002463&nbsp;号</span><span class='interval'>|</span><span>Copyright &copy; 1999-2016, CSDN.NET, All Rights Reserved&nbsp;</span><a href='http://www.hd315.gov.cn/beian/view.asp?bianhao=010202001032100010' target='_blank'><img src='"+protocol+"//csdnimg.cn/pubfooter/images/gongshang_logos.gif' alt='GongshangLogo' alt='' title='' /></a></dd>");
document.write("</dl>");
document.write("</div>");
document.write("</div>");
document.write('<script id="noticeScript" type="text/javascript"  btnId="header_notice_num" wrapId="note1" count="5" subcount="5" src="' + protocol + '//csdnimg.cn/rabbit/notev2/js/notify.js?v=5.00.39"></script>');

//fixed chrome warning
/*var footer_con = '\<link rel="stylesheet" href="http://c.csdnimg.cn/pubfooter/css/pub_footer_2014.css" />\
        <div class="pub_fo">\
            <div id="pub_footerall" class="pub_footer_new">\
                <dl>\
                    <dt></dt>\
                    <dd class="foot_sub_menu">\
                        <a href="http://www.csdn.net/company/about.html" target="_blank">公司简介</a><span>|</span>\
                        <a href="http://www.csdn.net/company/recruit.html" target="_blank">招贤纳士</a><span>|</span>\
                        <a href="http://www.csdn.net/company/marketing.html" target="_blank">广告服务</a><span>|</span>\
                        <a href="http://www.csdn.net/company/contact.html" target="_blank">联系方式</a><span>|</span>\
                        <a href="http://www.csdn.net/company/statement.html" target="_blank">版权声明</a><span>|</span>\
                        <a href="http://www.csdn.net/company/layer.html" target="_blank">法律顾问</a><span>|</span>\
                        <a href="mailto:webmaster@csdn.net"">问题报告</a><span>|</span>\
                        <a target="_blank" href="http://www.csdn.net/friendlink.html">合作伙伴</a><span>|</span>\
                        <a href="http://bbs.csdn.net/forums/Service" target="_blank">论坛反馈</a>\
                    </dd>\
                    <dd class="foot_contact">\
                        <a href="javascript:void(0);" target="_blank" class="qq">网站客服</a>\
                        <a href="http://wpa.qq.com/msgrd?v=3&uin=2251809102&site=qq&menu=yes" target="_blank" class="qq">杂志客服</a>\
                        <a href="http://e.weibo.com/csdnsupport/profile" target="_blank" class="weibo">微博客服</a>\
                        <a href="mailto:webmaster@csdn.net" class="email" title="联系邮箱">webmaster@csdn.net</a>\
                        <span class="phone" title="服务热线">400-660-0108</span><span class="interval">|</span>\
                        <span>北京创新乐知信息技术有限公司 版权所有</span><span class="interval">|</span>\
                        <span>江苏知之为计算机有限公司</span><span class="interval">|</span>\
                        <span>江苏乐知网络技术有限公司</span>\
                    </dd>\
                    <dd class="foot_copyright">\
                        <span>京&nbsp;ICP&nbsp;证&nbsp;09002463&nbsp;号</span><span class="interval">|</span>\
                        <span>Copyright &copy; 1999-2017, CSDN.NET, All Rights Reserved&nbsp;</span>\
                        <a href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202001032100010" target="_blank">\
                            <img src="http://c.csdnimg.cn/pubfooter/images/gongshang_logos.gif" alt="GongshangLogo" alt="" title="" />\
                        </a>\
                    </dd>\
                </dl>\
            </div>\
        </div>';

    $(document.body).append($(footer_con));
    function load_notify(url) {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.id = "noticeScripts";
        script.btnId = "header_notice_num";
        script.wrapId = "note1";
        script.count = "5";
        script.subcount = "5";
        script.src = url;
        document.body.appendChild(script);
     }
     load_notify(location.protocol+"//csdnimg.cn/rabbit/notev2/js/notify.js?9d86d94");*/


var head = document.getElementsByTagName('head')[0]
	, s, ss = [
		protocol + '//csdnimg.cn/pubfooter/js/tracking.js?v=' + Math.random()
		//, protocol + '//csdnimg.cn/rabbit/tracking-ad/main.js?75eacd6'
		, protocol + '//csdnimg.cn/rabbit/exposure-click/main.js?20170802001'
	]
	;

for(var i = 0; i < ss.length; i ++){
	s = document.createElement('script')
	s.type = 'text/javascript';
	s.charset = 'utf-8';
	s.src = ss[i];
	head.insertBefore(s, null);
}
}());
// add QQ customer service
$(function(){
	$(".qqcustomer_s").click(function(event){
		var qqs = [2431299880, 3456678348, 3455921142];
		var qq = (new Date().getDay() == 0 || new Date().getDay() == 6) ? qqs[0] : qqs[Math.floor(Math.random() * qqs.length)];;
		$(this).attr('href','http://wpa.qq.com/msgrd?v=3&uin='+qq+'&site=qq&menu=yes');
	});
});