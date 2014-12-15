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

public partial class admin_zhaopin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            xinwenlistband();
        }
        delnews();
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
            sql = "select * from job where jobname like '%" + Request.QueryString["keys"].ToString() + "%' order by xu desc";
        }
        else
        {
            sql = "select * from job order by xu desc";
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

        Response.Redirect("zhaopin.aspx?keys=" + Server.UrlEncode(keys.Text));

    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        xinwenlistband();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.Form["xinwenid"] != null)
        {
            string ids = Request.Form["xinwenid"].ToString();
            string sql = "delete from job where id in(" + ids + ")";
            sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
            sqlhelper.alert("删除成功", sqlhelper.cupage());
        }
        else
        {
            sqlhelper.alert("请选择", sqlhelper.cupage());
        }
    }


    protected void delnews()
    {
        if (Request.QueryString["action"] != null)
        {
            if (Request.QueryString["action"].Equals("del"))
            {
                string sql = "delete from job where id in(" + Request.QueryString["id"].ToString() + ")";
                sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
                sqlhelper.locationhref(Request.QueryString["urls"].ToString());
            }
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(dianjili.Value))
        {
            string sql = "update job set hits=hits+" + dianjili.Value;
            sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
        }
        sqlhelper.alert("增加成功", sqlhelper.cupage());
        xinwenlistband();
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
