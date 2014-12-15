<%@ Page Language="C#" AutoEventWireup="true" CodeFile="p_class.aspx.cs" Inherits="admin_p_class" %>

<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
        <asp:Panel ID="plEdit" runat="server" Width="100%" HorizontalAlign="Center" CssClass="pl">
            <table cellpadding="5" cellspacing="0" width="100%">
                <tr class="table_bg_size">
                    <th colspan="2">
                        产品添加栏目</th>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right">
                        栏目名称</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtColumnName" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtColumnName"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right">
                        所属分类<br />
                        <br />
                        <font style="color: red">被编辑的栏目及<br />
                            下属栏目不显示</font></td>
                    <td style="text-align: left">
                        <asp:ListBox ID="lbColumnCode" runat="server" Height="162px" Width="289px"></asp:ListBox></td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right">
                        栏目简介</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtColumnInfo" runat="server" Height="70px" MaxLength="200" TextMode="MultiLine"
                            Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right">
                        栏目类型</td>
                    <td style="text-align: left">
                        <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">正常</asp:ListItem>
                            <asp:ListItem Value="1">专题</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr style="display:none;">
                    <td style="width: 30%; text-align: right; height: 32px;">
                        显示风格</td>
                    <td style="text-align: left; height: 32px;">
                        <asp:DropDownList ID="ddlStyle" runat="server">
                            <asp:ListItem Value="0">列表式</asp:ListItem>
                            <asp:ListItem Value="1">简介式</asp:ListItem>
                            <asp:ListItem Value="2">图片式</asp:ListItem>
                            <asp:ListItem Value="3">图文式</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right">
                        外部连接</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtColumnOuturl" runat="server" MaxLength="100" Width="225px"></asp:TextBox></td>
                </tr>
                <tr style="display:none;">
                    <td style="width: 30%; text-align: right">
                        允许发表评论</td>
                    <td style="text-align: left">
                        <asp:RadioButtonList ID="rbtnColumnIsReview" runat="server" EnableViewState="False"
                            RepeatColumns="2">
                            <Items>
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </Items>
                        </asp:RadioButtonList></td>
                </tr>
                <tr style="display:none;">
                    <td style="width: 30%; text-align: right">
                        允许会员投稿</td>
                    <td style="text-align: left">
                        <asp:RadioButtonList ID="rbtnColumnIsPost" runat="server" EnableViewState="False"
                            RepeatColumns="2">
                            <Items>
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </Items>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: right">
                        允许在导航菜单显示</td>
                    <td style="text-align: left">
                        <asp:RadioButtonList ID="rblTop" runat="server" EnableViewState="False" RepeatColumns="2">
                            <Items>
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </Items>
                        </asp:RadioButtonList></td>
                </tr>
                <tr class="tablefoot">
                    <td style="width: 30%; text-align: right">
                        <asp:HiddenField ID="hfColumnId" runat="server" />
                    </td>
                    <td style="text-align: left">
                        <asp:Button CssClass="btn"  ID="btnSaveColumn" runat="server" OnClick="btnSaveColumn_Click" Text="保 存" /></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="plList" runat="server" Width="100%" HorizontalAlign="Center" CssClass="pl">
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="5"
                GridLines="None" OnRowDataBound="gvList_RowDataBound" OnRowDeleting="gvList_RowDeleting"
                EmptyDataText="暂无栏目" CssClass="tableBorder" DataKeyNames="id" Width="98%" OnSelectedIndexChanged="gvList_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" DataFormatString="[{0}]&#160;&#160;&#160;&#160;&#160;&#160;">
                        <ItemStyle Width="50px" HorizontalAlign="Right" />
                        <HeaderStyle Width="50px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="产品栏目名称">
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# getColumnListName(Eval("title","{0}"),Eval("code","{0}")) %>
                            <%# Eval("istop","{0}") %>
                            <%# Eval("type","{0}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="排序">
                        <ItemStyle HorizontalAlign="Center" Width="10%" CssClass="forumRow" />
                        <HeaderStyle Width="10%" />
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("id") %>'
                                OnCommand="upColumn">上升</asp:LinkButton>
                            |
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("id") %>'
                                OnCommand="downColumn">下降</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                        <HeaderStyle Width="10%" />
                        <ItemTemplate>
                            <%# Eval("mangerNum") %>
                            /
                            <%# Eval("countNum") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ShowHeader="False">
                        <ItemStyle Width="120px" />
                        <HeaderStyle Width="120px" />
                        <ItemTemplate>
                            <a href='?action=add&id=<%#Eval("id") %>'>编辑</a>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("id") %>'
                                OnCommand="LinkButton1_Command"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton6" runat="server" Text="删除" CausesValidation="False"
                                CommandName="Delete">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>
    </form>
</body>
</html>
