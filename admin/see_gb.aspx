<%@ Page Language="C#" AutoEventWireup="true" CodeFile="see_gb.aspx.cs" Inherits="admin_see_gb" %>
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
    <form id="form1" runat="server">
    <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">
                    在线询盘</td>
            </tr>
            <tr>
                <td align="right" width="17%">                
                    <span style="color:Red;"></span>时间：</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    <span id="Span1"></span></td>
            </tr>
            <tr>
                <td class="cline" colspan="2" style="height: 15px">
                </td>
            </tr>
            <tr>
                <td align="right" width="17%">                
                    <span style="color:Red;"></span>标题：</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <span id="subject_msg"></span></td>
            </tr>
             <tr>
                <td class="cline" colspan="2" style="height: 15px">
                </td>
            </tr>
            <tr>
                <td align="right" >
                    <span style="color:Red;"></span>联系人：
                    </td>
                <td >
                    &nbsp;
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>               
                </td>
            </tr>
             <tr>
                <td class="cline" colspan="2" style="height: 18px">
                </td>
            </tr>
            <tr>
                <td align="right" style="height: 27px">
                    <span style="color:Red;"></span>Email：</td>
                <td style="height: 27px">
                    &nbsp;
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><span
                        id="email_msg"></span>
                    </td>
            </tr>
             <tr>
                <td class="cline" colspan="2" style="height: 18px">
                </td>
            </tr>
             <tr>
                <td align="right" style="height: 28px">
                    <span style="color:Red;"></span>联系电话：</td>
                <td style="height: 28px">
                    &nbsp;
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <span
                        id="phone_msg"></span></td>
            </tr>
            <tr>
                <td class="cline" colspan="2">
                </td>
            </tr>
            <tr>
                <td valign="top" align="right">
                    <span style="color:Red;"></span>内容：</td>
                <td>
                    <CE:Editor ID="TextBox9" runat="server" Width="100%" Height="424px">
                                                <FrameStyle BackColor="White" BorderColor="#DDDDDD" BorderStyle="Solid" BorderWidth="1px"
                                                    CssClass="CuteEditorFrame" Height="100%" Width="100%" />
                                            </CE:Editor>
                    <br /><span id="content_msg"></span>
                </td>
            </tr>
            <tr>
                <td class="cline" colspan="2">
                </td>
            </tr>
            <tr>
                <td align="right">
                    公司名称：</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="cline" colspan="2" style="height: 18px">
                </td>
            </tr>
            <tr>
                <td align="right">
                    公司网址：</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="cline" colspan="2" style="height: 18px">
                </td>
            </tr>
           
            <tr>
                <td align="right">
                    联系传真：</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="cline" colspan="2" align="center">
                    <br />
                    <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="返回" OnClick="Button1_Click" /></td>
            </tr>         
           
            
            <tr>
                <td  style="text-align:center;" colspan="2">
                    &nbsp; &nbsp; &nbsp;&nbsp;
                </td>
            </tr>
             
       
    </table>
    </form>
</body>
</html>
