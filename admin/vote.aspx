<%@ Page Language="C#" AutoEventWireup="true" CodeFile="vote.aspx.cs" Inherits="admin_vote" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="CuteEditor" Namespace="CuteEditor" TagPrefix="CE" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="prototype.js"></script>
</head>
<body>
<uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
    <table width="100%"  cellpadding="5" cellspacing="0" align="center">
	    <tr class="table_bg_size"> 
	        <th width="100%" height="22" valign="middle" align="center"><a href="?">投票管理</a> | <a href="?action=add">新增投票</a></th>
	    </tr>
    </table>
    <br />
    <asp:Panel ID="plList" runat="server" HorizontalAlign="Center" Width="100%">
    <asp:GridView id="gvList" runat="server" Width="100%" OnRowDeleting="gvList_RowDeleting" OnRowEditing="gvList_RowEditing" OnPageIndexChanging="gvList_PageIndexChanging" AllowPaging="True" OnRowDataBound="gvList_RowDataBound" PageSize="15" GridLines="None" CssClass="table_bg_size" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="id">
                <ItemStyle Width="10%" HorizontalAlign="Center"  />
                <HeaderStyle Width="10%" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="主题" DataField="title">
                <ItemStyle Width="40%" HorizontalAlign="Left"  />
                <HeaderStyle Width="40%" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="总数" DataField="votetotal" >
                <ItemStyle Width="10%" HorizontalAlign="Center"  />
                <HeaderStyle Width="10%" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="类型" DataField="type">
                <ItemStyle Width="10%" HorizontalAlign="Center"  />
                <HeaderStyle Width="10%" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="状态" DataField="status" >
                <ItemStyle Width="10%" HorizontalAlign="Center"  />
                <HeaderStyle Width="10%" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="操作" ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                        Text="更新"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="20%" />
                <HeaderStyle HorizontalAlign="Center" Width="20%" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="编辑"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="删除"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("id") %>'
                        Text='<%# Eval("lock") %>' OnCommand="LinkButton3_Command"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerSettings FirstPageText="第一页" LastPageText="最末页" Mode="NextPreviousFirstLast"
            NextPageText="下一页" PreviousPageText="上一页"  />
        <FooterStyle HorizontalAlign="Right"  />
        <PagerStyle HorizontalAlign="Right" VerticalAlign="Bottom" ForeColor="RoyalBlue"  />
    </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="plEdit" runat="server" Width="100%">
    <table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr align="center" valign="middle" class="table_bg_size"> 
          <th colspan="2" height="22">投票</th>
        </tr>
        <tr bgcolor="#FFFFFF" valign="middle"> 
          <td width="25%" align="right">标题：</td>
          <td align="left">&nbsp;<asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                  ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
        <tr bgcolor="ffffff" valign="middle"> 
          <td align="right" width="25%">投票项目<br><br>
              每个项目以“|”分开<br />
              最后不要加“|”<br />
              最多<B>10</B>个，多余作废<BR><BR></td>
          <td align="left">&nbsp;<asp:TextBox ID="txtContent" runat="server" Height="120px" TextMode="MultiLine"
                  Width="300px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContent"
                  ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
        <tr bgcolor="#ffffff" valign="middle">
            <td align="right" width="25%">
                类别：</td>
            <td align="left">
                &nbsp;<asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">单选</asp:ListItem>
                    <asp:ListItem Value="1">多选</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr class="tablefoot"> 
          <td align="center" valign="middle" colspan="2">
              <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="保 存" OnClick="Button1_Click" />
              <asp:HiddenField ID="hfId" runat="server" />
          </td>
        </tr>
    </table>
    </asp:Panel>
    </form>
</body>
</html>
