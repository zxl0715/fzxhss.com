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

public partial class admin_see_jb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strsql = "select * from jobbook where id =" + Request["id"];
        OleDbDataReader sdr;
        sdr = sqlhelper.ExecuteReader(CommandType.Text, strsql, null);
        sdr.Read();
        if (Convert.ToInt32(Convert.ToString(sdr["sex"])).Equals(0)) {
            sex.Value = "男";
        }else{
            sex.Value = "女";
        }
        if (Convert.ToInt32(Convert.ToString(sdr["marriage"])).Equals(0))
        {
            marriage.Value = "否";
        }
        else
        {
            marriage.Value = "是";
        }

        jobid.Value = getjobname(Convert.ToString(sdr["jobid"]));
        xingming.Value = Convert.ToString(sdr["xingming"]);
        //sex.Value = Convert.ToString(sdr["sex"]);
        age.Value = Convert.ToString(sdr["age"]);
        //marriage.Value = Convert.ToString(sdr["marriage"]);
        school.Value = Convert.ToString(sdr["school"]);
        xueli.Value = Convert.ToString(sdr["xueli"]);
        zhuanye.Value = Convert.ToString(sdr["zhuanye"]);
        biyetime.Value = Convert.ToDateTime(sdr["biyetime"]).ToShortDateString().ToString();
        phone.Value = Convert.ToString(sdr["phone"]);
        email.Value = Convert.ToString(sdr["email"]);
        qtyq.Text = Convert.ToString(sdr["qtyq"]);
        addtime.Value = Convert.ToDateTime(sdr["addtime"]).ToShortDateString().ToString();
        addr.Value = Convert.ToString(sdr["addr"]);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["urls"] != null)
        {
            sqlhelper.locationhref(Request.QueryString["urls"].ToString());
        }
    }
    public string getjobname(string id)
    {
        string sql2 = "select jobname from job where id=" + id;
        return sqlhelper.ExecuteScalar(CommandType.Text, sql2, null).ToString();
    }
}
