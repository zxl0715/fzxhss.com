using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using wzwebsite;

public partial class admin_services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dtCompanyInfo = companyinfo.getcompanyinfo();
            if (dtCompanyInfo.Rows.Count > 0)
            {
                this.profileServer.Text = dtCompanyInfo.Rows[0]["pro_se"].ToString();

            }
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string profileValue = profileServer.Text;
        companyinfo.editCompanyInfoServer(profileValue);
        sqlhelper.alert("修改成功");
    }
}