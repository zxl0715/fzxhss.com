<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="newsbig.aspx.cs" Inherits="newsbig" Title="福州兴辉盛世文化传播有限公司" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="page_banner"></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="sidebar width">

        <div class=" sb-DG">
            <h3 class="sb--box-title">
                <div class="sb--box-size fl">当前位置：<a href="index.html" title="首页">首页</a> &gt; <a href="newsPage.html">新闻中心</a> &gt;&gt; 正文</div>
                <div class="sb--box-right fr"></div>
            </h3>
            <div class="clear"></div>

            <div class=" sb_box editor active" id="shownews">
                <div>

                    <h1 class="title"><%=n_name%></h1>

                    <div class="newsTime">
                        <%= n_time%>
                    </div>
                    <%=pro_img%>

                    <div class="editor">

                        <%=n_c%>
                    </div>

                    <div class="met_hits">
                        &nbsp;&nbsp;【<a href="javascript:window.print()">打印此页</a>】&nbsp;&nbsp;【<a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>】
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</asp:Content>

