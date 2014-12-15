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
public partial class probig : System.Web.UI.Page
{
    public static int p_id = 0;
    public static string p_i = "";
    public static string p_name = "";
    public static string p_c = "";
    public string pageUp = string.Empty;
    public string pageNext = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            string sql = "select * from product where pro_id =" + Convert.ToInt32(Request["id"]);
            DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
            p_id = Convert.ToInt32(dt.Rows[0]["pro_id"]);
            p_i = getfirst(Convert.ToString(dt.Rows[0]["pro_img"]));
            p_name = Convert.ToString(dt.Rows[0]["name"]);
            p_c = Convert.ToString(dt.Rows[0]["content_en"]);
            //AccessDataSource3.SelectCommand = "SELECT TOP 4 * FROM [product] where columnid =(select columnid from product where pro_id =" + Convert.ToInt32(Request["id"]) + ")";
            //DataList1.DataSource = AccessDataSource3;
            //DataList1.DataBind();


            pageUp = products.GetProductsUpOrNext(p_id.ToString(), "0");

            pageNext = products.GetProductsUpOrNext(p_id.ToString(), "1");
        }
        else
        {
            Response.Redirect("pro.html");
        }

    }
    public string getfirst(string img)
    {
        string[] arrayStr = img.Split('|');
        try
        {
            return arrayStr[1];
        }
        catch
        {
            return "err_img.jpg";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("contactus.html?dd=" + p_name);
    }
}
