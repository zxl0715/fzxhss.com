<%@ Page Language="C#" AutoEventWireup="true" CodeFile="set_content.aspx.cs" Inherits="admin_set_content"  ValidateRequest="false"%>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <uc1:chklogin ID="chklogin1" runat="server" />
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">
                    设置栏目详细内容</td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr>
                            <td width="12%" height="25" align="center">
                                详细内容(en)</td>
                            <td width="88%" class="padding-left-10">
                                <CE:Editor ID="en" runat="server" width="100%">
                                </CE:Editor>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" colspan="2" align="center">
                                <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" ValidationGroup="sets" />
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
