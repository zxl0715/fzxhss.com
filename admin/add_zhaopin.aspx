<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_zhaopin.aspx.cs" Inherits="admin_add_zhaopin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
      <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="lhgcalendar.js"></script>
</head>
<body>
<uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
    <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">
                    添加人才招聘岗位</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg"> 
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                序号：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="xu" type="text" id="xu" size="10" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                    ControlToValidate="xu"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="只能为数字"
                                    ValidationExpression="^[0-9]*$" ControlToValidate="xu"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                招聘岗位名称：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="name" type="text" id="name" size="40">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                    ControlToValidate="name"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                人数：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="rens" type="text" id="rens" size="40">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="rens"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                年龄：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="age" type="text" id="age" size="40">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                    ControlToValidate="age"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                专业：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="zhuanye" type="text" id="zhuanye" size="40" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                    ControlToValidate="zhuanye"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                学历：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="xueli" type="text" id="xueli" size="40">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                    ControlToValidate="xueli"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 202px; height: 25px;">
                                性别：</td>
                            <td class="padding-left-10" style="height: 25px">
                                &nbsp;<asp:DropDownList ID="sex" runat="server">
                                    <asp:ListItem>不限</asp:ListItem>
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList>
                                
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                起止日期：</td>
                            <td class="padding-left-10">
                                <asp:TextBox ID="riqi" runat="server"  onclick="$.calendar({ format:'yyyy-MM-dd HH:mm:ss' });"></asp:TextBox>——<asp:TextBox ID="riqi2" runat="server"  onclick="$.calendar({ format:'yyyy-MM-dd HH:mm:ss' });"></asp:TextBox>
                                 
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center">
                                发布:</td>
                            <td class="padding-left-10">
                                <input id="istuijian" type="checkbox" value="1" runat="server" />
                                发布
                                <div class="hide">
                                    <input id="isindex" type="checkbox" value="1" runat="server" />
                                    首页</div>
                            </td>
                        </tr>
                        <tr>
                            <td height="80" align="center" style="width: 202px">
                                岗位要求详细信息:</td>
                            <td class="padding-left-10">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="width: 660px">
                                            <CE:Editor ID="yaoqiu" runat="server" Width="100%" Height="424px">
                                                <FrameStyle BackColor="White" BorderColor="#DDDDDD" BorderStyle="Solid" BorderWidth="1px"
                                                    CssClass="CuteEditorFrame" Height="100%" Width="100%" />
                                            </CE:Editor>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="80" align="center" style="width: 202px">
                                待遇:</td>
                            <td class="padding-left-10">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="width: 660px">
                                            <CE:Editor ID="daiyu" runat="server" Width="100%" Height="359px">
                                                <FrameStyle BackColor="White" BorderColor="#DDDDDD" BorderStyle="Solid" BorderWidth="1px"
                                                    CssClass="CuteEditorFrame" Height="100%" Width="100%" />
                                            </CE:Editor>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" colspan="2" align="center">
                                <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
