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

public partial class index : System.Web.UI.Page
{
    public static string cont = "";
    public static string cont2 = "";
    public static string cont3 = "";
    public static int cont4;
    public DataTable dtProduct = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PageInit();
            xinwenlistband();
        }
    }

    private void PageInit()
    {
        string sql = "select * from jibenlanmu where id = 3";
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
        cont = Convert.ToString(dt.Rows[0]["content"]);
        string sql2 = "select top 1 * from news order by [order] desc";
        DataTable dt2 = sqlhelper.GetDataTable(CommandType.Text, sql2, null);
        cont2 = Convert.ToString(dt2.Rows[0]["name"]);
        cont3 = Convert.ToString(dt2.Rows[0]["content_en"]);
        cont4 = Convert.ToInt32(dt2.Rows[0]["new_id"]);

        string sqlProduct = "select top 6 * from product where Type=0 and istuijian =1 order by [order]";
        dtProduct = sqlhelper.GetDataTable(CommandType.Text, sqlProduct, null);
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

    protected void xinwenlistband()
    {
        string sql = "";
        DataSet ds;
        sql = "select top 6 [new_id],[time],[name] from [news] order by [time] desc";

        DataTable dt = new DataTable();
        ds = sqlhelper.GetDataSet(CommandType.Text, sql, null);
        DataTable TakeTop = ds.Tables[0].AsEnumerable().Take(6).CopyToDataTable<DataRow>();//获取6条数据

        DataList1.DataSource = TakeTop;
        DataList1.DataBind();
    }
}
