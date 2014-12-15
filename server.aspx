<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="server.aspx.cs" Inherits="server" Title="福州兴辉盛世文化传播有限公司" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="page_banner"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="sidebar width">

        <div class=" sb-DG">
            <h3 class="sb--box-title">
                <div class="sb--box-size fl">当前位置：<a href="index.html" title="首页">首页</a> &gt; <a href="server.html">服务项目</a></div>
                <div class="sb--box-right fr"></div>
            </h3>
            <div class="clear"></div>

            <div class=" sb_box editor active" id="showtext">
                <div>
                     <asp:Literal ID="ltxtServer" runat="server"></asp:Literal>

                </div>
            </div>
            <div class="clear"></div>
        </div>
</asp:Content>

