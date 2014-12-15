<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit_link.aspx.cs" Inherits="admin_edit_link" %>
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
     <table width="85%"  border="0" align="center" cellpadding="0" cellspacing="0"  >
    <tr >
    <td colspan="2" class="table_bg_size" align="center">修改友情链接</td>
  </tr>
    <tr >
      <td colspan="2" valign="top"><table width=100% border=0 align="center" cellpadding=0 cellspacing=1  class="listbg">
          <TR  >
            <TD width="28%" height="23" align="center">链接类型</TD>
            <TD class="padding-left-10">
                <select name="leixing" runat="server" id="leixing">
    <option value="1">文字</option>
    <option value="2">图片</option>
  </select>
                
                
                </TD>
          </TR>
          <TR  >
            <TD width="28%" height="23" align="center">网站名称</TD>
            <TD class="padding-left-10">
                <input name="addmingcheng" type="text" id="addmingcheng" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="addmingcheng" ValidationGroup="adds"></asp:RequiredFieldValidator>
                </TD>
          </TR>
         
          <TR  >
            <TD width="28%" height="23" align="center">链接网址</TD>
            <TD class="padding-left-10">
                <input name="addwangzhi" type="text" id="addwangzhi" runat="server" style="width: 230px" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="addwangzhi" ValidationGroup="adds"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="格式错误" ControlToValidate="addwangzhi" ValidationGroup="adds" 
                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                
                </TD>
          </TR>
		  
		  <TR  >
            <TD width="28%" height="23" align="center">链接图片</TD>
            <TD class="padding-left-10">
            <table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="height: 25px">
        &nbsp;<input id="imgurl" name="imgurl"  type="text" runat="server" style="width: 80px"/>
        <iframe id="upfile" src="UpFile_pro.aspx" scrolling="no" frameborder="0" width="500px"
            height="25"></iframe>
    </td>
  </tr>
</table>
            
                
                
                </TD>
          </TR>
		
          <TR  >
            <TD height="25" colspan="2" align="center">
                
                <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="修 改 链 接" 
                    onclick="Button1_Click" ValidationGroup="adds" />
                    &nbsp;&nbsp;
                <asp:Button CssClass="btn"  ID="Button2" runat="server" Text="返 回" onclick="Button2_Click" />
                </TD>
          </TR>
      </TABLE></td>
    </tr>
  </table>
    </form>
</body>
</html>
