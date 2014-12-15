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

public partial class admin_editzhaopin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string sql1 = "select * from job where id=" + Convert.ToInt32(Request.QueryString["id"].ToString());
            DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql1, null);
            xu.Value =Convert.ToString(dt.Rows[0]["xu"]);
            name.Value =dt.Rows[0]["jobname"].ToString();
            rens.Value =dt.Rows[0]["rens"].ToString();
            age.Value=dt.Rows[0]["age"].ToString();
            zhuanye.Value=dt.Rows[0]["zhuanye"].ToString();
            xueli.Value=dt.Rows[0]["xueli"].ToString();
            sex.Text=dt.Rows[0]["sex"].ToString();
            riqi.Text = Convert.ToDateTime(dt.Rows[0]["starttimes"]).ToString("yyyy-MM-dd HH:mm:ss");
            riqi2.Text = Convert.ToDateTime(dt.Rows[0]["endtimes"]).ToString("yyyy-MM-dd HH:mm:ss");
            yaoqiu.Text=dt.Rows[0]["yaoqiu"].ToString();
            daiyu.Text = dt.Rows[0]["daiyu"].ToString();
            if (Convert.ToInt32(dt.Rows[0]["fabu"].ToString()).Equals(1))
            {
                istuijian.Checked = true;
            }


        }
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        int fabu = 0;
        if (istuijian.Checked)
        {
            fabu = 1;
        }
        int id = Convert.ToInt32(Request.QueryString["id"]);
        string sql2 = "update job set xu =" + xu.Value + "," + "jobname = '" + name.Value + "'," + "rens = '" + rens.Value + "'," + "age ='" + age.Value + "'," + "zhuanye ='" + zhuanye.Value + "'," + "xueli = '" + xueli.Value + "'," + "sex ='" + sex.Text + "'," + "starttimes ='" + riqi.Text + "'," + "endtimes ='" + riqi2.Text + "'," + "yaoqiu ='" + yaoqiu.Text + "'," + "daiyu ='" + daiyu.Text + "'," + "fabu =" + fabu + " where id =" + id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql2, null);
        sqlhelper.locationhref(Request.QueryString["urls"].ToString());
    } protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["urls"] != null)
        {
            sqlhelper.locationhref(Request.QueryString["urls"].ToString());
        }
    }
}
