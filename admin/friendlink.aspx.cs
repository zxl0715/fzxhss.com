using System;
using System.Collections;
using System.Configuration;
using System.Data;
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

public partial class admin_friendlink : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            band();
        del();
    }

    protected void del()
    {
        if (Request.QueryString["action"] != null)
        {
            firend_links.dellink(Request.QueryString["id"].ToString());
            sqlhelper.locationhref(Request.QueryString["urls"].ToString());
        }
    }

    protected void band()
    {
        PagedDataSource pds = new PagedDataSource();
        pds.AllowPaging = true;
        pds.PageSize = AspNetPager1.PageSize;
        pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;
        DataSet ds;
        if (Request.QueryString["typeid"] != null)
        {
            ds = firend_links.linklist(Request.QueryString["typeid"].ToString());
        }
        else
        {
            ds = firend_links.linklist(string.Empty);
        }
        pds.DataSource = ds.Tables[0].DefaultView;
        AspNetPager1.RecordCount = ds.Tables[0].Rows.Count;
        friendlinks.DataSource = pds;
        friendlinks.DataBind();
    }


    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        band();
    }

    

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Form["fid"] != null)
        {
            string ids = Request.Form["fid"].ToString();
            firend_links.dellink(ids);
            sqlhelper.alert("删除成功", sqlhelper.cupage());
        }
        else
        {
            sqlhelper.alert("请选择", sqlhelper.cupage());
        }
    }

    protected string getlinkimg(string id)
    {
        string imgs = sqlhelper.ExecuteScalar(CommandType.Text, "select link_photo from friend_links where id=" + id, null).ToString();
        if (!string.IsNullOrEmpty(imgs))
        {
            StringBuilder imgurls = new StringBuilder();
            imgurls.Append(" <img width=\"122\" height=\"44\" src=\" ");
            imgurls.Append("/"+imgs);
            imgurls.Append(" \"/> ");
            return imgurls.ToString();
        }
        else
        {
            return "";
        }
    }

    
   
}

