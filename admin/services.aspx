<%@ Page Language="C#" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="admin_services" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>服务项目设置</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">服务项目设置</td>
            </tr>
            <tr>
                <td>
                    <ce:editor id="profileServer" runat="server" width="100%" height="500px">
                                          
                                            </ce:editor>
                </td>
            </tr>
            <tr>
                <td height="25" colspan="2" align="center">
                    <asp:Button CssClass="btn" ID="btnEdit" runat="server" Text="修改" OnClick="btnEdit_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
