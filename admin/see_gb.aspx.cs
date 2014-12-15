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
using System.Text.RegularExpressions;

public partial class admin_see_gb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        string strsql2 = "select * from guestbook where id =" + Request["id"];
        OleDbDataReader sdr;
        sdr = sqlhelper.ExecuteReader(CommandType.Text, strsql2, null);
        sdr.Read();
        TextBox1.Text = Convert.ToString(sdr["title"]);
        TextBox2.Text = Convert.ToString(sdr["lianxiren"]);
        TextBox3.Text = Convert.ToString(sdr["email"]);
        TextBox4.Text = Convert.ToString(sdr["tel"]);
        TextBox5.Text = Convert.ToString(sdr["compamyname"]);
        TextBox6.Text = Convert.ToString(sdr["site"]);
        TextBox7.Text = Convert.ToString(sdr["fax"]);
        TextBox8.Text = Convert.ToString(sdr["times"]);
        TextBox9.Text = Convert.ToString(sdr["content"]);
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["urls"] != null)
        {
            sqlhelper.locationhref(Request.QueryString["urls"].ToString());
        }
    }
}
