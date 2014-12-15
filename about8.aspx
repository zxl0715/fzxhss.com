<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about8.aspx.cs" Inherits="about8" Title="福州兴辉盛世文化传播有限公司" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="page_banner"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="sidebar width">

        <div class=" sb-DG">
            <h3 class="sb--box-title">
                <div class="sb--box-size fl">当前位置：<a href="index.html" title="首页">首页</a> &gt; <a href="about8.html">展览工厂</a></div>
                <div class="sb--box-right fr"></div>
            </h3>
            <div class="clear"></div>

            <div class=" sb_box editor active" id="productlist">
                <ul class="list-none metlist">
                    <asp:Repeater ID="proData" runat="server">
                        <ItemTemplate>
                            <li class="list" style="width: 452px; margin: 10px  10px; height: 280px;">
                                <a rel="example_group" href="<%# "admin/file/" + getfirst(Eval("pro_img").ToString()) %>" title="<%# Eval("name") %>" target="_self" class="img">
                                    <img width="420" height="250" src="<%# "admin/file/s_" + getfirst(Eval("pro_img").ToString()) %>" alt="<%# Eval("name") %>" title="<%# Eval("name") %>">
                                </a>
                                <h3>
                                    <a href="probig-<%#Eval("pro_id")%>.html" title="<%# Eval("name") %>" target="_self"><%# Eval("name") %></a>
                                </h3>
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

    <link href="css/jquery.fancybox-1.3.1.css" rel="stylesheet" />
    <script src="js/jquery.mousewheel-3.0.2.pack.js"></script>
    <script src="js/jquery.fancybox-1.3.1.js"></script>

    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("a[rel=example_group]").fancybox({
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'titlePosition': 'inside',

                'titleFormat': function (title, currentArray, currentIndex, currentOpts)
                {
                    return '';/* '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';*/
                }
            });
        });
    </script>
</asp:Content>
