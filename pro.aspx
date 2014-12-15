<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pro.aspx.cs" Inherits="pro" Title="福州兴辉盛世文化传播有限公司" %>


<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="page_banner"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="sidebar width">
        <div class="sb_nav fl sb_DG_Color">
            <div class="sb_active" id="sidebar" data-csnow="2" data-class3="0" data-jsok="2">

                <asp:Repeater ID="rptProClass" runat="server">
                    <ItemTemplate>

                        <dl class="list-none navnow">
                            <dt id="part<%#Eval("Id")%>"><a href="pro-<%#Eval("Id")%>.html" title="<%#Eval("TItle")%><" class="zm"><span><%#Eval("TItle")%></span></a></dt>
                        </dl>
                    </ItemTemplate>
                </asp:Repeater>

                <%-- <dl class="list-none navnow">
                    <dt id="part2_9"><a href="../product/product_9_1.html" title="山水画" class="zm"><span>山水画</span></a></dt>
                </dl>
                <dl class="list-none navnow">
                    <dt id="part2_10"><a href="../product/product_10_1.html" title="花鸟画" class="zm"><span>花鸟画</span></a></dt>
                </dl>--%>
                <div class="clear"></div>

            </div>

            <h3 class="title line myCorner" data-corner="top 5px" style="border-top-left-radius: 5px; border-top-right-radius: 5px;">联系方式</h3>
            <div class="sb--nav-bot editor">
                <div style="font-weight:bold;font-size:12px;">福州兴辉盛世文化传播有限公司</div>
                <span style="line-height: 2;"><strong>地址：</strong>福州市 鼓楼区 五一中路18号正大广场御景台12F</span>
                <div>
                    <strong>电话：</strong>0591-86257085
                </div>
                <div>
                    <strong>手机：</strong>13348251420
                </div>
                <div>                   
                    <strong>QQ：</strong>124743331
                </div>
                <div class="clear"></div>
            </div>

        </div>


        <div class="sb_box_width fr sb-DG">
            <h3 class="sb--box-title">
                <div class="sb--box-size fl">当前位置：<a href="index.html" title="首页">首页</a> &gt; <a href="pro.html">案例展示</a><%=proClass %></div>
                <div class="sb--box-right fr"></div>
            </h3>
            <div class="clear"></div>
            <div class=" sb_box editor active" id="productlist">
                <ul class="list-none metlist">
                    <asp:Repeater ID="proData" runat="server">
                        <ItemTemplate>
                            <li class="list" style="width: 226px; margin: 10px  10px; height: 180px;">
                                <a href="probig-<%#Eval("pro_id")%>.html" title="<%# Eval("name") %>" target="_self" class="img">
                                    <img width="220" height="170" src="<%# "admin/file/s_" + getfirst(Eval("pro_img").ToString()) %>" alt="<%# Eval("name") %>" title="<%# Eval("name") %>">
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
            <div class="clear"></div>
        </div>
    </div>
</asp:Content>

