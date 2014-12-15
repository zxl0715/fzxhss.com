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

public partial class server : System.Web.UI.Page
{
    public static string cont2 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "select * from jibenlanmu where id = 1";
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
        cont2 = Convert.ToString(dt.Rows[0]["content"]);


        DataTable dtCompanyInfo = companyinfo.getcompanyinfo();
        if (dtCompanyInfo.Rows.Count > 0)
        {
            ltxtServer.Text = dtCompanyInfo.Rows[0]["pro_se"].ToString();
        }
    }
}
