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

public partial class contact : System.Web.UI.Page
{
    public static string cont = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "select * from jibenlanmu where id = 2";
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
        cont = Convert.ToString(dt.Rows[0]["content"]);//5|1|a|s|p|x
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        bool resutl = guestbook.addbook(0, 0, txtTitle.Text.Trim(), txtlianxiren.Text.Trim(), txtEmail.Text.Trim(), txtPhone.Text.Trim(), txtContent.Value.Trim(), txtcompany.Text.Trim(), txtCompanyUrl.Text.Trim(), txtfax.Text.Trim());

        if (resutl)
        {
            sqlhelper.alert("提交成功,感谢你的留言！");
            txtTitle.Text = string.Empty;
            txtlianxiren.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtContent.Value = string.Empty;
            txtcompany.Text = string.Empty;
            txtCompanyUrl.Text = string.Empty;
            txtfax.Text = string.Empty;
        }
        else
        {
            sqlhelper.alert("提交失败！");
        }
    }
}
