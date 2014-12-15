<%@ Page Language="C#" AutoEventWireup="true" CodeFile="banner.aspx.cs" Inherits="admin_banner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>横幅设置</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache,must-revalidate">
    <meta http-equiv="expires" content="0">

    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">横幅设置</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr style="width: 100%;">
                            <td style="width: 5%;" align="center">横幅一：</td>
                            <td style="width: 70%;">
                                <img style="width: 500px; height: 150px;" src="../images/s_index_banner1.jpg?t=<%=DateTime.Now.ToString("yyyyMMddhhmmssffff") %>" />
                            </td>
                            <td style="width: 25%;">
                                <asp:FileUpload ID="FileUpload1" runat="server" Height="22px" Width="150px" />
                                <asp:Button CssClass="btn" ID="btnImg1" runat="server" Text="上传" OnClick="btnImg1_Click" />
                            </td>
                        </tr>
                         <tr style="width: 100%;">
                            <td style="width: 5%;" align="center">横幅二：</td>
                            <td style="width: 70%;">
                                <img style="width: 500px; height: 150px;" src="../images/s_index_banner2.jpg?t=<%=DateTime.Now.ToString("yyyyMMddhhmmssffff") %>" />
                            </td>
                            <td style="width: 25%;">
                                <asp:FileUpload ID="FileUpload2" runat="server" Height="22px" Width="150px" />
                                <asp:Button CssClass="btn" ID="btnImg2" runat="server" Text="上传" OnClick="btnImg2_Click" />
                            </td>
                        </tr>
                         <tr style="width: 100%;">
                            <td style="width: 5%;" align="center">横幅三：</td>
                            <td style="width: 70%;">
                                <img style="width: 500px; height: 150px;" src="../images/s_index_banner3.jpg?t=<%=DateTime.Now.ToString("yyyyMMddhhmmssffff") %>" />
                            </td>
                            <td style="width: 25%;">
                                <asp:FileUpload ID="FileUpload3" runat="server" Height="22px" Width="150px" />
                                <asp:Button CssClass="btn" ID="btnImg3" runat="server" Text="上传" OnClick="btnImg3_Click" />
                            </td>
                        </tr>
                         <tr style="width: 100%;">
                            <td style="width: 5%;" align="center">横幅四：</td>
                            <td style="width: 70%;">
                                <img style="width: 500px; height: 150px;" src="../images/s_index_banner4.jpg?t=<%=DateTime.Now.ToString("yyyyMMddhhmmssffff") %>" />
                            </td>
                            <td style="width: 25%;">
                                <asp:FileUpload ID="FileUpload4" runat="server" Height="22px" Width="150px" />
                                <asp:Button CssClass="btn" ID="btnImg4" runat="server" Text="上传" OnClick="btnImg4_Click" />
                            </td>
                        </tr>
                         <tr style="width: 100%;">
                            <td style="width: 5%;" align="center">横幅五：</td>
                            <td style="width: 70%;">
                                <img style="width: 500px; height: 150px;" src="../images/s_index_banner5.jpg?t=<%=DateTime.Now.ToString("yyyyMMddhhmmssffff") %>" />
                            </td>
                            <td style="width: 25%;">
                                <asp:FileUpload ID="FileUpload5" runat="server" Height="22px" Width="150px" />
                                <asp:Button CssClass="btn" ID="btnImg5" runat="server" Text="上传" OnClick="btnImg5_Click" />
                            </td>
                        </tr>
                         <tr style="width: 100%;">
                            <td style="width: 5%;" align="center">横幅六：</td>
                            <td style="width: 70%;">
                                <img style="width: 500px; height: 150px;" src="../images/s_index_banner6.jpg?t=<%=DateTime.Now.ToString("yyyyMMddhhmmssffff") %>" />
                            </td>
                            <td style="width: 25%;">
                                <asp:FileUpload ID="FileUpload6" runat="server" Height="22px" Width="150px" />
                                <asp:Button CssClass="btn" ID="btnImg6" runat="server" Text="上传" OnClick="btnImg6_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
