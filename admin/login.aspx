<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
<!--
.STYLE2 {font-size: 12px}
.bg {
		background-image:url(../images/kuang-1.jpg);
		padding-left:20px;}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
        <table height="100%" width="100%" border="00" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" valign="middle" bgcolor="#c6d3da">
                    <table width="1006" border="00" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="97" height="587" background="images/bj-1.jpg">
                                &nbsp;</td>
                            <td valign="top">
                                <table width="100%" border="00" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td valign="top">
                                            <table width="100%" border="00" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="210">
                                                        <table width="210" border="00" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="78" height="519" background="images/bj-2.jpg">
                                                                    &nbsp;</td>
                                                                <td width="132" background="images/bj-3.jpg">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="408">
                                                        <table width="100%" border="00" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td height="114" background="images/bj-7.jpg">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="00" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="18" height="296" background="images/kuang-left.jpg">
                                                                                &nbsp;</td>
                                                                            <td valign="top" background="images/00.jpg">
                                                                                <table width="100%" border="00" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <table width="100%" border="00" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td width="32%">
                                                                                                        <img src="images/tubiao-0.jpg" width="118" height="61" /></td>
                                                                                                    <td width="68%">
                                                                                                        <img src="images/zi.jpg" width="248" height="62" /></td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <table width="100%" border="00" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td width="21" height="160" background="images/nk-left.jpg">
                                                                                                        &nbsp;</td>
                                                                                                    <td background="images/nk-bj.jpg">
                                                                                                        <table width="100%" border="00" cellspacing="0" cellpadding="0">
                                                                                                            <tr>
                                                                                                                <td width="24%" height="30" align="right">
                                                                                                                    <span class="STYLE2"><span class="STYLE1">管理员</span>：</span></td>
                                                                                                                <td width="49%">
                                                                                                                    <input name="username" id="username" accesskey="s" size="20" autocomplete="off" runat="server"/></td>
                                                                                                                <td width="27%">
                                                                                                                    &nbsp;</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td height="30" align="right">
                                                                                                                    <span class="STYLE2"><span class="STYLE1">管理密码</span>：</span></td>
                                                                                                                <td>
                                                                                                                    <input name="password" id="password" accesskey="s" size="20" autocomplete="off" runat="server" type="password"/></td>
                                                                                                                <td>
                                                                                                                    &nbsp;</td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td height="30" align="right">
                                                                                                                    <span class="STYLE2"><span class="STYLE1">验证码</span>：</span></td>
                                                                                                                <td>
                                                                                                                    <input name="code1" id="code1" accesskey="s" size="20" autocomplete="off" runat="server" />
                                                                                                                    <strong></strong>
                                                                                                                </td>
                                                                                                                <td align="left">
                                                                                                                    <img id="Image1" src="Image.aspx" style="height: 25px; border-width: 0px;" runat="server" /></td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td width="20" background="images/nk-right.jpg">
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="60" align="center" valign="middle">
                                                                                            <asp:Button ID="Button1" runat="server" width="67" height="30" style="border:0px;background-image:url(images/dl-anniu.jpg)" OnClick="Button1_Click" />
                                                                                            </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="24" height="296" background="images/kuang-right.jpg">
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="408" height="109" background="images/bj-8.jpg">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="201" height="519">
                                                        <table width="201" border="00" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="95" background="images/bj-4.jpg">
                                                                    &nbsp;</td>
                                                                <td width="106" height="519" background="images/bj-5.jpg">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="68" valign="top">
                                            <table width="100%" border="00" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="13" height="68" background="images/db-left.jpg">
                                                        &nbsp;</td>
                                                    <td height="68" background="images/db-bj.jpg">
                                                        &nbsp;</td>
                                                    <td width="15" background="images/db-right.jpg">
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="90" height="587" bgcolor="#D4D0C8">
                                <img src="images/bj-6.jpg" width="90" height="587" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
