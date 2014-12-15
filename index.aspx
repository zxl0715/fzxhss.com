<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" Title="福州兴辉盛世文化传播有限公司" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Import Namespace="wzwebsite" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="index_banner" id="banner_tabs">
        <ul>
            <li class="first"><a href="javascript:void(0);"></a></li>
            <li class="second"><a href="javascript:void(0);"></a></li>
            <li class="third"><a href="javascript:void(0);"></a></li>
            <li class="fourth"><a href="javascript:void(0);"></a></li>
            <li class="fifth"><a href="javascript:void(0);"></a></li>
            <li class="sixth"><a href="javascript:void(0);"></a></li>

        </ul>
        <cite><span class="cur">1</span><span>2</span><span>3</span><span>4</span><span>5</span><span>6</span></cite>
    </div>
    <script src="js/jcarousellite_index.js"></script>
    <script type="text/javascript">
        (function ()
        {
            if (!Function.prototype.bind)
            {
                Function.prototype.bind = function (obj)
                {
                    var owner = this, args = Array.prototype.slice.call(arguments), callobj = Array.prototype.shift.call(args);
                    return function (e) { e = e || top.window.event || window.event; owner.apply(callobj, args.concat([e])); };
                };
            }
        })();
        var banner_tabs = function (id)
        {
            this.ctn = document.getElementById(id);
            this.adLis = null;
            this.btns = null;
            this.animStep = 0.2;//动画速度0.1～0.9
            this.switchSpeed = 2;//自动播放间隔(s)
            this.defOpacity = 1;
            this.tmpOpacity = 1;
            this.crtIndex = 0;
            this.crtLi = null;
            this.adLength = 0;
            this.timerAnim = null;
            this.timerSwitch = null;
            this.init();
        };
        banner_tabs.prototype = {
            fnAnim: function (toIndex)
            {
                if (this.timerAnim) { window.clearTimeout(this.timerAnim); }
                if (this.tmpOpacity <= 0)
                {
                    this.crtLi.style.opacity = this.tmpOpacity = this.defOpacity;
                    this.crtLi.style.filter = 'Alpha(Opacity=' + this.defOpacity * 100 + ')';
                    this.crtLi.style.zIndex = 0;
                    this.crtIndex = toIndex;
                    return;
                }
                this.crtLi.style.opacity = this.tmpOpacity = this.tmpOpacity - this.animStep;
                this.crtLi.style.filter = 'Alpha(Opacity=' + this.tmpOpacity * 100 + ')';
                this.timerAnim = window.setTimeout(this.fnAnim.bind(this, toIndex), 50);
            },
            fnNextIndex: function ()
            {
                return (this.crtIndex >= this.adLength - 1) ? 0 : this.crtIndex + 1;
            },
            fnSwitch: function (toIndex)
            {
                if (this.crtIndex == toIndex) { return; }
                this.crtLi = this.adLis[this.crtIndex];
                for (var i = 0; i < this.adLength; i++)
                {
                    this.adLis[i].style.zIndex = 0;
                }
                this.crtLi.style.zIndex = 2;
                this.adLis[toIndex].style.zIndex = 1;
                for (var i = 0; i < this.adLength; i++)
                {
                    this.btns[i].className = '';
                }
                this.btns[toIndex].className = 'cur'
                this.fnAnim(toIndex);
            },
            fnAutoPlay: function ()
            {
                this.fnSwitch(this.fnNextIndex());
            },
            fnPlay: function ()
            {
                this.timerSwitch = window.setInterval(this.fnAutoPlay.bind(this), this.switchSpeed * 1000);
            },
            fnStopPlay: function ()
            {
                window.clearTimeout(this.timerSwitch);
            },
            init: function ()
            {
                this.adLis = this.ctn.getElementsByTagName('li');
                this.btns = this.ctn.getElementsByTagName('cite')[0].getElementsByTagName('span');
                this.adLength = this.adLis.length;
                for (var i = 0, l = this.btns.length; i < l; i++)
                {
                    with ({ i: i })
                    {
                        this.btns[i].index = i;
                        this.btns[i].onclick = this.fnSwitch.bind(this, i);
                        this.btns[i].onclick = this.fnSwitch.bind(this, i);
                    }
                }
                this.adLis[this.crtIndex].style.zIndex = 2;
                this.fnPlay();
                this.ctn.onmouseover = this.fnStopPlay.bind(this);
                this.ctn.onmouseout = this.fnPlay.bind(this);
            }
        };
        var player1 = new banner_tabs('banner_tabs');
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="CON--bg">
        <div class="width">
            <!--<div class="CON--l-t position">
			   <h3 class="sskd fl"></h3>
			       
			   <div class="clear"></div>
		  </div>-->
            <div class="CON--l fl tupAple">

                <div class="CON--l-c">
                    <div class="title-ct position">
                        <h3>案例展示<span>SHOW CASE</span></h3>
                        <a href="pro.html" class="title-more position" title="案例展示">更多&gt;&gt;</a>
                    </div>

                    <div class="CON--l-cnr">
                        <ol class="list-none metlist">

                            <% foreach (DataRow dr in dtProduct.Rows)
                               { %>
                            <li class="fl DG-con" style="width: 210px; margin-left: 13px; margin-right: 13px; height: 199px;">
                                <div style="width: 208px;">
                                    <a href="probig-<%=dr["pro_id"].ToString()%>.html" title="<%= dr["name"].ToString()%>" target="_self" class="img">
                                        <img src="admin/file/s_<%=getfirst(dr["pro_img"].ToString()) %>" alt="<%= dr["name"].ToString()%>" title="<%= dr["name"].ToString()%>" width="208" height="169" style="opacity: 1;"></a>
                                    <h3><a href="probig-<%=dr["pro_id"].ToString()%>.html" title="<%= dr["name"].ToString()%>" target="_self"><%= dr["name"].ToString()%></a></h3>
                                </div>
                            </li>
                            <%} %>
                        </ol>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="CON--r fr tupAple">


                <div class="CON--l-b">
                    <div class="title-ct position">
                        <h3>公司简介<span>ABOUT US</span></h3>
                        <a href="about.html" class="title-more position" title="公司简介">更多&gt;&gt;</a>
                    </div>
                    <div class="CON--l-bnr editor">
                        &nbsp; &nbsp; &nbsp; &nbsp;福州兴辉盛世文化传播有限公司是拥有一支精通会展项目策划、运营与管理的专业团队，是专业从事组织、策划、承办国内外大型展览、会议及展览设计搭建的会展服务机构。 公司现已发展成为集商业展览展示、展台设计与建造、项目招商、展具制造、礼仪庆典、会议活动策划服务为一体的专业展览策划公司。<div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>


                <div class="clear"></div>
                <div class="CON--r-b">
                    <div class="title-zx position">
                        <h3>新闻中心</h3>
                        <a href="newsPage.html" class="titlezx-more position" title="新闻中心">更多&gt;&gt;</a>
                    </div>
                    <div class="CON--r-bxw">
                        <ol class="list-none metlist">
                            <asp:Repeater ID="DataList1" runat="server">
                                <ItemTemplate>
                                    <li class="list">
                                        <span class="time"><%# Convert.ToDateTime( Eval( "time").ToString()).ToString("yyyy-MM-dd")%></span>
                                        <a href='newsbig-<%# Eval("new_id") %>.html' title="<%#Eval("name") %>" target="_self"><%#Eval("name") %></a>

                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ol>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

