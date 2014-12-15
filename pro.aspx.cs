﻿using System;
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
using System.Data;
public partial class pro : System.Web.UI.Page
{
    public string proClass = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ProClass();
            xinwenlistband();
        }
    }
    /// <summary>
    /// 获取产品类型
    /// </summary>
    /// <returns></returns>
    private void ProClass()
    {    
        string sql = "Select Id,Title from p_class order by Code";
        DataSet ds = sqlhelper.GetDataSet(CommandType.Text, sql, null);
        rptProClass.DataSource = ds;
        rptProClass.DataBind();
        if (Request.QueryString["classid"] != null)
        {
            string classId = Request.QueryString["classid"].ToString();
            DataRow[] dr = ds.Tables[0].Select("id=" + classId);
            if (dr.Length > 0)
            {
                proClass = " &gt; " + dr[0]["Title"].ToString();
            }
        }
    }
    protected void xinwenlistband()
    {

        PagedDataSource pds = new PagedDataSource();
        pds.AllowPaging = true;
        AspNetPager1.PageSize = 9;
        pds.PageSize = AspNetPager1.PageSize;
        pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;
        string sql = "";
        DataSet ds;

        if (Request.QueryString["classid"] != null)
        {
            sql = "select * from product where Type=0 and columnid ='" + Request.QueryString["classid"] + "' order by [order] desc";
        }
        else if (Request.QueryString["ke"] != null)
        {
            sql = "select * from product where Type=0 and [name] like '%" + Request.QueryString["ke"].ToString() + "%' order by [order] desc";
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
        proData.DataSource = pds;
        proData.DataBind();
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        xinwenlistband();
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
}
