using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class admin_sys_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] != null)
        {
            if (Request.QueryString["action"].ToString() == "del")
            {
                sys_admin.deluser(Convert.ToInt32(Request.QueryString["id"].ToString()));
                bangdinguserlist();
            }
        }
        bangdinguserlist();
    }
    protected void bangdinguserlist()
    {
        DataTable dt = sys_admin.getuserlist();
        this.adminuserlist.DataSource = dt;
        adminuserlist.DataBind();
    }




    protected void adduu_Click(object sender, EventArgs e)
    {
        sys_admin.adduser(addusers.Value, addpwd.Text);

        foreach (Control Ctrol in adduser.Controls)
        {
            if (Ctrol is HtmlInputText)
            {
                ((HtmlInputText)Ctrol).Value = "";
            }
        }
        bangdinguserlist();
    }
    protected void chongtian_Click(object sender, EventArgs e)
    {
        foreach (Control Ctrol in adduser.Controls)
        {
            if (Ctrol is HtmlInputText)
            {
                ((HtmlInputText)Ctrol).Value = "";
            }
        }
    }
}
