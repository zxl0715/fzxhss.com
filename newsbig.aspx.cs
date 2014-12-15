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

public partial class newsbig : System.Web.UI.Page
{
    public  int n_id = 0;
    public  string n_time = "";
    public  string n_name = "";
    public  string n_c = "";
    public  string pro_img = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            string sql = "select * from news where new_id =" + Convert.ToInt32(Request["id"]);
            DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
            n_id = Convert.ToInt32(dt.Rows[0]["new_id"]);
            n_time = "发布时间：" + Convert.ToDateTime(dt.Rows[0]["time"]).ToString("yyyy-MM-dd HH:mm:ss");

            n_name = Convert.ToString(dt.Rows[0]["name"]);
            n_c = Convert.ToString(dt.Rows[0]["content_en"]);

            if (!string.IsNullOrEmpty(dt.Rows[0]["pro_img"].ToString()))
            {
                pro_img = "<div class=\"case_view\" style=\"width: 100%;\"><img src=\"admin/file/" + dt.Rows[0]["pro_img"].ToString() + "\" border=\"0\"></div>";
            }
        }
        else
        {
            Response.Redirect("newsPage.html");
        }
    }
}
