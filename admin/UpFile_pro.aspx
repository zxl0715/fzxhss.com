<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpFile_pro.aspx.cs" Inherits="admin_UpFile_pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body style="margin-top:0px; margin-left:0px" >
    <form id="form2" runat="server">
    <div style="text-align: center">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" Height="22px" Width="150px" />
            <asp:Button CssClass="btn"  ID="Button1" runat="server" Text="上传" OnClick="Button1_Click"  />
    </div>
    </form>
</body>
</html>
