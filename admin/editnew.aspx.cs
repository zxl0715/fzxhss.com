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


public partial class admin_editnew : manage_c
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getdrolist();
        if (!Page.IsPostBack)
        {
            news.new_id = Convert.ToInt32(Request.QueryString["id"].ToString());
            news.shownews();
            ///P_Name.Value = news.title;
            /// P_jiankuo.Value = news.jiankuo;
            imgurl.Value = news.proimg;
            /// content.Text = news.content;
            if (news.istuijian.Equals(1))
            {
                istuijian.Checked = true;
            }
            P_Hits.Value = news.hits.ToString();
            p_xu.Value = news.orders.ToString();
            ddlClass.SelectedValue = news.columnid.ToString();
            /// P_keys.Value = news.keys;
            P_Name_En.Value = news.names;
            P_jiankuo_en.Value = news.content;
            content_en.Text = news.content_en;
            riqi.Text = news.times.ToString("yyyy-MM-dd HH:mm:ss");
        }
    }
    protected void getdrolist()
    {
        DataTable dt;
        dt = sqlhelper.GetDataTable(CommandType.Text, "select id,title,code from [n_class] order by code", null);
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
        news.proimg = imgurl.Value;
        news.istuijian = tj;
        news.hits = Convert.ToInt32(P_Hits.Value);
        news.orders = Convert.ToInt32(p_xu.Value);
        news.columnid = Convert.ToInt32(ddlClass.SelectedValue);
        news.names = P_Name_En.Value;
        news.content = P_jiankuo_en.Value;
        news.content_en = content_en.Text;
        news.times = Convert.ToDateTime(riqi.Text);
        news.new_id = Convert.ToInt32(Request.QueryString["id"]);
        news.editnews();
        sqlhelper.locationhref(Request.QueryString["urls"].ToString());
    }
    protected void chongtian_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["urls"] != null)
        {
            sqlhelper.locationhref(Request.QueryString["urls"].ToString());
        }
    }
}
