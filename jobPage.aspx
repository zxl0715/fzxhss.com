<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="jobPage.aspx.cs" Inherits="jobPage" Title="福州兴辉盛世文化传播有限公司" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Import Namespace="wzwebsite" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="page_banner"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="sidebar width">

        <div class=" sb-DG">
            <h3 class="sb--box-title">
                <div class="sb--box-size fl">当前位置：<a href="index.html" title="首页">首页</a> &gt; <a href="jobPage.html">人才招聘</a></div>
                <div class="sb--box-right fr"></div>
            </h3>
            <div class="clear"></div>

            <div class=" sb_box editor active" id="job">
                <div class="divCenter">

                    <table width="684" height="482" border="0" cellpadding="0" cellspacing="0" style="margin: auto;">
                        <tr>
                            <td valign="top" align="left">
                                <asp:DataList ID="DataList1" runat="server" Width="671px" CellPadding="4" ForeColor="#333333" RepeatLayout="Flow">
                                    <ItemTemplate>

                                        <table border="0" align="center" cellpadding="0" cellspacing="1" class="job_tb">
                                            <tr>
                                                <td colspan="3" width="50%" class="job_top_title"><strong>招聘职位：<%#Eval("jobname") %></strong></td>
                                                <td colspan="3" class="job_top_title"></td>
                                            </tr>
                                            <tr>
                                                <td width="105" class="job_title">起止日期：</td>
                                                <td width="118">
                                                    <%# string.IsNullOrEmpty( Eval("starttimes").ToString())?"":Convert.ToDateTime( Eval( "starttimes").ToString()).ToString("yyyy-MM-dd")%>
                                                </td>
                                                <td width="88" class="job_title">截止日期：</td>
                                                <td width="138"> <%# string.IsNullOrEmpty( Eval("endtimes").ToString())?"":Convert.ToDateTime( Eval( "endtimes").ToString()).ToString("yyyy-MM-dd")%></td>
                                                <td width="89" class="job_title">招聘人数：</td>
                                                <td width="84">
                                                    <%#Eval("rens") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="105" class="job_title">专业：</td>
                                                <td width="118">
                                                    <%#Eval("zhuanye") %>
                                                </td>
                                                <td width="88" class="job_title">学历：</td>
                                                <td width="138"><%#Eval("xueli") %></td>
                                                <td width="89" class="job_title">性别：</td>
                                                <td width="84">
                                                    <%#Eval("sex") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="middle" width="105" class="job_title">岗位要求：</td>
                                                <td colspan="5" valign="top">
                                                    
                                                    <div class="job_content">
                                                        <%#Eval("yaoqiu") %>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="105" class="job_title">待遇：</td>
                                                <td colspan="5" height="20" valign="top">
                                                    <%#Eval("daiyu") %>
                                                    <div class="job_content">
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                    </ItemTemplate>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <AlternatingItemStyle BackColor="White" />
                                    <ItemStyle BackColor="#EFF3FB" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td height="46" colspan="7" align="center">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
                                    NextPageText="下一页" PageIndexBoxType="DropDownList" PrevPageText="上一页" ShowPageIndexBox="Never"
                                    SubmitButtonText="Go" TextAfterPageIndexBox=" 页" TextBeforePageIndexBox="转到 "
                                    CustomInfoHTML="共%PageCount%页，共%recordcount%条，当前为第%CurrentPageIndex%页，每页%PageSize%条"
                                    ShowCustomInfoSection="Left" CenterCurrentPageButton="True" OnPageChanged="AspNetPager1_PageChanged"
                                    UrlPaging="True">
                                </webdiyer:AspNetPager>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

                </div>

            </div>
            <div class="clear"></div>
        </div>
</asp:Content>
