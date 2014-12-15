using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using wzwebsite;

public partial class admin_edit_link : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            bind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        firend_links.editlink(Convert.ToInt32(this.leixing.Value), addmingcheng.Value, addwangzhi.Value,imgurl.Value,Request.QueryString["id"].ToString());
        if (Request.QueryString["urls"] != null)
        {
            sqlhelper.locationhref(Request.QueryString["urls"].ToString());
        }
    }

    protected void bind()
    {
        DataTable dt = firend_links.getlinkinfo(Request.QueryString["id"].ToString());
        leixing.Value = dt.Rows[0]["link_type"].ToString();
        addmingcheng.Value = dt.Rows[0]["link_name"].ToString();
        addwangzhi.Value = dt.Rows[0]["link_addr"].ToString();
       
        imgurl.Value = dt.Rows[0]["link_photo"].ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["urls"] != null)
        {
            sqlhelper.locationhref(Request.QueryString["urls"].ToString());
        }
    }
}

