$(function () {
    var urlArr = csdn.urls;
    if (urlArr[4] && urlArr[4].indexOf("draft") > -1) {
        /*设置草稿箱TAB高亮*/
        $("#sel_div").hide();
        document.title = "草稿箱" + document.title;
    } else if (urlArr[4] && urlArr[4].indexOf("deleted") > -1) {
        /*设置回收站TAB高亮*/
        $("#sel_div").hide();
        document.title = "回收站" + document.title;
    } else {
        if (urlArr[2]) $("#selCat").val(urlArr[2]);
        if (urlArr[3]) $("#selType").val(urlArr[3]);
    }
    $("#selCat").change(chgSelect);
    $("#selType").change(chgSelect);

    $("#selBoleArticle").change(function () {
        boleSelect("selBoleArticle");
    });
    $("#selBole").change(function(){
        boleSelect("selBole");
    });

    var url = location.href;
    var urlarray = url.split('/');
    if (urlarray[4] == "-1")
    {
        $("#selBoleArticle").val(urlarray[5]);
    }
    if (urlarray[5] == "allcomment" || urlarray[5] == "comment" || urlarray[5] == "nocomment" || urlarray[5] == "nocheckcomment" || urlarray[5] == "checknotpasscomment")
    {
        $("#selBoleArticle").val("allcomment");
        $("#selBole").val(urlarray[5]);
        $("#selBolePanle").show();
    }
    if (url.indexOf("/postlist/all") > -1)
    {
        $("#selBoleArticle").val("allbole");
    }
    if (urlarray[5] == "mybole")
    {
        $("#selBolePanle").show();
    }

    
    $("#lstBox a[name=del]").each(function () {
        this.onclick = function () {
            return confirm("删除文章将不可恢复，是否继续？");
        };
    });
    rowHightlight();

    setTimeout(function () {
        var cats = '';
        $('#selCat>option').each(function (idx, item) {
            if (idx > 0) {
                cats += '<label><input type="checkbox" value="' + item.value + '"/>' + '<span id="other' + item.value + '"></span></label>';
            }
        });
        if (cats.length > 0) {
            $('#setcat_box').html(cats);
            $('#selCat>option').each(function (idx, item) {
                if (idx > 0) {
                   $("#other" + item.value).text(item.text.split(' (')[0]);
                }
            });
        } else {
            $(".btn_01").attr("value", "添加");
            $('#setcat_box').html("<p>您还没有分类，现在去添加吧！</p>");
        }
    }, 200);
    
});

function chgSelect() {
    window.location = "/postlist/" + $("#selCat").val() + "/" + $("#selType").val();
}
function boleSelect(divid) {
    var divvalue=$("#" + divid).val();
    if (divvalue != "") {
        if (divvalue == "allbole")
            window.location = "/postlist/all";
        else
            window.location = "/postlist/-1/" + $("#" + divid).val();
    }
}

function rowHightlight() {
    $("#lstBox tr").mouseover(function () {
        $(this).addClass("over");
    }).mouseout(function () {
        $(this).removeClass("over");
    });
}


var setcat_id = 0;
function setcat(e, id) {
	setcat_id = id;
	$.get('/article/getcategory?id=' + id, function (ret) {
		ret += ',';
		$('#setcat_box input').each(function () {
			if (ret.indexOf(',' + this.value + ',') > -1) {
				this.checked = true;
			} else {
				this.checked = false;
			}
		});
	});
	
	var pos = $(e).position();
	$('#setcat_div').css({ 'left': pos.left - 140 + 'px', 'top': pos.top + 20 + 'px' }).show(500);
	
	return false;
}
function save_cat() {
    if ($(".btn_01").attr("value") == "添加") {
        location.href = "http://write.blog.csdn.net/category";
    } else {
        var cats = [];
	    $('#setcat_box input:checked').each(function () {
		    cats.push(this.value);
	    });
	    $.get('/article/setcategory', { id: setcat_id, cats: cats.join(',') });
	    cancel_cat();
    }
}
function cancel_cat() {
	$('#setcat_div').hide();
}