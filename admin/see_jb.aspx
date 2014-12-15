<%@ Page Language="C#" AutoEventWireup="true" CodeFile="see_jb.aspx.cs" Inherits="admin_see_jb" %>
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
                            <td align="center" style="width: 202px; height: 25px;">
                                应聘时间：</td>
                            <td class="padding-left-10" style="height: 25px">
                                <input runat="server" name="xu" type="text" id="addtime"/>
                                
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 202px; height: 25px;">
                                岗位名称：</td>
                            <td class="padding-left-10" style="height: 25px">
                                <input runat="server" name="jobid" type="text" id="jobid" size="40">
                               </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 202px; height: 25px;">
                                姓名：</td>
                            <td class="padding-left-10" style="height: 25px">
                                <input runat="server" name="xingming" type="text" id="xingming" size="40" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 202px; height: 25px;">
                                性别：</td>
                            <td class="padding-left-10" style="height: 25px">
                                <input ID="sex" runat="server" name="sex" type="text">
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                年龄：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="age" type="text" id="age" size="40" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                婚否：</td>
                            <td class="padding-left-10">
                               <input ID="marriage" runat="server" name="marriage" type="text" />
                                
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                毕业学校：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="school" type="text" id="school" size="40" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*"
                                    ControlToValidate="zhuanye"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 202px; height: 25px;">
                                学历：</td>
                            <td class="padding-left-10" style="height: 25px">
                                <input runat="server" name="xueli" type="text" id="xueli" size="40" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*"
                                    ControlToValidate="zhuanye"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                专业：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="zhuanye" type="text" id="zhuanye" size="40" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                                    ControlToValidate="zhuanye"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                毕业时间：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="biyetime" type="text" id="biyetime" size="40" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*"
                                    ControlToValidate="zhuanye"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 202px; height: 25px;">
                                电话：</td>
                            <td class="padding-left-10" style="height: 25px">
                                <input runat="server" name="phone" type="text" id="phone" size="40">
                               
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 202px; height: 25px;">
                                电子邮件：</td>
                            <td class="padding-left-10" style="height: 25px">
                                <input runat="server" name="email" type="text" id="email" size="40"></td>
                        </tr>
                        <tr>
                            <td height="25" align="center" style="width: 202px">
                                地址：</td>
                            <td class="padding-left-10">
                                <input runat="server" name="addr" type="text" id="addr" size="40">
                                
                            </td>
                        </tr> 
                        <tr>
                            <td height="80" align="center" style="width: 202px">
                                其他（比如待遇等）:</td>
                            <td class="padding-left-10">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="width: 660px">
                                            <CE:Editor ID="qtyq" runat="server" Width="100%" Height="424px">
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
                            <td colspan="2" align="center" style="height: 25px">
                                <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="返回" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
