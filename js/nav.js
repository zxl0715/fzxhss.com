
/*导航nav.js begin*/
$(function ()
{
    $("#nav>ul>li").hover(function ()
    {
        $(this).addClass("sfhover");
        $("#nav ul ul").slideUp("fast");
        $(this).find("a:first").animate({ "top": "12px" }, "fast");
        $(this).find("span").animate({ "top": "-30px" }, "fast");
        if (!$(this).find("ul").is(":animated")) $(this).find("ul").slideDown("fast")
    },
	function ()
	{
	    $(this).removeClass("sfhover");
	    $(this).find("a:first").animate({ "top": "0px" }, "fast");
	    $(this).find("span").animate({ "top": "0px" }, "fast");
	    if (!$(this).find("ul").is(":animated")) $(this).find("ul").slideUp("fast");
	    $("#nav ul ul").slideUp("fast")
	})
});
/*导航nav.js End*/

/*QQ客服Begin*/
$(document).ready(function ()
{
    $("#floatShow").bind("click", function ()
    {
        $("#onlineService").animate({ width: "show", opacity: "show" }, "normal", function ()
        {
            $("#onlineService").show();
        });

        $("#floatShow").attr("style", "display:none");
        $("#floatHide").attr("style", "display:block");

        return false;
    });

    $("#floatHide").bind("click", function ()
    {
        $("#onlineService").animate({ width: "hide", opacity: "hide" }, "normal", function ()
        {
            $("#onlineService").hide();
        });
        $("#floatShow").attr("style", "display:block");
        $("#floatHide").attr("style", "display:none");
        return false;
    });

});
/*QQ客服End*/

// 设置为主页 
function SetHome(obj, vrl)
{
    try
    {
        obj.style.behavior = 'url(#default#homepage)';
        obj.setHomePage(vrl);
    }
    catch (e)
    {
        if (window.netscape)
        {
            try
            {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }
            catch (e)
            {
                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage', vrl);
        }
        else
        {
            alert("您的浏览器不支持，请按照下面步骤操作：1.打开浏览器设置。2.点击设置网页。3.输入：" + vrl + "点击确定。");
        }
    }
}
//加入收藏
function AddFavorite(sURL, sTitle)
{
    sURL = encodeURI(sURL);
    try
    {
        window.external.addFavorite(sURL, sTitle);
    } catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
        }
    }
}