using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using wzwebsite;
using System.Text.RegularExpressions;

/// <summary>
/// manage_c 的摘要说明
/// </summary>
public class manage_c : System.Web.UI.Page
{
    public static string connstr = ConfigurationManager.AppSettings["accessConnStr"].ToString() + HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["accessdbPath"].ToString()) + ";";
    protected OleDbConnection conn = new OleDbConnection(connstr);
    protected OleDbCommand comm = new OleDbCommand();
    string ErrMsg = string.Empty;
	public manage_c()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    
    public string getColumnListName(string sName, string sCode)
    {
        int Level = (sCode.Length / 4 - 1) * 2;
        string sStr = sCode.Length == 4 ? "" : "";
        if (Level > 0)
        {
            for (int i = 0; i < Level / 2; i++)
                sStr += "－";
            sStr += "├";
        }
        return sStr + sName;
    }

    public void ExecuteSql(string sqlstr)//链接数据库
    {

        //OpenConnection();
        //comm.Connection = conn;
        //comm.CommandType = CommandType.Text;
        //comm.CommandText = sqlstr;
        //comm.ExecuteNonQuery();
        //CloseConnection();
        sqlhelper.ExecuteNonQuery(CommandType.Text, sqlstr, null);

    }
    public string SafeRequest(string str)
    {
        str = str.Trim();
        str = str.Replace("'", "''");
        str = str.Replace(";", "；");
        str = str.Replace("select", "Ｓelect");
        return str;
    }
    //protected void OpenConnection()
    //{
    //    CheckConnection();
    //}
    //public bool CheckConnection()
    //{
    //    if (conn.State == ConnectionState.Closed)
    //    {
    //        try
    //        {

    //            conn.Open();
    //        }
    //        catch (Exception)
    //        {
    //            return false;
    //        }
    //    }
    //    return true;
    //}
    ///// <summary> 
    ///// 关闭当前数据库连接 
    ///// </summary> 
    //protected void CloseConnection()
    //{
    //    if (conn.State == ConnectionState.Open)
    //        conn.Close();
    //    //conn.Dispose();
    //    //comm.Dispose();
    //}
    protected void ShowErr(int w,string ErrMsg)
    {
        string err = "<table cellpadding=3 cellspacing=1 align=center class=tableborder style='width:60%'><tr align=center><th width='100%' height=25 colspan=2>系统信息 </th></tr><tr><td width='100%' bgcolor='ffffff' colspan=2 align='left'> ";
        if (w == 1)
            err += "<b>产生错误的可能原因：</b><br><br><li>您是否仔细阅读了帮助文件，可能您还没有登陆或者不具有使用当前功能的权限。 ";
        err += "<br><li>" + ErrMsg + "</td></tr><tr><td valign=middle colspan=2 align=center class=forumRowHighlight><a href=# onclick=history.go(-1)>返回上一页</a></td></tr></table>";
        System.Web.HttpContext.Current.Response.Write(err);
        System.Web.HttpContext.Current.Response.End();
    }
    public string GetValueByKey(string wKey, string fTable, string wStr)
    {
        try
        {
            return sqlhelper.GetDataTable(CommandType.Text, "select " + wKey + " from " + fTable + " where " + wStr, null).Rows[0][0].ToString();

        }
        catch (Exception)
        {
            return "";
        }
    }
    public bool IsNumeric(string str)
    {
        Regex r = new Regex(@"^\d+(\.)?\d*$");
        if (r.IsMatch(str))
            return true;
        else
            return false;
    }
    protected string q(string s)
    {
        if (Request.QueryString[s] != null)
        {
            return Request.QueryString[s].ToString();
        }
        return string.Empty;
    }
    protected void gvRowAddFun(ref GridViewRowEventArgs e, int c, int w)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='E4E8EF'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=''");
            if (w > 0)
                ((LinkButton)(e.Row.Cells[c].Controls[w])).Attributes.Add("onclick", "return confirm('确定要删除吗?')");
        }
    }
}
