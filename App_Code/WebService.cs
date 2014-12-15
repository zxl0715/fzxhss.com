using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data;
using System.Data.OleDb;
using AjaxControlToolkit;
using System.Configuration;
using wzwebsite;

/// <summary>
/// WebService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    //[WebMethod]
    //public string HelloWorld() {
    //    return "Hello World";
    //}
    [WebMethod]
    public string[] getxinwenlist(string prefixText, int count)
    {
        string mysql = "select sel from News where sel like" + "'" + prefixText + "%'";
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, mysql, null);
        string[] returnvalue = new string[dt.Rows.Count];
        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            returnvalue[i - 1] = dt.Rows[i - 1][0].ToString();
        }
        return (returnvalue);
    }

    [WebMethod]
    public string[] getproductlist(string prefixText, int count)
    {
        string mysql = "select sel from Products where sel like" + "'" + prefixText + "%'";
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, mysql, null);
        string[] returnvalue = new string[dt.Rows.Count];
        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            returnvalue[i - 1] = dt.Rows[i - 1][0].ToString();
        }
        return (returnvalue);
    }

    [WebMethod(Description = "求积的方法")]
    public double multiplication(double i, double j)
    {

        return i * j;

    }   

}

