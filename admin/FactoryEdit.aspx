<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FactoryEdit.aspx.cs" Inherits="admin_FactoryEdit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改工厂信息</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="lhgcalendar.js"></script>
</head>
<body>
    <uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">修改工厂信息</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">

                        <tr>
                            <td height="25" align="center">序号：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="p_xu" type="text" id="p_xu" size="10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                    ControlToValidate="p_xu" ValidationGroup="editpro"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="只能为数字"
                                    ValidationExpression="^[0-9]*$" ControlToValidate="p_xu" ValidationGroup="editpro"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center">名称：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="P_Name_En" type="text" id="P_Name_En" size="40">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                    ControlToValidate="P_Name_En" ValidationGroup="editpro"></asp:RequiredFieldValidator>
                            </td>
                        </tr>


                        <tr>
                            <td height="25" align="center">点击数：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="P_Hits" type="text" id="P_Hits" value="30" size="15">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                    ControlToValidate="P_Hits" ValidationGroup="editpro"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="只能为数字"
                                    ValidationExpression="^[0-9]*$" ControlToValidate="P_Hits" ValidationGroup="editpro"></asp:RegularExpressionValidator>
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
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <input name="imgurl" type="text" id="imgurl" runat="server" /></td>
                                        <td>
                                            <iframe id="upfile" src="UpFile_pro2.aspx" scrolling="no" frameborder="0"
                                                height="25"></iframe>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td height="25" align="center">标注：</td>
                            <td class="padding-left-10">
                                <input id="istuijian" type="checkbox" value="1" runat="server" />推荐
                                
                            </td>
                        </tr>

                        <tr>
                            <td height="25" colspan="2" align="center">
                                <asp:Button CssClass="btn" ID="Button1" runat="server" Text="修改产品" OnClick="Button1_Click" ValidationGroup="editpro" />
                                &nbsp;&nbsp; &nbsp;<asp:Button CssClass="btn" ID="Button2" runat="server" Text="返回上页" OnClick="Button2_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
