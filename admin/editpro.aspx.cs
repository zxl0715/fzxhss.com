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

public partial class admin_editpro : manage_c
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getdrolist();
        if (!Page.IsPostBack)
        {
            products.pro_id = Convert.ToInt32(Request.QueryString["id"].ToString());
            products.showpro();
            ///P_Name.Value = products.title;
            /// P_jiankuo.Value = products.jiankuo;
            imgurl.Value = products.proimg;
            /// content.Text = products.content;
            if (products.istuijian.Equals(1))
            {
                istuijian.Checked = true;
            }
            P_Hits.Value = products.hits.ToString();
            p_xu.Value = products.orders.ToString();
            ddlClass.SelectedValue = products.columnid.ToString();
            /// P_keys.Value = products.keys;
            P_Name_En.Value = products.names;
            P_jiankuo_en.Value = products.content;
            content_en.Text = products.content_en;
            riqi.Text = products.times.ToString("yyyy-MM-dd HH:mm:ss");
        }
    }
    protected void getdrolist()
    {
        DataTable dt;
        dt = sqlhelper.GetDataTable(CommandType.Text, "select id,title,code from [p_class] where Type=0 order by code", null);
        ListItem li;
        li = new ListItem();
        //li.Value = "0";
        //li.Text = "不选";
        //ddlClass.Items.Add(li);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            li = new ListItem();
            li.Value = dt.Rows[i][0].ToString();

            li.Text = getColumnListName(dt.Rows[i][1].ToString(), dt.Rows[i][2].ToString());
            ddlClass.Items.Add(li);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int tj = 0;
        if (istuijian.Checked)
        {
            tj = 1;
        }
        products.proimg = imgurl.Value;
        products.istuijian = tj;
        products.hits = Convert.ToInt32(P_Hits.Value);
        products.orders = Convert.ToInt32(p_xu.Value);
        products.columnid = Convert.ToInt32(ddlClass.SelectedValue);
        products.names = P_Name_En.Value;//5+1+a+s+p+x
        products.content = P_jiankuo_en.Value;
        products.content_en = content_en.Text;
        products.times = Convert.ToDateTime(riqi.Text);
        products.pro_id = Convert.ToInt32(Request.QueryString["id"]);
        products.editpro();
        sqlhelper.locationhref(Request.QueryString["urls"].ToString());
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["urls"] != null)
        {
            sqlhelper.locationhref(Request.QueryString["urls"].ToString());//5+1+a+s+p+x
        }
    }
}
