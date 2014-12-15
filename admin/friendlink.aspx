<%@ Page Language="C#" AutoEventWireup="true" CodeFile="friendlink.aspx.cs" Inherits="admin_friendlink" %>
<%@ Import Namespace="wzwebsite" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register src="chklogin.ascx" tagname="chklogin" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript" src="js.js"></script>
</head>
<body>
<uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
    <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0"   >
  <tr >
    <td colspan="2" class="table_bg_size" align="center">链接查找</td>
  </tr>
  <tr >
    <td colspan="2"><table width="100%" border="0" cellspacing="1" cellpadding="0" class="listbg">
  <tr>
    <td><table border=0 cellpadding="5" cellspacing="0" >
          <tr>
            <td class="b_t"><strong><a href="friendlink.aspx">所有链接</a></strong></td>
            
              
              <td class="b_t"><strong><a href='?typeid=1'>
              文字
            </a></strong></td>
              
              <td class="b_t"><strong><a href='?typeid=2'>
              图片
            </a></strong></td>
              
            
            
            
            
          </tr>
        </table></td>
  </tr>
</table>
</td>
  </tr>
</table>
<br>
<table width="85%"  border="0" align="center"  cellpadding="0" cellspacing="0">
<tr >
    <td colspan="2" class="table_bg_size" align="center">链接管理</td>
  </tr>

  
  <tr >
    <td colspan="2" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="1" class="listbg" >
        <tr align="center" >
          
          <td width="7%" height="22"><strong>选择</strong></td>
          <td width="38%"><strong>网站名称</strong></td>
          <td width="13%"><strong>类型</strong></td>
          <td width="13%"><strong>图片</strong></td>
          
          <td width="11%"><strong>操作</strong></td>
        </tr>
        
        
        
        
       
        
    <asp:Repeater ID="friendlinks" runat="server">
        <ItemTemplate>
         <tr>
          <td height="22" align="center"><input name="fid" type="checkbox" id="fid" value='<%# Eval("id") %>' /></td>
          <td class="padding-left-10"><a href='<%# Eval("link_addr") %>' target="_blank"><%# Eval("link_name")%></a></td>
          <td align="center"><%# Eval("link_type").ToString()=="1"?"文字":"图片" %></td>
          <td align="center">
          <%# getlinkimg(Eval("id").ToString())%>
          
          
        
          </td>
          <td align="center"><a href='<%# "edit_link.aspx?urls="+Server.UrlEncode(sqlhelper.cupage())+"&id="+Eval("id") %>'>编辑</a>&nbsp;<a href='<%# "?action=del&urls="+Server.UrlEncode(sqlhelper.cupage())+"&id="+Eval("id") %>' onClick="return confirm('确定删除吗')">删除</a></td>
        </tr>
      
       </ItemTemplate>
        </asp:Repeater>
        
        
        <tr >
          <td height="25" align="center">
              <input id="chkall" type="checkbox" onClick="CheckAll(this.form)" style="border:0 " /></td>
          <td colspan="4" class="padding-left-10"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="18%" align="center">
                  <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="删除选中链接" 
                      OnClientClick="return confirm('确定要删除吗')" onclick="Button1_Click" /></td>
              <td width="82%" align="right"></td>
            </tr>
          </table></td>
        </tr>
    
    </table></td>
  </tr>
  <tr >
    <td height="25" colspan="2" align="center" >
        
        <webdiyer:AspNetPager 
            ID="AspNetPager1" runat="server" 
            FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" 
            PageIndexBoxType="DropDownList" PrevPageText="上一页" ShowPageIndexBox="Never" 
            SubmitButtonText="Go" TextAfterPageIndexBox=" 页" 
            TextBeforePageIndexBox="转到 " 
            CustomInfoHTML="共%PageCount%页，共%recordcount%条，当前为第%CurrentPageIndex%页，每页%PageSize%条" 
            ShowCustomInfoSection="Left" CenterCurrentPageButton="True" 
            onpagechanged="AspNetPager1_PageChanged" UrlPaging="True">
        </webdiyer:AspNetPager>

    </td>
  </tr>
</table>
    </form>
</body>
</html>
