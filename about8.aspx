<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about8.aspx.cs" Inherits="about8" Title="�����˻�ʢ���Ļ��������޹�˾" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="page_banner"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="sidebar width">

        <div class=" sb-DG">
            <h3 class="sb--box-title">
                <div class="sb--box-size fl">��ǰλ�ã�<a href="index.html" title="��ҳ">��ҳ</a> &gt; <a href="about8.html">չ������</a></div>
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
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="��ҳ" LastPageText="βҳ"
                        NextPageText="��һҳ" PageIndexBoxType="DropDownList" PrevPageText="��һҳ" ShowPageIndexBox="Never"
                        SubmitButtonText="Go" TextAfterPageIndexBox=" ҳ" TextBeforePageIndexBox="ת�� "
                        CustomInfoHTML="��%PageCount%ҳ����%recordcount%������ǰΪ��%CurrentPageIndex%ҳ��ÿҳ%PageSize%��"
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
