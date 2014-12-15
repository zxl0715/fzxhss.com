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

public partial class admin_menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["admin"] == null)
        //{
        //    Response.Write("<script>window.parent.location='login.aspx';</script>");
        //}
        jblmdb();
    }

    protected void jblmdb()
    {
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from jibenlanmu", null);
        jibenlanmu.DataSource = dt;
        jibenlanmu.DataBind();
    }

    public string showitems(string zhi)
    {
        if (zhi.ToString() == "1")
        {
            return "\"display:none;\"";
        }
        else
        {
            return "\"display:block;\"";
        }
    }
}
