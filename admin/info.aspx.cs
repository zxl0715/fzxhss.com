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

public partial class admin_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataTable dt = webinfor.getwebinfor();
            if (dt.Rows.Count > 0)
            {
                //this.Web_Name.Value = dt.Rows[0]["Web_Name"].ToString();
                this.sitename.Value = dt.Rows[0]["sitename"].ToString();

                this.sitefoot.Value = dt.Rows[0]["sitefoot"].ToString();
                this.keyword.Value = dt.Rows[0]["keyword"].ToString();
                /// this.Web_dis.Value = dt.Rows[0]["web_miaoshu"].ToString();
                this.iswatermark.Text = dt.Rows[0]["iswatermark"].ToString();
                ///this.Web_Add.Value = dt.Rows[0]["web_addr"].ToString();
                this.watermark.Value = dt.Rows[0]["watermark"].ToString();
                /// this.Web_Lxr.Value = dt.Rows[0]["web_lianxiren"].ToString();
            }
                
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        webinfor.edit(sitename.Value,sitefoot.Value,keyword.Value,iswatermark.Text,watermark.Value);
        sqlhelper.alert("修改成功");
    }
}
