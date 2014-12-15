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

public partial class product : manage_c
{

    protected void Page_Load(object sender, EventArgs e)
    {
        delnews();
        if (!Page.IsPostBack)
        {
            getdrolist();
            xinwenlistband();
        }

    }
    protected void getdrolist()
    {
        DataTable dt;
        dt = sqlhelper.GetDataTable(CommandType.Text, "select id,title,code from [p_class] order by code", null);
        ListItem li;
        li = new ListItem();
        li.Value = "0";
        li.Text = "全部";
        ddlClass.Items.Add(li);
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            li = new ListItem();
            li.Value = dt.Rows[i][0].ToString();

            li.Text = getColumnListName(dt.Rows[i][1].ToString(), dt.Rows[i][2].ToString());
            ddlClass.Items.Add(li);
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

        if (Request.QueryString["classid"] != null && Request.QueryString["classid"] != "0" && Request.QueryString["keys"] != null)
        {
            sql = "select * from product where Type=0 and  columnid ='" + Request.QueryString["classid"] + "' and name like '%" + Request.QueryString["keys"].ToString() + "%' order by [order] desc";
        }
        else if (Request.QueryString["keys"] != null)
        {
            sql = "select * from product where Type=0 and name like '%" + Request.QueryString["keys"].ToString() + "%' order by [order] desc";
        }
        else
        {
            sql = "select * from product where Type=0 order by [order] desc";
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

        Response.Write(ddlClass.SelectedValue);
        Response.Redirect("product.aspx?keys=" + Server.UrlEncode(keys.Text) + "&classid=" + ddlClass.SelectedValue);

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
            products.delpro(ids);
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
                products.delpro(Request.QueryString["id"].ToString());
                //sqlhelper.locationhref(Request.QueryString["urls"].ToString());
            }
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(dianjili.Value))
        {
            products.changhits(dianjili.Value);
        }
        sqlhelper.alert("增加成功", sqlhelper.cupage());
        xinwenlistband();
    }

    //protected string getallid(int id)
    //{
    //    StringBuilder twoid = new StringBuilder();
    //    DataTable twotab = sqlhelper.GetDataTable(CommandType.Text, "select id from p_class where ParentClassID=" + id, null);
    //    if (twotab.Rows.Count != 0)
    //    {
    //        for (int i = 0; i < twotab.Rows.Count; i++)
    //        {
    //            twoid.Append(twotab.Rows[i]["id"].ToString() + ",");
    //        }
    //    }
    //    StringBuilder threeid = new StringBuilder();
    //    DataTable threetab = sqlhelper.GetDataTable(CommandType.Text, "select id from p_class where pid=" + id, null);
    //    if (threetab.Rows.Count != 0)
    //    {
    //        for (int i = 0; i < threetab.Rows.Count; i++)
    //        {
    //            threeid.Append(threetab.Rows[i]["id"].ToString() + ",");
    //        }
    //    }
    //    string lishi = id.ToString() + "," + twoid.ToString() + threeid.ToString();
    //    int daxiao = lishi.Length - 1;
    //    return lishi.Substring(0, daxiao);
    //}

    public string gettypename(string id)
    {
        string sql = "select title from p_class where id=" + id;
        return sqlhelper.ExecuteScalar(CommandType.Text, sql, null).ToString();
    }
    public string getfirst(string img)
    {
        string[] arrayStr = img.Split('|');
        try
        {
            return arrayStr[1];
        }
        catch
        {
            return "err_img.jpg";
        }
    }
    public bool isrows()
    {
        string nums = sqlhelper.ExecuteScalar(CommandType.Text, "select count(*) from p_class", null).ToString();
        if (!string.IsNullOrEmpty(nums))
        {
            return true;
        }
        else
        {
            return false;

        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}
