<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chang_pwd.aspx.cs" Inherits="admin_chang_pwd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">
                    修改账号</td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr>
                            <td width="30%" height="25" align="center">
                                用户名</td>
                            <td align="left" class="padding-left-10">
                                <input id="muser" type="text" runat="server" />
                                <span class="style1">*</span></td>
                        </tr>
                        <tr>
                            <td height="25" align="center">
                                原密码</td>
                            <td align="left" class="padding-left-10">
                                <input id="moldpwd" type="password" runat="server" />
                                <span class="style1">不修改请为空</span>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center">
                                密码</td>
                            <td align="left" class="padding-left-10">
                                <asp:TextBox ID="mnewpwd" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                                <cc1:PasswordStrength ID="PasswordStrength1" runat="server" TargetControlID="mnewpwd"
                                    DisplayPosition="RightSide" TextCssClass="mimachk" HelpHandlePosition="BelowLeft"
                                    PrefixText="密码强度：" MinimumNumericCharacters="2" MinimumSymbolCharacters="2" PreferredPasswordLength="10"
                                    RequiresUpperAndLowerCaseCharacters="true" StrengthIndicatorType="Text" TextStrengthDescriptions="很差;差;一般;好;很好"
                                    CalculationWeightings="40;20;20;20">
                                </cc1:PasswordStrength>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center">
                                确认密码</td>
                            <td align="left" class="padding-left-10">
                                <input id="mokpwd" type="password" runat="server" />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致"
                                    ControlToValidate="mokpwd" ControlToCompare="mnewpwd" ValidationGroup="yao"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr align="center">
                            <td height="25" colspan="2">
                                <asp:Button  CssClass="btn"  ID="upadminbutton" runat="server" Text="修改管理员" OnClick="upadminbutton_Click"
                                    ValidationGroup="yao" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button  CssClass="btn"  ID="upadminfanhui" runat="server" Text="返回" OnClick="upadminfanhui_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
