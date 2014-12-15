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
using wzwebsite;
using System.Security;
public partial class admin_chang_pwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["users"] != null)
        {
            muser.Value = Request.QueryString["users"].ToString();
        }
    }
    protected void upadminbutton_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(moldpwd.Value))
        {
            string formmima = FormsAuthentication.HashPasswordForStoringInConfigFile(moldpwd.Value, "md5").ToString();
            string nnpwd = FormsAuthentication.HashPasswordForStoringInConfigFile(mnewpwd.Text, "md5");


            string sql = "select admin_pwd from admin where id=" + Request.QueryString["id"].ToString();
            string dbmima = sqlhelper.ExecuteScalar(CommandType.Text, sql, null).ToString();
            if (dbmima == formmima)
            {
                string upsql = "update admin set admin_pwd=@admin_pwd where id=" + Request.QueryString["id"];
                OleDbParameter[] param = new OleDbParameter[1];
                param[0] = new OleDbParameter("@admin_pwd", OleDbType.VarChar, 50);
                param[0].Value = nnpwd;
                sqlhelper.ExecuteNonQuery(CommandType.Text, upsql, param);
                sqlhelper.alert("修改成功", "sys_admin.aspx");
            }
            else
            {
                sqlhelper.alert("原密码不正确", "chang_pwd.aspx?id=" + Request.QueryString["id"].ToString() + "&users=" + Request.QueryString["users"].ToString());
            }
        }
    }

    protected void upadminfanhui_Click(object sender, EventArgs e)
    {
        Response.Redirect("sys_admin.aspx");
    }
}
