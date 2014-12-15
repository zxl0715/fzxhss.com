<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" Title="福州兴辉盛世文化传播有限公司" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="page_banner"></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="sidebar width">

        <div class=" sb-DG">
            <h3 class="sb--box-title">
                <div class="sb--box-size fl">当前位置：<a href="index.html" title="首页">首页</a> &gt; <a href="contact.html">联系我们</a></div>
                <div class="sb--box-right fr"></div>
            </h3>
            <div class="clear"></div>

            <div class=" sb_box editor active">
                <div style="width: 500px; float: left;">

                    <div id="map" style="height: 350px; width: 500px; -webkit-transition: all 0.5s ease-in-out; transition: all 0.5s ease-in-out;"></div>
                    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=scZoHCO7mPWlvbqsKoh1dX1t"></script>
                    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js" charset="UTF-8"></script>
                    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
                    <script type="text/javascript">

                        // 百度地图API功能
                        var map = new BMap.Map('map');
                        var poi = new BMap.Point(119.317394, 26.081366);
                        map.centerAndZoom(poi, 19);
                        map.enableScrollWheelZoom();

                        var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                                        /*  '<img src="../img/baidu.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +*/
                                        '地址：福州市 鼓楼区 五一中路18号正大广场御景台12F' +
                                        '<br/>电话：0591-86257085' +

                                        '<br/>展览项目部<br/>联系人：陈先生<br/>电话：13348251420<br/>QQ：124743331' +
                                        '<br/>品牌项目部<br/>联系人：刘先生<br/>电话：18659152970<br/>QQ：201427540' +
                                        '</div>';

                        //创建检索信息窗口对象
                        var searchInfoWindow = null;
                        searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
                            title: "福州兴辉盛世文化传播有限公司",      //标题
                            width: 300,                                 //宽度
                            height: 200,                                //高度
                            panel: "panel",                             //检索结果面板
                            enableAutoPan: true,                        //自动平移
                            searchTypes: [
                                BMAPLIB_TAB_SEARCH,   //周边检索
                                BMAPLIB_TAB_TO_HERE,  //到这里去
                                BMAPLIB_TAB_FROM_HERE //从这里出发
                            ]
                        });
                        var marker = new BMap.Marker(poi); //创建marker对象
                        marker.enableDragging(); //marker可拖拽
                        marker.addEventListener("click", function (e)
                        {
                            searchInfoWindow.open(marker);
                        })
                        map.addOverlay(marker); //在地图中添加marker
                        searchInfoWindow.open(marker); //在marker上打开检索信息串口

                    </script>

                </div>
                <div style="width: 450px; float: left; padding-top: 10px; padding-left: 10px;">

                    <table cellspacing="1" cellpadding="2" width="96%" border="0">
                        <tbody>
                            <tr>
                                <td valign="top" align="right" width="17%">To：</td>
                                <td valign="top">&nbsp; <span id="labto">福州兴辉盛世文化传播有限公司</span>
                                    <input type="hidden" value="" name="tosubject" /></td>
                            </tr>

                            <tr>
                                <td align="right" width="17%" style="height: 28px">
                                    <span style="color: Red;">*</span>标题：</td>
                                <td style="height: 28px">&nbsp;
                    <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtTitle"></asp:RequiredFieldValidator><span id="subject_msg"></span></td>
                            </tr>
                            <tr>
                                <td class="cline" colspan="2"></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <span style="color: Red;">*</span>联系人：
                                </td>
                                <td>&nbsp;
                <asp:TextBox ID="txtlianxiren" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtlianxiren"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="cline" colspan="2" style="height: 18px"></td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 27px">
                                    <span style="color: Red;">*</span>Email：</td>
                                <td style="height: 27px">&nbsp;
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><span
                        id="email_msg"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="cline" colspan="2" style="height: 18px"></td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 28px">
                                    <span style="color: Red;">*</span>联系电话：</td>
                                <td style="height: 28px">&nbsp;
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPhone"></asp:RequiredFieldValidator><span
                                        id="phone_msg"></span></td>
                            </tr>
                            <tr>
                                <td class="cline" colspan="2"></td>
                            </tr>
                            <tr>
                                <td valign="top" align="right">
                                    <span style="color: Red;">*</span>内容：</td>
                                <td>&nbsp;
                    <textarea id="txtContent" runat="server" style="width: 287px; height: 151px"></textarea>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtContent"></asp:RequiredFieldValidator><br />
                                    <span id="content_msg"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="cline" colspan="2"></td>
                            </tr>
                            <tr>
                                <td align="right">公司名称：</td>
                                <td>&nbsp;
                    <asp:TextBox ID="txtcompany" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="cline" colspan="2" style="height: 18px"></td>
                            </tr>
                            <tr>
                                <td align="right">公司网址：</td>
                                <td>&nbsp;
                    <asp:TextBox ID="txtCompanyUrl" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="cline" colspan="2" style="height: 18px"></td>
                            </tr>

                            <tr>
                                <td align="right">联系传真：</td>
                                <td>&nbsp;
                    <asp:TextBox ID="txtfax" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="cline" colspan="2"></td>
                            </tr>


                            <tr>
                                <td style="text-align: center; margin-top: 20px;" colspan="2">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="提交" />
                                    &nbsp;
                    &nbsp;&nbsp;
                    <input name="reset" type="reset" value=" 取消 " id="Reset1">
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="clear"></div>
        </div>
</asp:Content>

