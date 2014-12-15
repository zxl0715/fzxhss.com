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

public partial class MasterPage : System.Web.UI.MasterPage
{
    public ArrayList arr = new ArrayList();
    public ArrayList arr2 = new ArrayList();
    public ArrayList arr3 = new ArrayList();
    string currurl = sqlhelper.cupage().ToString();
    public int i = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //Page.Title = sqlhelper.getwebtitle();
        //if (currurl.IndexOf("about") > -1)
        //{
        //    Panel1.Visible = true;
        //}
        
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    if (r1.Checked) {
    //        Response.Redirect("pro2-" + kw.Value + ".html");
    //    }
    //    if (r2.Checked) {
    //        Response.Redirect("news-"+kw.Value+".html");
    //    }
    //}
    public int getname(int a1){
        
        arr.Add(Convert.ToString(a1));
        return a1;
    }
    public string getcode(string b1)
    {

        arr2.Add(Convert.ToString(b1));
        return b1;
    }
    
    public string GetValueByKey(string wKey, string fTable, string wStr)
    {
        try
        {
            return sqlhelper.GetDataTable(CommandType.Text, "select " + wKey + " from " + fTable + " where " + wStr, null).Rows[0][0].ToString();

        }
        catch (Exception)
        {
            return "";
        }
    }
}
