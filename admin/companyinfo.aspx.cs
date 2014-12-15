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

public partial class admin_companyinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataTable dt = companyinfo.getcompanyinfo();
            if (dt.Rows.Count > 0)
            {
                
                this.companyname.Value = dt.Rows[0]["companyname"].ToString();
                this.pro_se.Value = dt.Rows[0]["pro_se"].ToString();
                this.address.Value = dt.Rows[0]["address"].ToString();
                this.zip.Value = dt.Rows[0]["zip"].ToString();
                this.tel.Value = dt.Rows[0]["tel"].ToString();
                this.fax.Value = dt.Rows[0]["fax"].ToString();
                this.shouji.Value = dt.Rows[0]["shouji"].ToString();
                this.site.Value = dt.Rows[0]["site"].ToString();
                this.farendaibiao.Value = dt.Rows[0]["farendaibiao"].ToString();
                this.number.Value = dt.Rows[0]["number"].ToString();
                this.model.Text = dt.Rows[0]["model"].ToString();
                this.profile.Text = dt.Rows[0]["profile"].ToString();
                this.msn.Value = dt.Rows[0]["msn"].ToString();
                this.qq.Value = dt.Rows[0]["qq"].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        companyinfo.editc(companyname.Value,pro_se.Value,address.Value,zip.Value,tel.Value,fax.Value,shouji.Value,site.Value,farendaibiao.Value,number.Value,model.Text,profile.Text,msn.Value,qq.Value);
        sqlhelper.alert("修改成功");
    }
}
