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
using System.Web.SessionState;

public partial class view_zhaopin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            xinwenlistband();
        }
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.Form["xinwenid"] != null)
        {
            string ids = Request.Form["xinwenid"].ToString();
            string sql = "delete from jobbook where id in(" + ids + ")";
            sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
            sqlhelper.alert("删除成功", sqlhelper.cupage());
        }
        else
        {
            sqlhelper.alert("请选择", sqlhelper.cupage());
        }
    }
    protected void xinwenlistband()
    {
        PagedDataSource pds = new PagedDataSource();
        pds.AllowPaging = true;
        pds.PageSize = AspNetPager1.PageSize;
        pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;
        string sql = "";
        DataSet ds;

        if (Request.QueryString["keys"] != null)
        {
            sql = "select * from jobbook where jobid like '%" + Request.QueryString["keys"].ToString() + "%' order by [addtime] desc";
        }
        else
        {
            sql = "select * from jobbook order by [addtime] desc";
        }
        //Response.Write(sql);
        //Response.End();
        ds = sqlhelper.GetDataSet(CommandType.Text, sql, null);
        pds.DataSource = ds.Tables[0].DefaultView;
        AspNetPager1.RecordCount = ds.Tables[0].Rows.Count;
        Repeater1.DataSource = pds;
        Repeater1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("view_zhaopin.aspx?keys=" + Server.UrlEncode(keys.Text));
    }
    public string getjobname(string id)
    {
        string sql = "select jobname from job where id=" + id;
        return sqlhelper.ExecuteScalar(CommandType.Text, sql, null).ToString();
    }

}
