using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using wzwebsite;

public partial class admin_aboutUS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dtCompanyInfo = companyinfo.getcompanyinfo();
            if (dtCompanyInfo.Rows.Count > 0)
            {
                this.profile.Text = dtCompanyInfo.Rows[0]["profile"].ToString();

            }
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string profileValue = profile.Text;
        companyinfo.editCompanyInfoProfile(profileValue);
        sqlhelper.alert("修改成功");
    }
}