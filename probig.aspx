<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="probig.aspx.cs" Inherits="probig" Title="福州兴辉盛世文化传播有限公司" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="page_banner"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="sidebar width">

        <div class=" sb-DG" id="oranges">
            <h3 class="sb--box-title">
                <div class="sb--box-size fl">当前位置：<a href="index.html" title="首页">首页</a> &gt; <a href="pro.html">案例展示</a>&gt;&gt; 具体产品</div>
                <div class="sb--box-right fr"></div>
            </h3>
            <div class="clear"></div>

            <div class=" sb_box editor active" id="showtext">

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

                <div class="case_view">
                    <div class="div_page">
                        <a class="div_page_up div_page_status" href="<%=string.IsNullOrEmpty(pageUp)?"javascript:void(0);" :("probig-"+pageUp+".html#oranges") %>">&lt;&lt;<%=string.IsNullOrEmpty(pageUp)?"上页没啦" :"上页" %></a>
                        <a class="div_page_down div_page_status" href="<%=string.IsNullOrEmpty(pageNext)?"javascript:void(0);" :("probig-"+pageNext+".html#oranges") %>"><%=string.IsNullOrEmpty(pageNext)?"下页没啦" :"下页" %>&gt;&gt;</a>
                    </div>
                    <a href="admin/file/<%=p_i%>" name="roger" rel="example_group" title="<%=p_name%>">
                        <img src="admin/file/sy_<%=p_i%>" width="600" border="0"><br>
                        点击查看大图</a>
                </div>

                <div class="case_view_word">项目名称：<%=p_name%></div>


                <div class="case_content"><%=p_c%></div>


            </div>
            <div class="clear"></div>
        </div>
    </div>
</asp:Content>


