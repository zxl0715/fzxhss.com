<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_manage.aspx.cs" Inherits="admin_admin_manage" %>

<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台管理系统</title>
</head>
<frameset rows="2" cols="168,*" border="0" frameborder="0" framespacing="0">
  <frame src="menu.aspx" name="menu" noresize scrolling="auto">
  <frame src="sys_m.aspx" name="mainFrame">
</frameset>
<noframes>


<body>
<uc1:chklogin ID="chklogin1" runat="server" />
    
</body>
</noframes>
</html>
