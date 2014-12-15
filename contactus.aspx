<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" Title="福州兴辉盛世文化传播有限公司" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="page_banner"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="sidebar width">

        <div class=" sb-DG">
            <h3 class="sb--box-title">
                <div class="sb--box-size fl">当前位置：<a href="index.html" title="首页">首页</a> &gt; <a href="contactus.html">行业信息</a></div>
                <div class="sb--box-right fr"></div>
            </h3>
            <div class="clear"></div>

            <div class=" sb_box editor active" id="newslist">
                <ul class="list-none metlist">
                    <asp:Repeater ID="DataList1" runat="server">

                        <ItemTemplate>
                            <li class="list"><span>[<%# Convert.ToDateTime( Eval( "time").ToString()).ToString("yyyy-MM-dd")%>]</span>
                                <a href='newsbig-<%# Eval("new_id") %>.html' title="<%#Eval("name") %>" target="_self"><%#Eval("name") %></a>
                                <%# GetNewContent(Eval("content_en").ToString(),70,"..") %>
                              
                            </li>

                        </ItemTemplate>
                    </asp:Repeater>

                </ul>
                <div class="clear"></div>
                <div id="flip">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
                        NextPageText="下一页" PageIndexBoxType="DropDownList" PrevPageText="上一页" ShowPageIndexBox="Never"
                        SubmitButtonText="Go" TextAfterPageIndexBox=" 页" TextBeforePageIndexBox="转到 "
                        CustomInfoHTML="共%PageCount%页，共%recordcount%条，当前为第%CurrentPageIndex%页，每页%PageSize%条"
                        ShowCustomInfoSection="Left" CenterCurrentPageButton="True" OnPageChanged="AspNetPager1_PageChanged"
                        UrlPaging="True">
                    </webdiyer:AspNetPager>
                </div>

            </div>

        </div>
        <div class="clear"></div>
    </div>
</asp:Content>

