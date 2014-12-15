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
using System.IO;
using System.Drawing;

public partial class admin_add_zhaopin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            xu.Value = sqlhelper.getmaxxu("job", "xu", 1).ToString();
            riqi.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int tj = 0;
        if (istuijian.Checked)
        {
            tj = 1;
        }
        string time = DateTime.Now.ToShortDateString().ToString();
        string strsql = "insert into job(xu,jobname,rens,age,zhuanye,xueli,sex,starttimes,endtimes,yaoqiu,daiyu,fabu,[time]) values" + "(" + xu.Value + "," + "'" + name.Value + "'," + "'" + rens.Value + "'," + "'" + age.Value + "'," + "'" + zhuanye.Value + "'," + "'" + xueli.Value + "'," + "'" + sex.Text + "'," + "'" + riqi.Text + "'," + "'" + riqi2.Text + "'," + "'" + yaoqiu.Text + "'," + "'" + daiyu.Text + "'," + tj + ",'" + time + "')";
        sqlhelper.ExecuteNonQuery(CommandType.Text,strsql, null);
        sqlhelper.alert("添加成功", "add_zhaopin.aspx");
    }
}
