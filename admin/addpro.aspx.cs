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
using wzwebsite;
using System.IO;
using System.Drawing;

public partial class addpro : manage_c
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            getdrolist();
            p_xu.Value = sqlhelper.getmaxxu("product", "order", 1).ToString();
            riqi.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int tj = 0;
        if (istuijian.Checked)
        {
            tj = 1;
        }

        int isinx = 0;
        if (isindex.Checked)
        {
            isinx = 1;
        } 
        products.columnid = Convert.ToInt32(ddlClass.SelectedValue);
        products.orders = Convert.ToInt32(p_xu.Value);
        products.names = P_Name_En.Value;
        products.content = content.Value;
        products.hits = Convert.ToInt32(P_Hits.Value);
        products.times = Convert.ToDateTime(riqi.Text);
        products.proimg = imgurl.Value;
        products.istuijian = Convert.ToInt32(tj);
        products.content_en = content_en.Text;
        products.Type = 0;
        products.addpro();
        sqlhelper.alert("添加成功", "addpro.aspx");
    }
    protected void getdrolist()
    {
        DataTable dt;
        dt = sqlhelper.GetDataTable(CommandType.Text, "select id,title,code from [p_class] order by code", null);
        ListItem li;
        li = new ListItem();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
           
            li = new ListItem();
            li.Value = dt.Rows[i][0].ToString();

            li.Text = getColumnListName(dt.Rows[i][1].ToString(), dt.Rows[i][2].ToString());
            ddlClass.Items.Add(li);
            
        }
    }
}
