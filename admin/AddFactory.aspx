<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddFactory.aspx.cs" Inherits="admin_AddFactory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加工厂</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="lhgcalendar.js"></script>
</head>
<body>
    <uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">添加产品</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">

                        <tr>
                            <td height="25" align="center">序号：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="p_xu" type="text" id="p_xu" size="10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                    ControlToValidate="p_xu"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="只能为数字"
                                    ValidationExpression="^[0-9]*$" ControlToValidate="p_xu"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center">名称：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="P_Name_En" type="text" id="P_Name_En" size="40">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                    ControlToValidate="P_Name_En"></asp:RequiredFieldValidator>
                            </td>
                        </tr>


                        <tr>
                            <td height="25" align="center">日期：</td>
                            <td class="padding-left-10">
                                <asp:TextBox ID="riqi" runat="server" onclick="$.calendar({ format:'yyyy-MM-dd HH:mm:ss' });"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center">图片：</td>
                            <td class="padding-left-10">
                                <table border="0" cellspacing="0" cellpadding="0" style="width: 50%; text-align: left;">
                                    <tr>
                                        <td style="height: 25px">&nbsp;<input id="imgurl" name="imgurl" type="text" runat="server" style="width: 100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">
                                            <iframe id="upfile" src="UpFile_pro2.aspx" scrolling="no" frameborder="0" width="700"
                                                height="25"></iframe>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td height="25" align="center">产品资料：</td>
                            <td class="padding-left-10">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="height: 25px">
                                            <input name="tjpro" type="text" id="tjpro" runat="server" style="width: 163px" /></td>
                                        <td style="height: 25px">
                                            <iframe id="Iframe1" src="tjproUpfile.aspx" scrolling="no" frameborder="0" width="500px"
                                                height="25"></iframe>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center">标注:</td>
                            <td class="padding-left-10">
                                <input id="istuijian" type="checkbox" value="1" runat="server" />
                                推荐
                                <div class="hide">
                                    <input id="isindex" type="checkbox" value="1" runat="server" />
                                    首页
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td height="25" colspan="2" align="center">
                                <asp:Button CssClass="btn" ID="Button1" runat="server" Text="添加产品" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
