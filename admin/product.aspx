﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Import Namespace="wzwebsite" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js.js"></script>

</head>
<body>
    <uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#E4E4E4">
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tr>
                            <td height="25" align="center" bgcolor="#FFFFFF">给所有产品增加
                                <input id="dianjili" type="text" runat="server" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="产品点击数只能为数字"
                                    ValidationExpression="^[0-9]*$" ControlToValidate="dianjili" Display="None"></asp:RegularExpressionValidator>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" />
                                点击率&nbsp;
                                <asp:Button CssClass="btn" ID="Button4" runat="server" Text="提交" OnClick="Button4_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br>
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">产品查找</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr>
                            <td height="22" align="center">
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td class="b_t ">
                                            <asp:DropDownList ID="ddlClass" runat="server" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="b_t ">
                                            <asp:TextBox ID="keys" runat="server" Width="280px"></asp:TextBox>
                                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                            </asp:ScriptManager>
                                            <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServicePath="~/WebService.asmx"
                                                ServiceMethod="getproductlist" MinimumPrefixLength="1" TargetControlID="keys">
                                            </cc1:AutoCompleteExtender>
                                        </td>
                                        <td class="b_t ">
                                            <asp:Button CssClass="btn" ID="Button1" runat="server" Text="查找" OnClick="Button1_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br>
        <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">产品管理</td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr align="center">
                            <td width="7%" style="height: 22px">
                                <strong>排序</strong></td>
                            <td width="7%" style="height: 22px">
                                <strong>选择</strong></td>
                            <td width="34%" style="height: 22px">
                                <strong>产品名称</strong></td>
                            <td width="18%" style="height: 22px">
                                <strong>类型</strong></td>
                            <td width="11%" style="height: 22px">
                                <strong>图片</strong></td>
                            <td width="12%" style="height: 22px">
                                <strong>加入时间</strong></td>
                            <td width="11%" style="height: 22px">
                                <strong>操作</strong></td>
                        </tr>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td height="22" align="center">
                                        <input id="xinwenxuhao" type="text" runat="server" value='<%# Eval("order") %>' style="width: 25px; color: #990000; border: 1px solid #CCC; text-align: center;" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="产品序号必需填写"
                                            ControlToValidate="xinwenxuhao" Display="None"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="产品序号只能为数字"
                                            ValidationExpression="^[0-9]*$" ControlToValidate="xinwenxuhao" Display="None"></asp:RegularExpressionValidator>
                                        <input id="linshixinwenid" type="text" runat="server" value='<%# Eval("pro_id") %>' style="display: none;" />
                                    </td>
                                    <td align="center">
                                        <input name='xinwenid' type='checkbox' id="xinwenid" value='<%# Eval("pro_id") %>'></td>
                                    <td class="padding-left-10" style="cursor: hand;">
                                        <%# Eval("name")%>
                                        &nbsp;<%# Eval("istuijian").ToString() == "0" ? "" : "<font color=red>荐</font>"%>&nbsp;
                                    </td>
                                    <td align="center" width="18%">
                                        <% if (isrows())
                                           {%>
                                        <%#gettypename(DataBinder.Eval(Container.DataItem, "columnid").ToString())%>
                                        <%} %>
                                    </td>
                                    <td width="11%" align="center">
                                        <img alt="" width="120"   src='<%# "file/s_"+ getfirst(DataBinder.Eval(Container.DataItem, "pro_img").ToString())%>' />
                                    </td>
                                    <td align="center">
                                        <%# Eval("time", "{0:d}")%>
                                    </td>
                                    <td align="center">
                                        <a href='<%#"editpro.aspx?urls="+Server.UrlEncode(sqlhelper.cupage())+"&id="+Eval("pro_id") %>'>编辑</a>&nbsp;|&nbsp;<a href='<%#"?action=del&urls="+Server.UrlEncode(sqlhelper.cupage())+"&id="+Eval("pro_id") %>'
                                            onclick="return confirm('确定删除吗')">删除</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <td align="center" style="height: 37px"></td>
                            <td align="center" style="height: 37px">
                                <input id="chkall" type="checkbox" onclick="CheckAll(this.form)" style="border: 0" /></td>
                            <td colspan="5" class="padding-left-10" style="height: 37px">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="50%" align="left" style="height: 22px">
                                            <asp:Button CssClass="btn" ID="Button2" runat="server" Text="删除选中产品" OnClientClick="return confirm('确定要删除吗')"
                                                OnClick="Button2_Click" /></td>
                                        <td width="50%" align="right" style="height: 22px"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="25" colspan="2" align="center">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
                        NextPageText="下一页" PageIndexBoxType="DropDownList" PrevPageText="上一页" ShowPageIndexBox="Never"
                        SubmitButtonText="Go" TextAfterPageIndexBox=" 页" TextBeforePageIndexBox="转到 "
                        CustomInfoHTML="共%PageCount%页，共%recordcount%条，当前为第%CurrentPageIndex%页，每页%PageSize%条"
                        ShowCustomInfoSection="Left" CenterCurrentPageButton="True" OnPageChanged="AspNetPager1_PageChanged"
                        UrlPaging="True">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
