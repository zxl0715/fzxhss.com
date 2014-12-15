<%@ Page Language="C#" AutoEventWireup="true" CodeFile="companyinfo.aspx.cs" Inherits="admin_companyinfo" ValidateRequest="false"%>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
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
                    网站详细信息</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr>
                            <td width="30%" height="22" align="center">
                                公司名称：</td>
                            <td class="padding-left-10">
                                <input name="companyname" type="text" class="inputwidth" id="companyname" runat="server" /></td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                公司主营产品和服务：</td>
                            <td class="padding-left-10">
                                <textarea name="pro_se" style="font-size: 12px;" rows="4" class="inputwidth"
                                    id="pro_se" runat="server"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                地址：</td>
                            <td class="padding-left-10">
                                <textarea name="address" style="font-size: 12px;" rows="4" class="inputwidth"
                                    id="address" runat="server"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                邮编：</td>
                            <td class="padding-left-10">
                                <input name="zip" type="text" class="inputwidth" id="zip" runat="server" />
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                电话：</td>
                            <td class="padding-left-10">
                                <input name="tel" type="text" class="inputwidth" id="tel" runat="server" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="正确格式为0000-12345678或不填" ControlToValidate="tel" ValidationExpression="0\d{2,3}-\d{5,9}|0\d{2,3}-\d{5,9}"></asp:RegularExpressionValidator></td>
                        </tr>
                        
                        <tr>
                            <td align="center" style="height: 23px">
                                传真：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <input name="fax" type="text" class="inputwidth" id="fax" runat="server" /></td>
                        </tr>
                       <tr>
                            <td align="center" style="height: 23px">
                                手机：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <input name="shouji" type="text" class="inputwidth" id="shouji" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 23px">
                                网址：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <input name="site" type="text" class="inputwidth" id="site" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 23px">
                                联系人：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <input name="farendaibiao" type="text" class="inputwidth" id="farendaibiao" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 21px">
                                员工人数：</td>
                            <td class="padding-left-10" style="height: 21px">
                                <input name="number" type="text" class="inputwidth" id="number" runat="server" />人</td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 23px">
                                经营模式：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <asp:DropDownList ID="model" runat="server">
                                    <asp:ListItem>生产型</asp:ListItem>
                                    <asp:ListItem>贸易型</asp:ListItem>
                                    <asp:ListItem>经销商/批发商</asp:ListItem>
                                    <asp:ListItem>其他</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 23px">
                                公司简介：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <CE:Editor ID="profile" Width="100%" Height="500px" runat="server">
                                </CE:Editor>
                        </tr>
                        <tr>
                            <td align="center" style="height: 23px">
                                MSN：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <input name="msn" type="text" class="inputwidth" id="msn" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 23px">
                                QQ：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <input name="qq" type="text" class="inputwidth" id="qq" runat="server" /></td>
                        </tr>
                        <tr>
                            <td height="22" colspan="2" align="center">
                                <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="保存修改" OnClick="Button1_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
