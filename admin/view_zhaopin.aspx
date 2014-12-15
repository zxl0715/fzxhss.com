<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_zhaopin.aspx.cs" Inherits="view_zhaopin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Import Namespace="wzwebsite" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript" src="js.js"></script>
</head>
<body>
    <uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
    <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">
                    按岗位ID查找</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr>
                            <td height="22" align="center">
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td class="b_t ">
                                            <asp:TextBox ID="keys" runat="server" Width="280px"></asp:TextBox>
                                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                            </asp:ScriptManager>
                                            <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServicePath="~/WebService.asmx"
                                                ServiceMethod="getproductlist" MinimumPrefixLength="1" TargetControlID="keys">
                                            </cc1:AutoCompleteExtender>
                                        </td>
                                        <td class="b_t ">
                                            <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="查找" OnClick="Button1_Click" />
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        &nbsp;<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">
                    人才招聘</td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr align="center">
                            <td width="5%" style="height: 22px">
                                <strong>岗位ID</strong></td>
                            <td width="20%" style="height: 22px">
                                <strong>应聘时间</strong></td>
                            <td width="5%" style="height: 22px">
                                <strong>选择</strong></td>
                            <td width="30%" style="height: 22px">
                                <strong>姓名</strong></td>
                            <td width="20%" style="height: 22px">
                                <strong>应聘岗位名称</strong></td>  
                                <td width="20%" style="height: 22px">
                                <strong>电话</strong></td> 
                        </tr>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                            <tr align="center">
                            <td width="5%" height="22">
                                <strong><%# Eval("jobid") %></strong></td>
                            <td width="20%" height="22">
                                <strong><%# Convert.ToDateTime(Eval("addtime")).ToShortDateString().ToString() %></strong></td>
                            <td align="center">
                                        <input name='xinwenid' type='checkbox' id="xinwenid" value='<%# Eval("id") %>'></td>
                            <td width="30%">
                                <strong><a href ='<%#"see_jb.aspx?urls="+Server.UrlEncode(sqlhelper.cupage())+"&id="+Eval("id") %>'><%# Eval("xingming") %></a></strong></td>
                            <td width="25%">
                                <strong><%# getjobname(DataBinder.Eval(Container.DataItem, "jobid").ToString())%></strong></td>  
                            <td width="20%">
                                <strong><%# Eval("phone")%></strong></td> 
                        </tr>   
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>    
                            <td height="25" align="center">
                            </td>
                            <td height="25" align="center">
                            </td>
                            <td align="center">
                                <input id="chkall" type="checkbox" onclick="CheckAll(this.form)" style="border: 0" /></td>
                            <td colspan="5" class="padding-left-10">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="50%" align="left" style="height: 22px">
                                            <asp:Button CssClass="btn"  ID="Button2" runat="server" Text="删除选中产品" OnClientClick="return confirm('确定要删除吗')"
                                                OnClick="Button2_Click" /></td>
                                        <td width="50%" align="right" style="height: 22px">
                                        </td>
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
    </form>
</body>
</html>


