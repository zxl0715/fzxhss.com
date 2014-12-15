<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sys_m.aspx.cs" Inherits="admin_sys_m" %>
<%@ Register Src="chklogin.ascx" TagName="chklogin" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<uc1:chklogin ID="chklogin1" runat="server" />
    <form id="form1" runat="server">
    <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" class="table_bg_size" align="center">
                    系统信息</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="listbg">
                        <tr>
                            <td width="30%" height="22" align="center">
                                操作系统：</td>
                            <td class="padding-left-10">
                                <%=System.Environment.OSVersion.ToString()%></td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                CPU数：</td>
                            <td class="padding-left-10">
                                <%=Environment.GetEnvironmentVariable("NUMBER_OF_PROCESSORS")%>个
                            </td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                CPU类型：</td>
                            <td class="padding-left-10">
                                <%=Environment.GetEnvironmentVariable("PROCESSOR_IDENTIFIER")%>
                            </td>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                服务器名：</td>
                            <td class="padding-left-10">
                                <%=System.Environment.MachineName%>
                        </tr>
                        <tr>
                            <td height="22" align="center">
                                DOTNET 版本：</td>
                            <td class="padding-left-10">
                                <%=System.Environment.Version%></td>
                        </tr>
                        
                        <tr>
                            <td align="center" style="height: 23px">
                                开机运行时长：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <%=(System.Environment.TickCount/3600000).ToString("N2")%>小时</td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 23px">
                                脚本超时时间：</td>
                            <td class="padding-left-10" style="height: 23px">
                                <%=Server.ScriptTimeout%>秒</td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
