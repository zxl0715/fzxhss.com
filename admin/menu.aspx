<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="admin_menu" %>

<%@ Import Namespace="wzwebsite" %>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理菜单</title>
    <link href="sdmenu/menucss.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            background: #009ace;
            margin: 0px;
            font: normal 12px 宋体;
            scrollbar-face-color: #e8e7e7;
            scrollbar-highlight-color: #ffffff;
            scrollbar-shadow-color: #ffffff;
            scrollbar-3dlight-color: #cccccc;
            scrollbar-arrow-color: #ff6800;
            scrollbar-track-color: #efefef;
            scrollbar-darkshadow-color: #b2b2b2;
            scrollbar-base-color: #000000;
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #EAEAEA;
        }

        .menu_title span {
            position: relative;
            top: 0px;
            left: 0px;
            color: #000000;
            font-weight: bold;
            font-size: 13px;
        }

        .menu_title2 span {
            position: relative;
            top: 0px;
            left: 0px;
            color: #50382d;
            font-weight: bold;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">
        function showsubmenu(sid)
        {
            whichEl = eval("submenu" + sid);
            if (whichEl.style.display == "none")
            {
                eval("submenu" + sid + ".style.display=\"\";");
            }
            else
            {
                eval("submenu" + sid + ".style.display=\"none\";");
            }
        }
    </script>

</head>

<body>
    <form id="form1" runat="server">
        <table width="120" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="146">
                    <img src="Images/top_01_2.gif" width="135" height="36"></td>
            </tr>
        </table>
        <table width="125" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td id="menuTitle1" height="30" align="center" background="images/left1.gif" style="cursor: hand;"
                    class="menu_title" onmouseover="this.className='menu_title1'; "
                    onmouseout="this.className='menu_title';"
                    onclick="showsubmenu(1)"><span>基本信息</span></td>
            </tr>
            <tr>
                <td id='submenu1'>
                    <div class="sec_menu">
                        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="sys_admin.aspx" target="mainFrame">管理员管理</a></td>
                            </tr>
                            <tr>
                                <td width="100%" onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="info.aspx" target="mainFrame">系统设置</a></td>
                            </tr>
                             <tr>
                                <td width="100%" onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="banner.aspx" target="mainFrame">横幅设置</a></td>
                            </tr>

                             <tr>
                                <td width="100%" onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="aboutUS.aspx" target="mainFrame">公司简介设置</a></td>
                            </tr>
                                <td width="100%" onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="services.aspx" target="mainFrame">服务项目设置</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="../index.html" target="_blank" style="color: #ff0000;">查看首页</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="logout.aspx" target="_parent" style="color: #ff0000;"> 退出后台</a></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <table width="125" border="0" align="center" cellpadding="0" cellspacing="0" style="display: none;">
            <tr>
                <td height="30" align="center" background="images/left2.gif" class="menu_title" onmouseover="this.className='menu_title2';" onmouseout="this.className='menu_title'; " id="menuTitle2" style="cursor: hand;" onclick="showsubmenu(2)"><span>基本栏目</span></td>
            </tr>
            <tr>
                <td id='submenu2'>
                    <div class="sec_menu">
                        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                            <asp:Repeater ID="jibenlanmu" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">
                                            <img src="images/pic1.gif" width="10" height="10" border="0">

                                            <a href='<%# "set_content.aspx?id="+Eval("id") %>' target="mainFrame"><%# Eval("title") %></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="companyinfo.aspx" target="mainFrame"> 网站详细信息</td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>

        <table width="125" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="30" align="center" background="images/left3.gif" class="menu_title"
                    onmouseover="this.className='menu_title3';" onmouseout="this.className='menu_title';"
                    id="Td2" style="cursor: hand;" onclick="showsubmenu(3)"><strong>工厂管理</strong></td>
            </tr>
            <tr>
                <td id='Td4'>
                    <div class="sec_menu">
                        <table width="98%" height="52" border="0" align="center" cellpadding="3" cellspacing="1">
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="AddFactory.aspx" target="mainFrame"> 发布工厂</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="FactoryList.aspx"
                                        target="mainFrame"> 工厂管理</a></td>
                            </tr>

                        </table>
                    </div>
                </td>
            </tr>
        </table>

        <table width="125" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="30" align="center" background="images/left3.gif" class="menu_title" onmouseover="this.className='menu_title3';" onmouseout="this.className='menu_title';" id="menuTitle3;" style="cursor: hand;" onclick="showsubmenu(3)"><strong>产品管理</strong></td>
            </tr>
            <tr>
                <td id='submenu3'>
                    <div class="sec_menu">
                        <table width="98%" height="52" border="0" align="center" cellpadding="3" cellspacing="1">
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="addpro.aspx" target="mainFrame"> 发布产品</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="product.aspx"
                                        target="mainFrame"> 产品管理</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="p_class.aspx" target="mainFrame"><a href="p_class.aspx" target="mainFrame"> 管理产品分类</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="p_class.aspx" target="mainFrame"><a href="p_class.aspx?action=add" target="mainFrame"> 添加产品分类</a></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <table width="125" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="30" align="center" background="images/left4.gif" class="menu_title" onmouseover="this.className='menu_title18';" onmouseout="this.className='menu_title';" id="menuTitle18" style="cursor: hand;" onclick="showsubmenu(4)"><strong>新闻管理</strong></td>
            </tr>
            <tr>
                <td id='submenu4'>
                    <div class="sec_menu">
                        <table width="98%" height="52" border="0" align="center" cellpadding="3" cellspacing="1">
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="add_news.aspx" target="mainFrame">发布新闻</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="news.aspx"
                                        target="mainFrame"> 新闻管理</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="n_class.aspx" target="mainFrame">管理新闻分类</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="n_class.aspx?action=add" target="mainFrame">添加新闻分类</a></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <table width="125" border="0" align="center" cellpadding="0" cellspacing="0" style="display: none;">
            <tr>
                <td height="30" align="center" background="images/left5.gif" class="menu_title" id="Td3" style="cursor: hand;" onclick="showsubmenu(5)"
                    onmouseover="this.className='menu_title8';" onmouseout="this.className='menu_title';"><strong>在线询盘</strong></td>
            </tr>
            <tr>
                <td id='submenu5'>
                    <div class="sec_menu">
                        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1">
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
           <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="guestbook.aspx" target="mainFrame">在线询盘</a>            </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <table width="125" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="30" align="center" background="images/left6.gif" class="menu_title" id="Td1" style="cursor: hand;" onclick="showsubmenu(6)"
                    onmouseover="this.className='menu_title18';" onmouseout="this.className='menu_title';"><strong>发布招聘</strong></td>
            </tr>
            <tr>
                <td id='submenu6'>
                    <div class="sec_menu">
                        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1">
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="add_zhaopin.aspx" target="mainFrame"> 发布招聘</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0"><a href="zhaopin.aspx"
                                        target="mainFrame"> 管理招聘</a></td>
                            </tr>
                            <!--<tr>
          <td onMouseOver="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onMouseOut="this.style.backgroundColor='';this.style.color=''">&nbsp; <img src="images/pic1.gif" width="10" height="10" border="0"><a href="view_zhaopin.aspx" target="mainFrame"> 查看招聘</a></td>
        </tr>-->
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <table width="125" border="0" align="center" cellpadding="0" cellspacing="0" style="display: none;">
            <tr>
                <td height="30" align="center" background="images/left7.gif" class="menu_title"
                    onmouseover="this.className='menu_title7';" onmouseout="this.className='menu_title';" id="menuTitle7" style="cursor: hand;" onclick="showsubmenu(7)"><span><strong>友情链接</strong></span></td>
            </tr>
            <tr>
                <td id='submenu7'>
                    <div class="sec_menu">
                        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1">
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="add_link.aspx" target="mainFrame">添加友情链接</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="friendlink.aspx"
                                        target="mainFrame">管理友情链接</a></td>
                            </tr>

                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <table width="125" border="0" align="center" cellpadding="0" cellspacing="0" style="display: none;">
            <tr>
                <td height="30" align="center" background="images/left8.gif" class="menu_title" onmouseover="this.className='menu_title7';" onmouseout="this.className='menu_title';" id="Td5" style="cursor: hand;" onclick="showsubmenu(8)"><span><strong>投票管理</strong></span></td>
            </tr>
            <tr>
                <td id='submenu8'>
                    <div class="sec_menu">
                        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1">
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="vote.aspx" target="mainFrame">投票管理</a></td>
                            </tr>
                            <tr>
                                <td onmouseover="this.style.backgroundColor='#fdb441'; this.style.color='#ff0000' " onmouseout="this.style.backgroundColor='';this.style.color=''">&nbsp;
                                    <img src="images/pic1.gif" width="10" height="10" border="0">
                                    <a href="vote.aspx?action=add"
                                        target="mainFrame">添加投票</a></td>
                            </tr>

                        </table>
                    </div>
                </td>
            </tr>

            <table width="125" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="30" align="center" background="images/left8.gif" class="menu_title" onmouseover="this.className='menu_title2';" onmouseout="this.className='menu_title';" style="cursor: hand;"><span>版权信息</span></td>
                </tr>
                <tr>
                    <td height="65" align="center">软件版本：v 1.0<br>
                        <br>
                        技术支持：zxl0715</td>
                </tr>
            </table>
    </form>
</body>
</html>
