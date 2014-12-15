<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sys_admin.aspx.cs" Inherits="admin_sys_admin" %>

<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:chklogin ID="chklogin1" runat="server" />
        <table width="100%" height="500" border="0">
            <tr>
                <td align="center" valign="top">
                    <asp:Panel ID="adminlist" runat="server">
                        <table width="85%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 25px;">
                            <tr>
                                <td align="center">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="table_bg_size" align="center">
                                                管理员列表</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                                                    <tr align="center">
                                                        <td height="25" align="center">
                                                            <strong>管理员帐户</strong>
                                                        </td>
                                                        <td>
                                                            <strong>密码</strong>
                                                        </td>
                                                        <td align="center">
                                                            <strong>操作</strong>
                                                        </td>
                                                    </tr>
                                                    <asp:Repeater ID="adminuserlist" runat="server">
                                                        <ItemTemplate>
                                                            <tr align="center">
                                                                <td height="22">
                                                                    <%# Eval("admin_name")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("admin_pwd") %>
                                                                </td>
                                                                <td>
                                                                    <a href='<%# "chang_pwd.aspx?id="+Eval("id")+"&users="+Eval("admin_name") %>'>编辑</a>&nbsp;&nbsp;<a
                                                                        href='<%# "?action=del&id="+Eval("id") %>' onclick="if (!confirm('确实要删除管理员吗？')){return false}">删除</a>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="adduser" runat="server">
                        <table width="85%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="2" class="table_bg_size" align="center">
                                                添加管理员</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                                                    <tr>
                                                        <td width="30%" height="25" align="center">
                                                            用户名
                                                        </td>
                                                        <td align="left" class="padding-left-10">
                                                            <input id="addusers" type="text" runat="server" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                                                ControlToValidate="addusers" ValidationGroup="adds"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25" align="center">
                                                            密码
                                                        </td>
                                                        <td align="left" class="padding-left-10">
                                                            <asp:TextBox ID="addpwd" runat="server" TextMode="Password"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                                                ControlToValidate="addpwd" ValidationGroup="adds"></asp:RequiredFieldValidator>
                                                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                            </asp:ScriptManager>
                                                            <cc1:PasswordStrength ID="PasswordStrength1" runat="server" TargetControlID="addpwd"
                                                                DisplayPosition="RightSide" TextCssClass="mimachk" HelpHandlePosition="BelowLeft"
                                                                PrefixText="密码强度：" MinimumNumericCharacters="2" MinimumSymbolCharacters="2" PreferredPasswordLength="10"
                                                                RequiresUpperAndLowerCaseCharacters="true" StrengthIndicatorType="Text" TextStrengthDescriptions="很差;差;一般;好;很好"
                                                                CalculationWeightings="40;20;20;20">
                                                            </cc1:PasswordStrength>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25" align="center">
                                                            确认密码
                                                        </td>
                                                        <td align="left" class="padding-left-10">
                                                            <input id="addokpwd" type="password" runat="server" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                                                ControlToValidate="addokpwd" ValidationGroup="adds"></asp:RequiredFieldValidator>
                                                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="密码不一致"
                                                                ControlToValidate="addokpwd" ControlToCompare="addpwd" ValidationGroup="adds"></asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td height="25" colspan="2">
                                                            <asp:Button CssClass="btn"  ID="adduu" runat="server" Text="添加管理员" OnClick="adduu_Click" ValidationGroup="adds" />
                                                            &nbsp;&nbsp;&nbsp;
                                                            <asp:Button CssClass="btn"  ID="chongtian" runat="server" Text="重新填写" OnClick="chongtian_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    &nbsp;<asp:Repeater ID="Repeater1" runat="server">
                    </asp:Repeater>
                    <!--默认页开始-->
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
