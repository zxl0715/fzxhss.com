<%@ Page Language="C#" AutoEventWireup="true" CodeFile="info.aspx.cs" Inherits="admin_info" %>

<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <uc1:chklogin ID="chklogin1" runat="server" />
    <form id="gForm" runat="server">
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">
                    网站基本信息</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr>
                            <td width="30%" height="22" align="center">
                                公司名称/网站标题(en)：</td>
                            <td class="padding-left-10">
                                <input name="sitename" type="text" class="inputwidth" id="sitename" runat="server" /></td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                网站底部申明：</td>
                            <td class="padding-left-10">
                                <textarea name="sitefoot" style="font-size: 12px;" rows="4" class="inputwidth"
                                    id="sitefoot" runat="server"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                KeyWords(en)：</td>
                            <td class="padding-left-10">
                                <textarea name="keyword" style="font-size: 12px;" rows="4" class="inputwidth"
                                    id="keyword" runat="server"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                产品是否加水印：</td>
                            <td class="padding-left-10">
                                <asp:DropDownList ID="iswatermark" runat="server">
                                    <asp:ListItem Value="否">否</asp:ListItem>
                                    <asp:ListItem Value="字">字</asp:ListItem>
                                    <asp:ListItem>图</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                水印文字：</td>
                            <td class="padding-left-10">
                                <input name="watermark" type="text" class="inputwidth" id="watermark" runat="server" /></td>
                        </tr>
                        <tr>
                            <td height="22" colspan="2" align="center">
                                <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="保存修改" OnClick="Button1_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
