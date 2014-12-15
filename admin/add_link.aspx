<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_link.aspx.cs" Inherits="add_link" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Import Namespace="wzwebsite" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript" src="js.js"></script>
</head>
<body>
    <uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tr>
                            <td align="center" class="table_bg_size">添加友情链接 </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="listbg">
                        <tr>
                            <td width="28%" height="23" align="center">链接类型</td>
                            <td class="padding-left-10">
                                <select name="leixing" runat="server" id="leixing">
                                    <option value="1">文字</option>
                                    <option value="2">图片</option>
                                </select>


                            </td>
                        </tr>
                        <tr>
                            <td width="28%" height="23" align="center">网站名称</td>
                            <td class="padding-left-10">
                                <input name="addmingcheng" type="text" id="addmingcheng" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="addmingcheng" ValidationGroup="adds"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td width="28%" height="23" align="center">链接网址</td>
                            <td class="padding-left-10">
                                <input name="addwangzhi" type="text" id="addwangzhi" runat="server" style="width: 230px" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="addwangzhi" ValidationGroup="adds"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ErrorMessage="格式错误" ControlToValidate="addwangzhi" ValidationGroup="adds"
                                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>

                            </td>
                        </tr>

                        <tr>
                            <td width="28%" height="23" align="center">链接图片</td>
                            <td class="padding-left-10">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <input id="imgurl" name="imgurl" type="text" runat="server" style="width: 60px" /></td>
                                        <td>
                                            <iframe id="upfile" src="UpFile_pro.aspx" scrolling="no" frameborder="0" width="500px"
                                                height="25"></iframe>
                                        </td>
                                    </tr>
                                </table>



                            </td>
                        </tr>

                        <tr>
                            <td height="25" colspan="2" align="center">

                                <asp:Button CssClass="btn" ID="Button1" runat="server" Text="添 加 链 接"
                                    OnClick="Button1_Click" ValidationGroup="adds" />

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

