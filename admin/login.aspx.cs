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

public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string users = this.username.Value;
            string pwd = this.password.Value;
            string codes = this.code1.Value.ToString();
            if (codes != Session["CheckCode"].ToString())
            {
                sqlhelper.alert("验证码错误", "login.aspx");
            }
            else
            {
                bool dl = sys_admin.chklogin(users, pwd);
                if (dl)
                {
                    Session["admin"] = users;
                    Response.Redirect("admin_manage.aspx");
                }
                else
                {
                    //5_1_a_s_p_x
                    sqlhelper.alert("用户名或密码错误", "login.aspx");
                }
            }
        }
    }
}
