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
using System.Web.SessionState;

public partial class about : System.Web.UI.Page
{
    public string cont3 = "", abouttitle;
    protected string sql;
    public int aboutid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"] != "")
        {
            sql = "select * from jibenlanmu where id = " + Convert.ToInt32(Request.QueryString["id"]);
        }
        else if (Request.QueryString["id"] == null)
        {
            sql = "select * from jibenlanmu where id = 4";
        }
        if (sql != "")
        {
            DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
            if (dt.Rows.Count > 0)
            {
                cont3 = Convert.ToString(dt.Rows[0]["content"]);
                abouttitle = Convert.ToString(dt.Rows[0]["title"]);
                aboutid = Convert.ToInt32(dt.Rows[0]["id"]);
            }
        }

        DataTable dtCompanyInfo = companyinfo.getcompanyinfo();
        if (dtCompanyInfo.Rows.Count > 0)
        {
            ltxtProfile.Text = dtCompanyInfo.Rows[0]["profile"].ToString();
        }
    }
}
