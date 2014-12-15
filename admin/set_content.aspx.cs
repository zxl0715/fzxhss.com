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

public partial class admin_set_content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ///ch.Text = content_manager.getlanluinfo(Convert.ToInt32(Request.QueryString["id"].ToString())).Rows[0]["content"].ToString();
            en.Text = content_manager.getlanluinfo(Convert.ToInt32(Request.QueryString["id"].ToString())).Rows[0]["content"].ToString();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        content_manager.setzhi(Convert.ToInt32(Request.QueryString["id"].ToString()),en.Text);
        sqlhelper.alert("修改成功");//5_1_a_s_p_x
    }
    
    
}
