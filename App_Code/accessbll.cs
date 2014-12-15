using System;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Security;
using System.Text;
using System.Collections.Generic;
using wzwebsite;
using jmail;
using System.Drawing;
using System.IO;



public static class sys_admin
{
    public static DataTable getuserlist()
    {
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from admin order by id desc", null);
        return dt;
    }

    public static DataTable viewuserinfo(int id)
    {
        string viewusers = "select * from admin where id=@id";
        OleDbParameter[] chanshus = new OleDbParameter[1];
        chanshus[0] = new OleDbParameter("@id", OleDbType.Integer);
        chanshus[0].Value = id;
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, viewusers, chanshus);
        return dt;
    }




    public static void adduser(string u, string pwd)
    {
        string chausers = "select admin_name from admin where admin_name=@admin_name";
        OleDbParameter[] chayonghu = new OleDbParameter[1];
        chayonghu[0] = new OleDbParameter("@admin_name", OleDbType.VarChar);
        chayonghu[0].Value = u;

        DataTable isrows = sqlhelper.GetDataTable(CommandType.Text, chausers, chayonghu);

        if (isrows.Rows.Count == 0)
        {
            string pwd2 = FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "md5");
            string sql = "insert into admin (admin_name,admin_pwd) values(@admin_name,@admin_pwd)";
            OleDbParameter[] chans = new OleDbParameter[2];
            chans[0] = new OleDbParameter("@admin_name", OleDbType.VarChar);
            chans[1] = new OleDbParameter("@admin_pwd", OleDbType.VarChar);

            chans[0].Value = u;
            chans[1].Value = pwd2;

            sqlhelper.ExecuteNonQuery(CommandType.Text, sql, chans);
        }
        else
        {
            sqlhelper.alert("用户名重复");
        }
    }

    public static void deluser(int id)
    {
        string deluser = "delete from admin where id=@id";
        OleDbParameter[] chanshus = new OleDbParameter[1];
        chanshus[0] = new OleDbParameter("@id", OleDbType.Integer);
        chanshus[0].Value = id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, deluser, chanshus);
    }

    public static bool chklogin(string u, string p)
    {
        string sql = "select * from admin where admin_name=@username and admin_pwd=@pwd";
        OleDbParameter[] param = new OleDbParameter[2];
        param[0] = new OleDbParameter("@username", OleDbType.VarChar);
        param[1] = new OleDbParameter("@pwd", OleDbType.VarChar);
        param[0].Value = u;
        param[1].Value = FormsAuthentication.HashPasswordForStoringInConfigFile(p, "md5");
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, param);
        if (dt.Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }


}//网站管理员

public static class content_manager //网站基本栏目
{
    public static DataTable getalllanmu()
    {
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from jhibenlanmu", null);
        return dt;
    }

    public static void addlanmu(string mc, int flag)
    {
        string sql = "insert into jibenlanmu (title,flag) values(@title,@flag)";
        OleDbParameter[] chans = new OleDbParameter[2];
        chans[0] = new OleDbParameter("@title", OleDbType.VarChar);
        chans[0].Value = mc;
        chans[1] = new OleDbParameter("@flag", OleDbType.Integer);
        chans[1].Value = flag;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, chans);
    }

    public static void dellanmu(int id)
    {
        string sql = "delete from web_lanmu where id=" + id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
    }

    public static DataTable getlanluinfo(int id)
    {
        string sql = "select * from jibenlanmu where id=" + id;
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
        return dt;
    }

    public static void editlanmu(int id, string mc, int flag)
    {
        string sql = "update jibenlanmu set title=@title,flag=@flag where id=@id";
        OleDbParameter[] chans = new OleDbParameter[3];
        chans[0] = new OleDbParameter("@title", OleDbType.VarChar);
        chans[1] = new OleDbParameter("@flag", OleDbType.Integer);
        chans[2] = new OleDbParameter("@id", OleDbType.Integer);
        chans[0].Value = mc;
        chans[1].Value = flag;
        chans[2].Value = id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, chans);
    }

    public static void setzhi(int id, string content)
    {
        string sql = "update jibenlanmu set content=@content where id=@id";
        OleDbParameter[] chans = new OleDbParameter[2];
        chans[0] = new OleDbParameter("@content", OleDbType.LongVarChar);
        chans[1] = new OleDbParameter("@id", OleDbType.Integer);
        chans[0].Value = content;
        chans[1].Value = id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, chans);
    }

}

public static class news_class  //新闻类别
{
    private static int n_id, n_xu;
    private static string n_ClassName, n_E_ClassName;

    public static int id
    {
        get { return n_id; }
        set
        { n_id = value; }
    }

    public static int xu
    {
        get
        { return n_xu; }
        set
        { n_xu = value; }
    }

    public static string classname
    {
        get
        { return n_ClassName; }
        set
        {
            n_ClassName = value;
        }
    }

    public static string e_classname
    {
        get
        { return n_E_ClassName; }
        set
        {
            n_E_ClassName = value;
        }
    }

    public static DataTable getalllanmu()
    {
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from n_class order by xu desc", null);
        return dt;
    }

    public static void editclass()
    {
        string sql = "update n_class set ClassName=@ClassName,E_ClassName=@E_ClassName,Xu=@Xu where id=@id";
        OleDbParameter[] chans = new OleDbParameter[4];
        chans[0] = new OleDbParameter("@ClassName", OleDbType.VarChar);
        chans[1] = new OleDbParameter("@E_ClassName", OleDbType.VarChar);
        chans[2] = new OleDbParameter("@xu", OleDbType.Integer);
        chans[3] = new OleDbParameter("@id", OleDbType.Integer);
        chans[0].Value = classname;
        chans[1].Value = e_classname;
        chans[2].Value = xu;
        chans[3].Value = id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, chans);
    }

    public static void addclass()
    {
        string sql = "insert into n_class (ClassName,E_ClassName,xu) values(@ClassName,@E_ClassName,@xu)";
        OleDbParameter[] chans = new OleDbParameter[3];
        chans[0] = new OleDbParameter("@ClassName", OleDbType.VarChar);
        chans[1] = new OleDbParameter("@E_ClassName", OleDbType.VarChar);
        chans[2] = new OleDbParameter("@xu", OleDbType.Integer);
        chans[0].Value = classname;
        chans[1].Value = e_classname;
        chans[2].Value = xu;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, chans);
    }

    public static void delclass()
    {
        string sql = "delete from n_class where id=@id";
        OleDbParameter[] chans = new OleDbParameter[1];
        chans[0] = new OleDbParameter("@id", OleDbType.Integer);
        chans[0].Value = id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, chans);
    }
}

public static class news //新闻
{
    private static int n_new_id, n_columnid, n_istuijian, n_hits, n_order;
    private static string n_name, n_content, n_content_en, n_proimg;
    private static DateTime n_time;


    public static int new_id
    {
        get
        {
            return n_new_id;
        }
        set
        {
            n_new_id = value;
        }
    }
    public static int columnid
    {
        get
        {
            return n_columnid;
        }
        set
        {
            n_columnid = value;
        }
    }


    public static int orders
    {
        get
        {
            return n_order;
        }
        set
        {
            n_order = value;
        }
    }

    public static string names
    {
        get
        {
            return n_name;
        }
        set
        {
            n_name = value;
        }
    }

    public static string content
    {
        get
        {
            return n_content;
        }
        set
        {
            n_content = value;
        }
    }

    public static int hits
    {
        get
        {
            return n_hits;
        }
        set
        {
            n_hits = value;
        }
    }

    public static DateTime times
    {
        get
        {
            return n_time;
        }
        set
        {
            n_time = value;
        }
    }

    public static string proimg
    {
        get
        {
            return n_proimg;
        }
        set
        {
            n_proimg = value;
        }
    }

    public static int istuijian
    {
        get
        {
            return n_istuijian;
        }
        set
        {
            n_istuijian = value;
        }
    }

    public static string content_en
    {
        get
        {
            return n_content_en;
        }
        set
        {
            n_content_en = value;
        }
    }


    public static void addnews()
    {
        StringBuilder chsql = new StringBuilder();
        chsql.Append("INSERT INTO news ([columnid],[order],[name],[content],[hits],[time],[pro_img] ,[istuijian] ,[content_en]) ");
        chsql.Append("VALUES ([@columnid], [@orders], [@names], [@content],[@hits],[@times],[@proimg],[@istuijian],[@content_en])");
        OleDbParameter[] param = new OleDbParameter[9];

        param[0] = new OleDbParameter("@columnid", OleDbType.Integer);
        param[1] = new OleDbParameter("@orders", OleDbType.Integer);
        param[2] = new OleDbParameter("@names", OleDbType.VarChar);
        param[3] = new OleDbParameter("@content", OleDbType.VarChar);
        param[4] = new OleDbParameter("@hits", OleDbType.Integer);
        param[5] = new OleDbParameter("@times", OleDbType.Date);
        param[6] = new OleDbParameter("@proimg", OleDbType.VarChar);
        param[7] = new OleDbParameter("@istuijian", OleDbType.Integer);
        param[8] = new OleDbParameter("@content_en", OleDbType.VarChar);


        param[0].Value = columnid;
        param[1].Value = orders;
        param[2].Value = names;
        param[3].Value = content;
        param[4].Value = hits;
        param[5].Value = times;
        param[6].Value = proimg;
        param[7].Value = istuijian;
        param[8].Value = content_en;
        sqlhelper.ExecuteNonQuery(CommandType.Text, chsql.ToString(), param);
    }

    public static void editnews()
    {
        StringBuilder chsql = new StringBuilder();
        chsql.Append("UPDATE news SET [columnid] =@columnid , [order]=@orders, [name]=@names, [content]=@content, [hits] =@hits , [time] =@times ,");
        chsql.Append("[pro_img] =@proimg , [istuijian] =@istuijian , [content_en]=@content_en where [new_id]=@id");
        OleDbParameter[] param = new OleDbParameter[10];
        param[0] = new OleDbParameter("@columnid", OleDbType.Integer);
        param[1] = new OleDbParameter("@orders", OleDbType.Integer);
        param[2] = new OleDbParameter("@names", OleDbType.VarChar);
        param[3] = new OleDbParameter("@content", OleDbType.VarChar);
        param[4] = new OleDbParameter("@hits", OleDbType.Integer);
        param[5] = new OleDbParameter("@times", OleDbType.Date);
        param[6] = new OleDbParameter("@proimg", OleDbType.VarChar);
        param[7] = new OleDbParameter("@istuijian", OleDbType.Integer);
        param[8] = new OleDbParameter("@content_en", OleDbType.VarChar);
        param[9] = new OleDbParameter("@id", OleDbType.Integer);

        param[0].Value = columnid;
        param[1].Value = orders;
        param[2].Value = names;
        param[3].Value = content;
        param[4].Value = hits;
        param[5].Value = times;
        param[6].Value = proimg;
        param[7].Value = istuijian;
        param[8].Value = content_en;
        param[9].Value = new_id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, chsql.ToString(), param);
    }

    public static void shownews()
    {
        string sql = "select * from news where new_id=@new_id";
        OleDbParameter[] param = new OleDbParameter[1];
        param[0] = new OleDbParameter("@new_id", OleDbType.Integer);
        param[0].Value = new_id;
        //throw new Exception("id=" + id);

        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, param);
        news.columnid = Convert.ToInt32(dt.Rows[0]["columnid"].ToString());
        //throw new Exception("products.title=" + products.title);
        news.orders = Convert.ToInt32(dt.Rows[0]["order"].ToString());
        news.names = dt.Rows[0]["name"].ToString();
        news.content = dt.Rows[0]["content"].ToString();
        news.hits = Convert.ToInt32(dt.Rows[0]["hits"].ToString());
        news.times = Convert.ToDateTime(dt.Rows[0]["time"].ToString());
        news.proimg = dt.Rows[0]["pro_img"].ToString();
        news.istuijian = Convert.ToInt32(dt.Rows[0]["istuijian"].ToString());
        news.content_en = dt.Rows[0]["content_en"].ToString();
    }

    public static void delnews(string ids)
    {
        string sql = "delete from news where new_id in(" + ids + ")";
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
    }

    public static void changhits(string zhi)
    {
        string sql = "update news set N_Hits=N_Hits+" + zhi;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
    }

    public static void movenews(int id, int xu, string action)
    {
        int up_xu = 0, down_xu = 0, up_id = 0, down_id = 0;
        string upsql = "select * from news where id>" + id + " order by n_x";
        string downsql = "select * from news where id<" + id + " order by n_x desc";
        DataTable update = sqlhelper.GetDataTable(CommandType.Text, upsql, null);
        DataTable downdate = sqlhelper.GetDataTable(CommandType.Text, downsql, null);
        if (update.Rows.Count != 0)
        {
            up_xu = Convert.ToInt32(update.Rows[0]["n_x"].ToString());
            up_id = Convert.ToInt32(update.Rows[0]["id"].ToString());
        }

        if (downdate.Rows.Count != 0)
        {
            down_xu = Convert.ToInt32(downdate.Rows[0]["n_x"].ToString());
            down_id = Convert.ToInt32(downdate.Rows[0]["id"].ToString());
        }

        if (action.Equals("up"))
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, "update news set n_x=" + up_xu + " where id=" + id, null);
            sqlhelper.ExecuteNonQuery(CommandType.Text, "update news set n_x=" + xu + " where id=" + up_id, null);

            //sqlhelper.ExecuteNonQuery(CommandType.Text, "update news set n_x=n_x+1 where id=" + id, null);
            //sqlhelper.ExecuteNonQuery(CommandType.Text, "update news set n_x=n_x-1 where id=" + up_id, null);

        }

        if (action.Equals("down"))
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, "update news set n_x=" + down_xu + " where id=" + id, null);
            sqlhelper.ExecuteNonQuery(CommandType.Text, "update news set n_x=" + xu + " where id=" + down_id, null);


            //sqlhelper.ExecuteNonQuery(CommandType.Text, "update news set n_x=n_x-1 where id=" + id, null);
            //sqlhelper.ExecuteNonQuery(CommandType.Text, "update news set n_x=n_x+1 where id=" + down_id, null);
        }
    }

}

public static class guestbook //网站留言
{
    /// <summary>
    /// serartype为0则查看所有，否则某类别下的留言
    /// yuyan 为ch是中文，en为英文
    /// </summary>
    /// <param name="serartype"></param>
    /// <returns></returns>
    public static DataSet guestbooklist(int serartype, string yuyan)
    {
        DataSet ds = new DataSet();
        if (yuyan == "ch")
        {
            if (serartype == 0)
            {
                ds = sqlhelper.GetDataSet(CommandType.Text, "select * from guestbook where title<>'' order by id desc", null);
            }
            else
            {
                ds = sqlhelper.GetDataSet(CommandType.Text, "select * from guestbook where title<>'' and  typeid=" + serartype + " order by id desc", null);
            }
        }
        if (yuyan == "en")
        {
            if (serartype == 0)
            {
                ds = sqlhelper.GetDataSet(CommandType.Text, "select * from guestbook where title_en<>'' order by id desc", null);
            }
            else
            {
                ds = sqlhelper.GetDataSet(CommandType.Text, "select * from guestbook where title_en<>'' and  typeid=" + serartype + " order by id desc", null);
            }
        }
        return ds;
    }

    public static DataTable viewbook(string id)
    {

        string sql = "SELECT * FROM Guestbook where id=" + id;
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
        return dt;
    }
    public static void delbook(string ids)
    {
        string sql = "delete from Guestbook where id in(" + ids + ")";
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
    }

    /// <summary>
    /// yuyan ;0为中文,1为english
    /// </summary>
    /// <param name="yuyan"></param>
    public static bool addbook(int yuyan, int typeid, string title, string lianxi, string email, string tel, string contents, string compamyname, string CompanyUrl, string fax)
    {
        bool Reutl = false;
        StringBuilder chsql = new StringBuilder();
        StringBuilder ensql = new StringBuilder();
        chsql.Append("INSERT INTO Guestbook (typeid, lianxiren, email, tel, compamyname, title, content,site,fax)");
        chsql.Append(" VALUES (@typeid, @lianxiren, @email, @tel, @compamyname, @title, @content,@site,@fax)");

        ensql.Append("INSERT INTO Guestbook (typeid, lianxiren_en, email, tel, companyname_en, title_en, content_en,site,fax)");
        ensql.Append(" VALUES (@typeid, @lianxiren_en, @email, @tel, @companyname_en, @title_en, @content_en,@site,@fax)");

        OleDbParameter[] param = new OleDbParameter[9];
        if (yuyan.Equals(0))
        {
            param[0] = new OleDbParameter("@typeid", OleDbType.Integer);
            param[1] = new OleDbParameter("@lianxiren", OleDbType.VarChar);
            param[2] = new OleDbParameter("@email", OleDbType.VarChar);
            param[3] = new OleDbParameter("@tel", OleDbType.VarChar);
            param[4] = new OleDbParameter("@compamyname", OleDbType.VarChar);
            param[5] = new OleDbParameter("@title", OleDbType.VarChar);
            param[6] = new OleDbParameter("@content", OleDbType.LongVarWChar);
            param[7] = new OleDbParameter("@site", OleDbType.VarChar);
            param[8] = new OleDbParameter("@fax", OleDbType.VarChar);
        }
        if (yuyan.Equals(1))
        {
            param[0] = new OleDbParameter("@typeid", OleDbType.Integer);
            param[1] = new OleDbParameter("@lianxiren_en", OleDbType.VarChar);
            param[2] = new OleDbParameter("@email", OleDbType.VarChar);
            param[3] = new OleDbParameter("@tel", OleDbType.VarChar);
            param[4] = new OleDbParameter("@companyname_en", OleDbType.VarChar);
            param[5] = new OleDbParameter("@title_en", OleDbType.VarChar);
            param[6] = new OleDbParameter("@content_en", OleDbType.LongVarWChar);
            param[7] = new OleDbParameter("@site", OleDbType.VarChar);
            param[8] = new OleDbParameter("@fax", OleDbType.VarChar);

        }
        param[0].Value = typeid;
        param[1].Value = lianxi;
        param[2].Value = email;
        param[3].Value = tel;
        param[4].Value = compamyname;
        param[5].Value = title;
        param[6].Value = contents;
        param[7].Value = CompanyUrl;
        param[8].Value = fax;

        if (yuyan.Equals(0))
        {
            Reutl = sqlhelper.ExecuteNonQuery(CommandType.Text, chsql.ToString(), param) > 0 ? true : false;
        }

        if (yuyan.Equals(1))
        {
            Reutl = sqlhelper.ExecuteNonQuery(CommandType.Text, ensql.ToString(), param) > 0 ? true : false;
        }
        return Reutl;
    }

}

public static class firend_links //友情链接
{
    public static void addlink(int link_type, string link_name, string link_addr, string link_photo)
    {
        StringBuilder sql = new StringBuilder();
        sql.Append("insert into friend_links (link_type,link_name,link_addr,link_photo) values(" + link_type + ",'" + link_name + "','" + link_addr + "','" + link_photo + "')");
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql.ToString(), null);
        sqlhelper.alert("操作成功", "friendlink.aspx");
    }

    public static void editlink(int link_type, string link_name, string link_addr, string link_photo, string id)
    {
        StringBuilder sql = new StringBuilder();
        sql.Append("update friend_links set link_type=" + link_type + ",link_name='" + link_name + "',link_addr='" + link_addr + "',link_photo='" + link_photo + "' where id=" + id);
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql.ToString(), null);
    }

    /// <summary>
    /// leixing为null则为所有，否则显示某类别下的链接(1为文字，2为图片)
    /// </summary>
    /// <param name="leixing"></param>
    /// <returns></returns>
    public static DataSet linklist(string leixing)
    {
        string sql;
        if (string.IsNullOrEmpty(leixing))
        {
            sql = "select * from friend_links order by id desc";
        }
        else
        {
            sql = "select * from friend_links where link_type=" + leixing;
        }
        DataSet ds = sqlhelper.GetDataSet(CommandType.Text, sql, null);
        return ds;
    }

    public static void dellink(string ids)
    {
        string sql = "delete from friend_links where id in(" + ids + ")";
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
    }

    public static DataTable getlinkinfo(string id)
    {
        string sql = "select * from friend_links where id=" + id;
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
        return dt;
    }
}

public static class job //人才招聘
{
    public static void addjob(string Duix, string Duix_en, int jobxingzhi, int rens, string age, string zhuangye, string zhuangye_en, int xueli, int sex, DateTime endtimes, string yaoqiu, string yaoqiu_en, string daiyu, string daiyu_en, int ispublish)
    {
        StringBuilder sql = new StringBuilder();
        sql.Append("insert into job (Duix, Duix_en, jobxingzhi, rens, age, zhuangye, zhuangye_en, xueli, sex, endtimes,yaoqiu, yaoqiu_en, daiyu, daiyu_en, ispublish)");
        sql.Append(" values(@Duix,@Duix_en,@jobxingzhi,@rens,@age,@zhuangye,@zhuangye_en,@xueli,@sex,@endtimes,@yaoqiu,@yaoqiu_en,@daiyu,@daiyu_en,@ispublish)");

        OleDbParameter[] param = new OleDbParameter[15];
        param[0] = new OleDbParameter("@Duix", OleDbType.VarChar);
        param[1] = new OleDbParameter("@Duix_en", OleDbType.VarChar);
        param[2] = new OleDbParameter("@jobxingzhi", OleDbType.Integer);
        param[3] = new OleDbParameter("@rens", OleDbType.Integer);
        param[4] = new OleDbParameter("@age", OleDbType.VarChar);
        param[5] = new OleDbParameter("@zhuangye", OleDbType.VarChar);
        param[6] = new OleDbParameter("@zhuangye_en", OleDbType.VarChar);
        param[7] = new OleDbParameter("@xueli", OleDbType.Integer);
        param[8] = new OleDbParameter("@sex", OleDbType.Integer);
        param[9] = new OleDbParameter("@endtimes", OleDbType.Date);
        param[10] = new OleDbParameter("@yaoqiu", OleDbType.LongVarWChar);
        param[11] = new OleDbParameter("@yaoqiu_en", OleDbType.LongVarWChar);
        param[12] = new OleDbParameter("@daiyu", OleDbType.VarChar);
        param[13] = new OleDbParameter("@daiyu_en", OleDbType.VarChar);
        param[14] = new OleDbParameter("@IsPublish", OleDbType.Integer);

        param[0].Value = Duix;
        param[1].Value = Duix_en;
        param[2].Value = jobxingzhi;
        param[3].Value = rens;
        param[4].Value = age;
        param[5].Value = zhuangye;
        param[6].Value = zhuangye_en;
        param[7].Value = xueli;
        param[8].Value = sex;
        param[9].Value = endtimes;
        param[10].Value = yaoqiu;
        param[11].Value = yaoqiu_en;
        param[12].Value = daiyu;
        param[13].Value = daiyu_en;
        param[14].Value = ispublish;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql.ToString(), param);
        sqlhelper.alert("操作成功", "joblist.aspx");
    }

    public static void editjob(string Duix, string Duix_en, int jobxingzhi, int rens, string age, string zhuangye, string zhuangye_en, int xueli, int sex, DateTime endtimes, string yaoqiu, string yaoqiu_en, string daiyu, string daiyu_en, int ispublish, int id)
    {
        StringBuilder sql = new StringBuilder();
        sql.Append("UPDATE job SET Duix =@Duix, Duix_en =@Duix_en, jobxingzhi =@jobxingzhi, rens =@rens,");
        sql.Append("age=@age, zhuangye =@zhuangye, zhuangye_en =@zhuangye_en, xueli =@xueli, sex =@sex,");
        sql.Append("endtimes =@endtimes, yaoqiu =@yaoqiu, yaoqiu_en =@yaoqiu_en, daiyu =@daiyu, ");
        sql.Append("daiyu_en=@daiyu_en, ispublish =@ispublish where id =@id");

        OleDbParameter[] param = new OleDbParameter[16];
        param[0] = new OleDbParameter("@Duix", OleDbType.VarChar);
        param[1] = new OleDbParameter("@Duix_en", OleDbType.VarChar);
        param[2] = new OleDbParameter("@jobxingzhi", OleDbType.Integer);
        param[3] = new OleDbParameter("@rens", OleDbType.Integer);
        param[4] = new OleDbParameter("@age", OleDbType.VarChar);
        param[5] = new OleDbParameter("@zhuangye", OleDbType.VarChar);
        param[6] = new OleDbParameter("@zhuangye_en", OleDbType.VarChar);
        param[7] = new OleDbParameter("@xueli", OleDbType.Integer);
        param[8] = new OleDbParameter("@sex", OleDbType.Integer);
        param[9] = new OleDbParameter("@endtimes", OleDbType.Date);
        param[10] = new OleDbParameter("@yaoqiu", OleDbType.LongVarWChar);
        param[11] = new OleDbParameter("@yaoqiu_en", OleDbType.LongVarWChar);
        param[12] = new OleDbParameter("@daiyu", OleDbType.VarChar);
        param[13] = new OleDbParameter("@daiyu_en", OleDbType.VarChar);
        param[14] = new OleDbParameter("@IsPublish", OleDbType.Integer);
        param[15] = new OleDbParameter("@id", OleDbType.Integer);

        param[0].Value = Duix;
        param[1].Value = Duix_en;
        param[2].Value = jobxingzhi;
        param[3].Value = rens;
        param[4].Value = age;
        param[5].Value = zhuangye;
        param[6].Value = zhuangye_en;
        param[7].Value = xueli;
        param[8].Value = sex;
        param[9].Value = endtimes;
        param[10].Value = yaoqiu;
        param[11].Value = yaoqiu_en;
        param[12].Value = daiyu;
        param[13].Value = daiyu_en;
        param[14].Value = ispublish;
        param[15].Value = id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql.ToString(), param);
    }

    public static DataTable getjobinfo(string id)
    {

        string sql = "select * from job where id=" + id;
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, null);
        return dt;
    }

    /// <summary>
    /// yanzhen为false则只显示审核通过的，否则显示所有
    /// </summary>
    /// <param name="yanzhen"></param>
    /// <returns></returns>
    public static DataSet joblist(bool yanzhen)
    {
        DataSet ds;
        if (yanzhen)
        {
            ds = sqlhelper.GetDataSet(CommandType.Text, "select * from job order by id desc", null);
        }
        else
        {
            ds = sqlhelper.GetDataSet(CommandType.Text, "select * from job where ispublish=0 order by id desc", null);
        }
        return ds;
    }

    public static void deljob(string ids)
    {
        string sql = "delete from job where id in(" + ids + ")";
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
    }

    public static void setzt(string ids)
    {
        int zt = Convert.ToInt32(sqlhelper.ExecuteScalar(CommandType.Text, "select ispublish from job where id=" + ids, null));
        if (zt == 0)
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, "update job set ispublish=1 where id=" + ids, null);
        }
        if (zt == 1)
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, "update job set ispublish=0 where id=" + ids, null);
        }
    }

}

public static class resume //人才简历
{
    /// <summary>
    /// yuyan为 ch则为 中文，为en则为英文
    /// </summary>
    /// <param name="jobid"></param>
    /// <param name="xingming"></param>
    /// <param name="sex"></param>
    /// <param name="age"></param>
    /// <param name="Marriage"></param>
    /// <param name="school"></param>
    /// <param name="xueli"></param>
    /// <param name="zhuangye"></param>
    /// <param name="biyetimes"></param>
    /// <param name="phone"></param>
    /// <param name="email"></param>
    /// <param name="workrequire"></param>
    /// <param name="daiyurequire"></param>
    /// <param name="Workexperience"></param>
    /// <param name="Selfevaluation"></param>
    /// <param name="addr"></param>
    /// <param name="yuyan"></param>
    public static void addresume(int jobid, string xingming, int sex, int age, int Marriage, string school, string xueli, string zhuangye, DateTime biyetimes, string phone, string email, string workrequire, string daiyurequire, string Workexperience, string Selfevaluation, string addr, string yuyan)
    {
        StringBuilder chsql = new StringBuilder();
        chsql.Append("insert into jobbook (jobid, xingming, sex, age, Marriage, school, xueli, zhuangye, biyetimes, phone,");
        chsql.Append(" email, workrequire, daiyurequire, Workexperience, Selfevaluation,addr) values(@jobid,@xingming,@sex,@age,@Marriage,@school,@xueli,@zhuangye,@biyetimes,@phone,@email,@workrequire,@daiyurequire,@Workexperience,@Selfevaluation,@addr)");
        StringBuilder ensql = new StringBuilder();
        ensql.Append("insert into jobbook (jobid, xingming_en, sex, age, Marriage, school_en, xueli_en, zhuangye_en, biyetimes, phone,");
        ensql.Append(" email, workrequire_en, daiyurequire_en, Workexperience_en, Selfevaluation_en,addr_en) values(@jobid,@xingming_en,@sex,@age,@Marriage,@school_en,@xueli_en,@zhuangye_en,@biyetimes,@phone,@email,@workrequire_en,@daiyurequire_en,@Workexperience_en,@Selfevaluation_en,@addr_en)");
        OleDbParameter[] parms = new OleDbParameter[16];
        if (yuyan == "ch")
        {
            parms[0] = new OleDbParameter("@jobid", OleDbType.Integer);
            parms[1] = new OleDbParameter("@xingming", OleDbType.VarChar);
            parms[2] = new OleDbParameter("@sex", OleDbType.Integer);
            parms[3] = new OleDbParameter("@age", OleDbType.Integer);
            parms[4] = new OleDbParameter("@Marriage", OleDbType.Integer);
            parms[5] = new OleDbParameter("@school", OleDbType.VarChar);
            parms[6] = new OleDbParameter("@xueli", OleDbType.VarChar);
            parms[7] = new OleDbParameter("@zhuangye", OleDbType.VarChar);
            parms[8] = new OleDbParameter("@biyetimes", OleDbType.Date);
            parms[9] = new OleDbParameter("@phone", OleDbType.VarChar);
            parms[10] = new OleDbParameter("@email", OleDbType.VarChar);
            parms[11] = new OleDbParameter("@workrequire", OleDbType.VarChar);
            parms[12] = new OleDbParameter("@daiyurequire", OleDbType.VarChar);
            parms[13] = new OleDbParameter("@Workexperience", OleDbType.LongVarWChar);
            parms[14] = new OleDbParameter("@Selfevaluation", OleDbType.LongVarWChar);
            parms[15] = new OleDbParameter("@addr", OleDbType.VarChar);
        }

        if (yuyan == "en")
        {
            parms[0] = new OleDbParameter("@jobid", OleDbType.Integer);
            parms[1] = new OleDbParameter("@xingming_en", OleDbType.VarChar);
            parms[2] = new OleDbParameter("@sex", OleDbType.Integer);
            parms[3] = new OleDbParameter("@age", OleDbType.Integer);
            parms[4] = new OleDbParameter("@Marriage", OleDbType.Integer);
            parms[5] = new OleDbParameter("@school_en", OleDbType.VarChar);
            parms[6] = new OleDbParameter("@xueli_en", OleDbType.VarChar);
            parms[7] = new OleDbParameter("@zhuangye_en", OleDbType.VarChar);
            parms[8] = new OleDbParameter("@biyetimes", OleDbType.Date);
            parms[9] = new OleDbParameter("@phone", OleDbType.VarChar);
            parms[10] = new OleDbParameter("@email", OleDbType.VarChar);
            parms[11] = new OleDbParameter("@workrequire_en", OleDbType.VarChar);
            parms[12] = new OleDbParameter("@daiyurequire_en", OleDbType.VarChar);
            parms[13] = new OleDbParameter("@Workexperience_en", OleDbType.LongVarWChar);
            parms[14] = new OleDbParameter("@Selfevaluation_en", OleDbType.LongVarWChar);
            parms[15] = new OleDbParameter("@addr_en", OleDbType.VarChar);
        }
        parms[0].Value = jobid;
        parms[1].Value = xingming;
        parms[2].Value = sex;
        parms[3].Value = age;
        parms[4].Value = Marriage;
        parms[5].Value = school;
        parms[6].Value = xueli;
        parms[7].Value = zhuangye;
        parms[8].Value = biyetimes;
        parms[9].Value = phone;
        parms[10].Value = email;
        parms[11].Value = workrequire;
        parms[12].Value = daiyurequire;
        parms[13].Value = Workexperience;
        parms[14].Value = Selfevaluation;
        parms[15].Value = addr;
        if (yuyan == "ch")
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, chsql.ToString(), parms);
        }
        if (yuyan == "en")
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, ensql.ToString(), parms);
        }
    }

    public static DataSet resumelist(string yuyan)
    {
        string linshi = "";
        if (yuyan == "ch")
        {
            linshi = " where xingming<>'' ";
        }
        if (yuyan == "en")
        {
            linshi = " where xingming_en<>'' ";
        }
        StringBuilder sql = new StringBuilder();
        sql.Append("SELECT Jobbook.xingming,jobbook.xingming_en, Jobbook.sex, Jobbook.age, Jobbook.Marriage, Jobbook.school,");
        sql.Append("Jobbook.xueli, Jobbook.zhuangye,Jobbook.zhuangye_en, Jobbook.biyetimes, Jobbook.phone, ");
        sql.Append(" Jobbook.email, Jobbook.workrequire, Jobbook.daiyurequire, ");
        sql.Append("Jobbook.Workexperience, Jobbook.Selfevaluation, Jobbook.isread, ");
        sql.Append("Jobbook.addtimes, Jobbook.ID, job.Duix,job.duix_en ");
        sql.Append("FROM Jobbook INNER JOIN ");
        sql.Append("job ON Jobbook.jobid = job.id ");
        sql.Append(linshi);
        sql.Append("ORDER BY Jobbook.ID DESC");
        DataSet ds = sqlhelper.GetDataSet(CommandType.Text, sql.ToString(), null);
        return ds;
    }


    /// <summary>
    /// 修改简历状态为   已看
    /// </summary>
    /// <param name="id"></param>
    public static void setresumezt(int id)
    {
        string sql = "update jobbook set isread=1 where id=@id";
        OleDbParameter[] parms = new OleDbParameter[1];
        parms[0] = new OleDbParameter("@id", OleDbType.Integer);
        parms[0].Value = id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, parms);

    }

    public static void delresume(string id)
    {
        string sql = "delete from jobbook where id in(" + id + ")";
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
    }

    public static DataTable getresumeinfo(string id)
    {
        StringBuilder sql = new StringBuilder();
        sql.Append("SELECT Jobbook.xingming, Jobbook.xingming_en, Jobbook.sex, Jobbook.age,");
        sql.Append(" Jobbook.Marriage, Jobbook.school, Jobbook.school_en, Jobbook.xueli,");
        sql.Append(" Jobbook.xueli_en, Jobbook.zhuangye, Jobbook.zhuangye_en, Jobbook.biyetimes, ");
        sql.Append(" Jobbook.phone, Jobbook.email, Jobbook.workrequire, Jobbook.workrequire_en, ");
        sql.Append(" Jobbook.daiyurequire, Jobbook.daiyurequire_en, Jobbook.Workexperience, ");
        sql.Append(" Jobbook.Workexperience_en, Jobbook.Selfevaluation, Jobbook.Selfevaluation_en, ");
        sql.Append(" Jobbook.addtimes, Jobbook.addr, Jobbook.addr_en, job.Duix,job.duix_en");
        sql.Append(" FROM Jobbook INNER JOIN");
        sql.Append(" job ON Jobbook.jobid = job.id where jobbook.id=" + id);

        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql.ToString(), null);
        return dt;
    }

}

public static class require //产品订单
{
    /// <summary>
    /// yuyan 为 ch 为中文，en 为英文
    /// </summary>
    /// <param name="title"></param>
    /// <param name="content"></param>
    /// <param name="linkman"></param>
    /// <param name="sex"></param>
    /// <param name="email"></param>
    /// <param name="companyname"></param>
    /// <param name="phone"></param>
    /// <param name="fax"></param>
    /// <param name="add"></param>
    /// <param name="proid"></param>
    /// <param name="yuyan"></param>
    public static void addrequire(string title, string content, string linkman, int sex, string email, string companyname, string phone, string fax, string add, string proid, string yuyan)
    {
        StringBuilder chsql = new StringBuilder();
        chsql.Append("insert into inquiry (title, content, linkman, sex, email, company, phone, fax, address, proid)");
        chsql.Append(" values(@title,@content,@linkman,@sex,@email,@company,@phone,@fax,@address,@proid)");

        StringBuilder ensql = new StringBuilder();
        ensql.Append("insert into inquiry (title_en, content_en, linkman_en, sex, email, company_en, phone, fax, address_en,proid)");
        ensql.Append(" values(@title_en,@content_en,@linkman_en,@sex,@email,@company_en,@phone,@fax,@address_en,@proid)");

        OleDbParameter[] parms = new OleDbParameter[10];
        if (yuyan == "ch")
        {
            parms[0] = new OleDbParameter("@title", OleDbType.VarChar);
            parms[1] = new OleDbParameter("@content", OleDbType.LongVarWChar);
            parms[2] = new OleDbParameter("@linkman", OleDbType.VarChar);
            parms[3] = new OleDbParameter("@sex", OleDbType.Integer);
            parms[4] = new OleDbParameter("@email", OleDbType.VarChar);
            parms[5] = new OleDbParameter("@company", OleDbType.VarChar);
            parms[6] = new OleDbParameter("@phone", OleDbType.VarChar);
            parms[7] = new OleDbParameter("@fax", OleDbType.VarChar);
            parms[8] = new OleDbParameter("@address", OleDbType.VarChar);
            parms[9] = new OleDbParameter("@proid", OleDbType.VarChar);
        }
        if (yuyan == "en")
        {
            parms[0] = new OleDbParameter("@title_en", OleDbType.VarChar);
            parms[1] = new OleDbParameter("@content_en", OleDbType.LongVarWChar);
            parms[2] = new OleDbParameter("@linkman_en", OleDbType.VarChar);
            parms[3] = new OleDbParameter("@sex", OleDbType.Integer);
            parms[4] = new OleDbParameter("@email", OleDbType.VarChar);
            parms[5] = new OleDbParameter("@company_en", OleDbType.VarChar);
            parms[6] = new OleDbParameter("@phone", OleDbType.VarChar);
            parms[7] = new OleDbParameter("@fax", OleDbType.VarChar);
            parms[8] = new OleDbParameter("@address_en", OleDbType.VarChar);
            parms[9] = new OleDbParameter("@proid", OleDbType.VarChar);
        }
        parms[0].Value = title;
        parms[1].Value = content;
        parms[2].Value = linkman;
        parms[3].Value = sex;
        parms[4].Value = email;
        parms[5].Value = companyname;
        parms[6].Value = phone;
        parms[7].Value = fax;
        parms[8].Value = add;
        parms[9].Value = proid;
        if (yuyan == "ch")
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, chsql.ToString(), parms);
        }
        if (yuyan == "en")
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, ensql.ToString(), parms);
        }
    }

    public static DataSet requirylist(string yuyan)
    {
        DataSet ds = new DataSet();
        if (yuyan == "ch")
        {
            ds = sqlhelper.GetDataSet(CommandType.Text, "select * from inquiry where title <> '' order by id desc", null);

        }
        if (yuyan == "en")
        {
            ds = sqlhelper.GetDataSet(CommandType.Text, "select * from inquiry where title_en <> '' order by id desc", null);

        }
        return ds;

    }

    public static void delrequiry(string ids)
    {
        string sql = "delete from inquiry where id in(" + ids + ")";
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);

    }

    public static DataTable getddinfo(string ids)
    {
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from inquiry where id=" + ids, null);
        return dt;
    }

    /// <summary>
    /// 获得产品名称
    /// </summary>
    /// <param name="pid"></param>
    /// <param name="yuyan"></param>
    /// <returns></returns>
    public static string getpronames(string pid, string yuyan, string urls)
    {
        string ppnames = "";
        if (!string.IsNullOrEmpty(pid) && !pid.Equals("0"))
        {
            string[] sArray = pid.Split(',');
            foreach (string i in sArray)
            {

                if (products.Ret_name(Convert.ToInt32(i), yuyan).ToString() != "")
                {
                    ppnames += "<a target=_blank href=/" + urls + "?id=" + i + ">" + products.Ret_name(Convert.ToInt32(i), yuyan) + "</a>" + "<br>";
                }


            }

        }
        return ppnames;
    }




}

public static class member //会员
{
    /// <summary>
    /// 检查是否存在会员
    /// </summary>
    /// <returns></returns>
    public static bool isuserrow(string username)
    {
        string chausers = "select username from member where username=@username";
        OleDbParameter[] chayonghu = new OleDbParameter[1];
        chayonghu[0] = new OleDbParameter("@username", OleDbType.VarChar);
        chayonghu[0].Value = username;
        DataTable isrows = sqlhelper.GetDataTable(CommandType.Text, chausers, chayonghu);
        if (isrows.Rows.Count == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }


    /// <summary>
    /// yuan为 ch 是中文，en 为英文
    /// </summary>
    /// <param name="username"></param>
    /// <param name="pwd"></param>
    /// <param name="question"></param>
    /// <param name="answer"></param>
    /// <param name="sex"></param>
    /// <param name="email"></param>
    /// <param name="www"></param>
    /// <param name="companyname"></param>
    /// <param name="addr"></param>
    /// <param name="linkman"></param>
    /// <param name="youbian"></param>
    /// <param name="phone"></param>
    /// <param name="fax"></param>
    /// <param name="yuyan"></param>
    public static void adduser(string username, string pwd, string question, string answer, int sex, string email, string www, string companyname, string addr, string linkman, string youbian, string phone, string fax, string yuyan)
    {
        StringBuilder chsql = new StringBuilder();
        StringBuilder ensql = new StringBuilder();
        chsql.Append("INSERT INTO member(username, pwd, question, answer, sex, email, www, companyname, addr, linkman,youbian, phone, fax)");
        chsql.Append(" values(@username,@pwd,@question,@answer,@sex,@email,@www,@companyname,@addr,@linkman,@youbian,@phone,@fax)");
        ensql.Append("INSERT INTO member(username, pwd, question_en, answer_en, sex, email, www, companyname_en,addr_en, linkman_en, youbian, phone, fax)");
        ensql.Append(" VALUES (@username,@pwd,@question_en,@answer_en,@sex,@email,@www,@companyname_en,@addr_en,@linkman_en,@youbian,@phone,@fax)");
        OleDbParameter[] parms = new OleDbParameter[13];
        if (yuyan.Equals("ch"))
        {
            parms[0] = new OleDbParameter("@username", OleDbType.VarChar);
            parms[1] = new OleDbParameter("@pwd", OleDbType.VarChar);
            parms[2] = new OleDbParameter("@question", OleDbType.VarChar);
            parms[3] = new OleDbParameter("@answer", OleDbType.VarChar);
            parms[4] = new OleDbParameter("@sex", OleDbType.Integer);
            parms[5] = new OleDbParameter("@email", OleDbType.VarChar);
            parms[6] = new OleDbParameter("@www", OleDbType.VarChar);
            parms[7] = new OleDbParameter("@companyname", OleDbType.VarChar);
            parms[8] = new OleDbParameter("@addr", OleDbType.VarChar);
            parms[9] = new OleDbParameter("@linkman", OleDbType.VarChar);
            parms[10] = new OleDbParameter("@youbian", OleDbType.VarChar);
            parms[11] = new OleDbParameter("@phone", OleDbType.VarChar);
            parms[12] = new OleDbParameter("@fax", OleDbType.VarChar);
        }
        if (yuyan.Equals("en"))
        {
            parms[0] = new OleDbParameter("@username", OleDbType.VarChar);
            parms[1] = new OleDbParameter("@pwd", OleDbType.VarChar);
            parms[2] = new OleDbParameter("@question_en", OleDbType.VarChar);
            parms[3] = new OleDbParameter("@answer_en", OleDbType.VarChar);
            parms[4] = new OleDbParameter("@sex", OleDbType.Integer);
            parms[5] = new OleDbParameter("@email", OleDbType.VarChar);
            parms[6] = new OleDbParameter("@www", OleDbType.VarChar);
            parms[7] = new OleDbParameter("@companyname_en", OleDbType.VarChar);
            parms[8] = new OleDbParameter("@addr_en", OleDbType.VarChar);
            parms[9] = new OleDbParameter("@linkman_en", OleDbType.VarChar);
            parms[10] = new OleDbParameter("@youbian", OleDbType.VarChar);
            parms[11] = new OleDbParameter("@phone", OleDbType.VarChar);
            parms[12] = new OleDbParameter("@fax", OleDbType.VarChar);
        }
        parms[0].Value = username;
        parms[1].Value = FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "md5");
        parms[2].Value = question;
        parms[3].Value = answer;
        parms[4].Value = sex;
        parms[5].Value = email;
        parms[6].Value = www;
        parms[7].Value = companyname;
        parms[8].Value = addr;
        parms[9].Value = linkman;
        parms[10].Value = youbian;
        parms[11].Value = phone;
        parms[12].Value = fax;
        if (yuyan.Equals("ch"))
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, chsql.ToString(), parms);
        }
        if (yuyan.Equals("en"))
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, ensql.ToString(), parms);
        }
    }

    /// <summary>
    /// yuan为 ch 是中文，en 为英文
    /// </summary>
    /// <param name="pwd"></param>
    /// <param name="question"></param>
    /// <param name="answer"></param>
    /// <param name="sex"></param>
    /// <param name="email"></param>
    /// <param name="www"></param>
    /// <param name="companyname"></param>
    /// <param name="addr"></param>
    /// <param name="linkman"></param>
    /// <param name="youbian"></param>
    /// <param name="phone"></param>
    /// <param name="fax"></param>
    /// <param name="role"></param>
    /// <param name="id"></param>
    /// <param name="yuyan"></param>
    public static void edituser(string pwd, string question, string answer, int sex, string email, string www, string companyname, string addr, string linkman, string youbian, string phone, string fax, int role, int id, string yuyan)
    {
        StringBuilder chsql = new StringBuilder();
        chsql.Append("UPDATE member SET pwd =@pwd, question =@question, answer =@answer, sex =@sex, email =@email, www =@www, companyname =@companyname,");
        chsql.Append("addr =@addr, linkman =@linkman, youbian =@youbian, phone =@phone, fax =@fax, role =@role where id=@id");


        StringBuilder ensql = new StringBuilder();
        ensql.Append("UPDATE member SET pwd =@pwd, question_en =@question_en, answer_en =@answer_en, sex =@sex, email =@email, www =@www,");
        ensql.Append("companyname_en =@companyname_en, addr_en =@addr_en, linkman_en =@linkman_en, youbian =@youbian, phone =@phone, fax =@fax,");
        ensql.Append("role=@role where id=@id");

        OleDbParameter[] parms = new OleDbParameter[14];
        if (yuyan.Equals("ch"))
        {
            parms[0] = new OleDbParameter("@pwd", OleDbType.VarChar);
            parms[1] = new OleDbParameter("@question", OleDbType.VarChar);
            parms[2] = new OleDbParameter("@answer", OleDbType.VarChar);
            parms[3] = new OleDbParameter("@sex", OleDbType.Integer);
            parms[4] = new OleDbParameter("@email", OleDbType.VarChar);
            parms[5] = new OleDbParameter("@www", OleDbType.VarChar);
            parms[6] = new OleDbParameter("@companyname", OleDbType.VarChar);
            parms[7] = new OleDbParameter("@addr", OleDbType.VarChar);
            parms[8] = new OleDbParameter("@linkman", OleDbType.VarChar);
            parms[9] = new OleDbParameter("@youbian", OleDbType.VarChar);
            parms[10] = new OleDbParameter("@phone", OleDbType.VarChar);
            parms[11] = new OleDbParameter("@fax", OleDbType.VarChar);
            parms[12] = new OleDbParameter("@role", OleDbType.Integer);
            parms[13] = new OleDbParameter("@id", OleDbType.Integer);
        }

        if (yuyan.Equals("en"))
        {
            parms[0] = new OleDbParameter("@pwd", OleDbType.VarChar);
            parms[1] = new OleDbParameter("@question_en", OleDbType.VarChar);
            parms[2] = new OleDbParameter("@answer_en", OleDbType.VarChar);
            parms[3] = new OleDbParameter("@sex", OleDbType.Integer);
            parms[4] = new OleDbParameter("@email", OleDbType.VarChar);
            parms[5] = new OleDbParameter("@www", OleDbType.VarChar);
            parms[6] = new OleDbParameter("@companyname_en", OleDbType.VarChar);
            parms[7] = new OleDbParameter("@addr_en", OleDbType.VarChar);
            parms[8] = new OleDbParameter("@linkman_en", OleDbType.VarChar);
            parms[9] = new OleDbParameter("@youbian", OleDbType.VarChar);
            parms[10] = new OleDbParameter("@phone", OleDbType.VarChar);
            parms[11] = new OleDbParameter("@fax", OleDbType.VarChar);
            parms[12] = new OleDbParameter("@role", OleDbType.Integer);
            parms[13] = new OleDbParameter("@id", OleDbType.Integer);
        }
        parms[0].Value = FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "md5");
        parms[1].Value = question;
        parms[2].Value = answer;
        parms[3].Value = sex;
        parms[4].Value = email;
        parms[5].Value = www;
        parms[6].Value = companyname;
        parms[7].Value = addr;
        parms[8].Value = linkman;
        parms[9].Value = youbian;
        parms[10].Value = phone;
        parms[11].Value = fax;
        parms[12].Value = role;
        parms[13].Value = id;
        if (yuyan.Equals("ch"))
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, chsql.ToString(), parms);
        }
        if (yuyan.Equals("en"))
        {
            sqlhelper.ExecuteNonQuery(CommandType.Text, ensql.ToString(), parms);
        }
    }

    public static void deluser(string ids)
    {
        string sql = "delete from member where id in(" + ids + ")";
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
    }

    public static DataSet userlist()
    {
        DataSet ds = sqlhelper.GetDataSet(CommandType.Text, "select * from member order by id desc", null);
        return ds;
    }

    public static DataTable getuserinfo(string id)
    {
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from member where id=" + id, null);
        return dt;
    }



}

public static class webinfor //网站设置
{
    public static string sitename, sitefoot, keyword, iswatermark, watermark, pro_show;
    public static DataTable getwebinfor()
    {
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from sitesetting where id=1", null);
        return dt;
    }

    public static void getinfos()
    {
        DataTable dt = getwebinfor();
        sitename = dt.Rows[0]["sitename"].ToString();
        sitefoot = dt.Rows[0]["sitefoot"].ToString();
        keyword = dt.Rows[0]["keyword"].ToString();
        iswatermark = dt.Rows[0]["iswatermark"].ToString();
        watermark = dt.Rows[0]["watermark"].ToString();
        pro_show = dt.Rows[0]["pro_show"].ToString();
        //web_addr_en = dt.Rows[0]["web_addr_en"].ToString();
        //web_lianxiren = dt.Rows[0]["web_lianxiren"].ToString();
        //web_lianxiren_en = dt.Rows[0]["web_lianxiren_en"].ToString();
        //web_tel = dt.Rows[0]["web_tel"].ToString();
        //web_fax = dt.Rows[0]["web_fax"].ToString();
        //web_email = dt.Rows[0]["web_email"].ToString();
        //web_youbian = dt.Rows[0]["web_youbian"].ToString();
        //web_url = dt.Rows[0]["web_url"].ToString();
    }

    public static void edit(string sitename, string sitefoot, string keyword, string iswatermark, string watermark)
    {
        string sql2 = "update sitesetting set sitename=@sitename,sitefoot=@sitefoot,keyword=@keyword,iswatermark=@iswatermark,watermark=@watermark where id=1";
        OleDbParameter[] chans = new OleDbParameter[5];
        chans[0] = new OleDbParameter("@sitename", OleDbType.VarChar);
        chans[1] = new OleDbParameter("@sitefoot", OleDbType.VarChar);
        chans[2] = new OleDbParameter("@keyword", OleDbType.LongVarChar);
        chans[3] = new OleDbParameter("@iswatermark", OleDbType.LongVarChar);
        chans[4] = new OleDbParameter("@watermark", OleDbType.LongVarChar);

        //chans[6] = new OleDbParameter("@web_addr", OleDbType.VarChar);
        //chans[7] = new OleDbParameter("@web_addr_en", OleDbType.VarChar);
        //chans[8] = new OleDbParameter("@web_lianxiren", OleDbType.VarChar);
        //chans[9] = new OleDbParameter("@web_lianxiren_en", OleDbType.VarChar);
        //chans[10] = new OleDbParameter("@web_tel", OleDbType.VarChar);
        //chans[11] = new OleDbParameter("@web_fax", OleDbType.VarChar);
        //chans[12] = new OleDbParameter("@web_email", OleDbType.VarChar);
        //chans[13] = new OleDbParameter("@web_youbian", OleDbType.VarChar);
        //chans[14] = new OleDbParameter("@web_url", OleDbType.VarChar);

        chans[0].Value = sitename;
        chans[1].Value = sitefoot;
        chans[2].Value = keyword;
        chans[3].Value = iswatermark;
        chans[4].Value = watermark;

        //chans[6].Value = addr;
        //chans[7].Value = addr_en;
        //chans[8].Value = lianxi;
        //chans[9].Value = lianxi_en;
        //chans[10].Value = tel;
        //chans[11].Value = fax;
        //chans[12].Value = email;
        //chans[13].Value = youbian;
        //chans[14].Value = urls;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql2, chans);
    }


}

public static class companyinfo //公司详细信息
{
    public static string companyname, pro_se, address, zip, tel, fax, shouji, site, farendaibiao, number, model, profile, msn, qq;
    public static DataTable getcompanyinfo()
    {
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from companyinfo where info_id=1", null);
        return dt;
    }

    public static void editc(string companyname, string pro_se, string address, string zip, string tel, string fax, string shouji, string site, string farendaibiao, string number, string model, string profile, string msn, string qq)
    {

        string sql3 = "update companyinfo set [companyname]=@companyname,[pro_se]=@pro_se,[address]=@address,[zip]=@zip,[tel]=@tel,[fax]=@fax,[shouji]=@shouji,[site]=@site,[farendaibiao]=@farendaibiao,[number]=@number,[model]=@model,[profile]=@profile,[msn]=@msn,[qq]=@qq where info_id=1";
        OleDbParameter[] chanc = new OleDbParameter[14];
        chanc[0] = new OleDbParameter("@companyname", OleDbType.VarChar);
        chanc[1] = new OleDbParameter("@pro_se", OleDbType.LongVarChar);
        chanc[2] = new OleDbParameter("@address", OleDbType.LongVarChar);
        chanc[3] = new OleDbParameter("@zip", OleDbType.LongVarChar);
        chanc[4] = new OleDbParameter("@tel", OleDbType.LongVarChar);
        chanc[5] = new OleDbParameter("@fax", OleDbType.LongVarChar);
        chanc[6] = new OleDbParameter("@shouji", OleDbType.VarChar);
        chanc[7] = new OleDbParameter("@site", OleDbType.VarChar);
        chanc[8] = new OleDbParameter("@farendaibiao", OleDbType.VarChar);
        chanc[9] = new OleDbParameter("@number", OleDbType.VarChar);
        chanc[10] = new OleDbParameter("@model", OleDbType.VarChar);
        chanc[11] = new OleDbParameter("@profile", OleDbType.LongVarChar);
        chanc[12] = new OleDbParameter("@msn", OleDbType.VarChar);
        chanc[13] = new OleDbParameter("@qq", OleDbType.VarChar);

        chanc[0].Value = companyname;
        chanc[1].Value = pro_se;
        chanc[2].Value = address;
        chanc[3].Value = zip;
        chanc[4].Value = tel;
        chanc[5].Value = fax;
        chanc[6].Value = shouji;
        chanc[7].Value = site;
        chanc[8].Value = farendaibiao;
        chanc[9].Value = number;
        chanc[10].Value = model;
        chanc[11].Value = profile;
        chanc[12].Value = msn;
        chanc[13].Value = qq;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql3, chanc);
    }
    /// <summary>
    /// 修改公司简介
    /// </summary>
    /// <param name="profile"></param>
    public static void editCompanyInfoProfile(string profile)
    {
        string sql3 = "update companyinfo set [profile]=@profile where info_id=1";
        OleDbParameter[] chanc = new OleDbParameter[1];
        chanc[0] = new OleDbParameter("@profile", OleDbType.LongVarChar);
        chanc[0].Value = profile;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql3, chanc);
    }


    /// <summary>
    /// 修改公司服务项目
    /// </summary>
    /// <param name="server"></param>
    public static void editCompanyInfoServer(string server)
    {
        string sql3 = "update companyinfo set [pro_se]=@pro_se where info_id=1";
        OleDbParameter[] chanc = new OleDbParameter[1];
        chanc[0] = new OleDbParameter("@pro_se", OleDbType.LongVarChar);
        chanc[0].Value = server;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql3, chanc);
    }







}


public static class products //案例展示
{
    private static int p_pro_id, p_columnid, p_istuijian, p_hits, p_order, _type;
    private static string p_name, p_content = string.Empty, p_content_en = string.Empty, p_proimg;
    private static DateTime p_time;


    public static int pro_id
    {
        get
        {
            return p_pro_id;
        }
        set
        {
            p_pro_id = value;
        }
    }
    public static int columnid
    {
        get
        {
            return p_columnid;
        }
        set
        {
            p_columnid = value;
        }
    }


    public static int orders
    {
        get
        {
            return p_order;
        }
        set
        {
            p_order = value;
        }
    }

    public static string names
    {
        get
        {
            return p_name;
        }
        set
        {
            p_name = value;
        }
    }

    public static string content
    {
        get
        {
            return p_content;
        }
        set
        {
            p_content = value;
        }
    }

    public static int hits
    {
        get
        {
            return p_hits;
        }
        set
        {
            p_hits = value;
        }
    }

    public static DateTime times
    {
        get
        {
            return p_time;
        }
        set
        {
            p_time = value;
        }
    }

    public static string proimg
    {
        get
        {
            return p_proimg;
        }
        set
        {
            p_proimg = value;
        }
    }

    public static int istuijian
    {
        get
        {
            return p_istuijian;
        }
        set
        {
            p_istuijian = value;
        }
    }

    public static string content_en
    {
        get
        {
            return p_content_en;
        }
        set
        {
            p_content_en = value;
        }
    }
    /// <summary>
    /// 类型，0为产品，1为工厂
    /// </summary>
    public static int Type
    {
        get { return _type; }
        set { _type = value; }
    }
    /// <summary>
    /// 产品生成缩略图,参数分别为 源图，目标图，长，宽
    /// </summary>
    /// <param name="srcPath"></param>
    /// <param name="destPath"></param>
    /// <param name="width"></param>
    /// <param name="height"></param>
    public static void Thum(string srcPath, string destPath, double width, double height)
    {
        System.Drawing.Image img = new Bitmap(srcPath);
        //生成图片大小必需小于原图
        if (img.Width < width)
        {
            width = img.Width;

        }
        if (img.Height < height)
        {
            height = img.Height;
        }
        //删除的高度，与宽度
        double cutWidth, cutHeight;
        cutWidth = (img.Width * height / img.Height - width); //宽度切割,高度缩放
        cutHeight = (img.Height * width / img.Width - height);//高度切割,宽度缩放
        byte flag = 0;//0 截高，1 截宽 
        //这里的截宽是指缩略图的宽将被截，不是指原图，
        //1. 按原图比例，选择缩略图的高固定，计算出来的宽如果大于指定的宽，那么就按高固定，计算出来的宽来生成缩略图，再按给定大小截取
        //2. 按原图比例，选择缩略图的宽固定，计算出来的高如果大于指定的高，那么就按宽固定，计算出来的高来生成缩略图，再按给定大小截取
        //3. 因为长宽比只能取{1,>1,<1}三种情况
        flag = (byte)(cutHeight <= cutWidth ? 0 : 1);

        System.Drawing.Image thumImg;
        if (flag == 0)
            thumImg = new Bitmap(img, (int)width, (int)height + (int)cutHeight); //img.GetThumbnailImage((int)width, (int)height + (int)cutHeight, myCallback, IntPtr.Zero);
        else
            thumImg = new Bitmap(img, (int)width + (int)cutWidth, (int)height);// img.GetThumbnailImage((int)width + (int)cutWidth, (int)height, myCallback, IntPtr.Zero);
        System.Drawing.Bitmap destImg = new Bitmap((int)width, (int)height);
        Graphics g = Graphics.FromImage(destImg);

        Rectangle rect = new Rectangle(0, 0, (int)width, (int)height);
        //填充透明背景

        g.FillRectangle(Brushes.White, rect);

        g.DrawImage(thumImg, rect, rect, GraphicsUnit.Pixel);


        g.Save();
        destImg.Save(destPath, System.Drawing.Imaging.ImageFormat.Jpeg);
        thumImg.Dispose();
        img.Dispose();
        destImg.Dispose();

    }

    public static void addpro()
    {
        StringBuilder chsql = new StringBuilder();
        chsql.Append("INSERT INTO product ([columnid],[order],[name],[content],[hits],[time],[pro_img] ,[istuijian] ,[content_en],[Type]) ");
        chsql.Append("VALUES ([@columnid], [@orders], [@names], [@content],[@hits],[@times],[@proimg],[@istuijian],[@content_en],[@Type])");
        OleDbParameter[] param = new OleDbParameter[10];

        param[0] = new OleDbParameter("@columnid", OleDbType.Integer);
        param[1] = new OleDbParameter("@orders", OleDbType.Integer);
        param[2] = new OleDbParameter("@names", OleDbType.VarChar);
        param[3] = new OleDbParameter("@content", OleDbType.VarChar);
        param[4] = new OleDbParameter("@hits", OleDbType.Integer);
        param[5] = new OleDbParameter("@times", OleDbType.Date);
        param[6] = new OleDbParameter("@proimg", OleDbType.VarChar);
        param[7] = new OleDbParameter("@istuijian", OleDbType.Integer);
        param[8] = new OleDbParameter("@content_en", OleDbType.VarChar);
        param[9] = new OleDbParameter("@Type", OleDbType.Integer);

        param[0].Value = columnid;
        param[1].Value = orders;
        param[2].Value = names;
        param[3].Value = content;
        param[4].Value = hits;
        param[5].Value = times;
        param[6].Value = proimg;
        param[7].Value = istuijian;
        param[8].Value = content_en;
        param[9].Value = Type;

        sqlhelper.ExecuteNonQuery(CommandType.Text, chsql.ToString(), param);
    }

    public static void editpro()
    {
        StringBuilder chsql = new StringBuilder();
        chsql.Append("UPDATE product SET [columnid] =@columnid , [order]=@orders, [name]=@names, [content]=@content, [hits] =@hits , [time] =@times ,");
        chsql.Append("[pro_img] =@proimg , [istuijian] =@istuijian , [content_en]=@content_en where [pro_id]=@id");
        OleDbParameter[] param = new OleDbParameter[10];
        param[0] = new OleDbParameter("@columnid", OleDbType.Integer);
        param[1] = new OleDbParameter("@orders", OleDbType.Integer);
        param[2] = new OleDbParameter("@names", OleDbType.VarChar);
        param[3] = new OleDbParameter("@content", OleDbType.VarChar);
        param[4] = new OleDbParameter("@hits", OleDbType.Integer);
        param[5] = new OleDbParameter("@times", OleDbType.Date);
        param[6] = new OleDbParameter("@proimg", OleDbType.VarChar);
        param[7] = new OleDbParameter("@istuijian", OleDbType.Integer);
        param[8] = new OleDbParameter("@content_en", OleDbType.VarChar);
        param[9] = new OleDbParameter("@id", OleDbType.Integer);

        param[0].Value = columnid;
        param[1].Value = orders;
        param[2].Value = names;
        param[3].Value = content;
        param[4].Value = hits;
        param[5].Value = times;
        param[6].Value = proimg;
        param[7].Value = istuijian;
        param[8].Value = content_en;
        param[9].Value = pro_id;
        sqlhelper.ExecuteNonQuery(CommandType.Text, chsql.ToString(), param);
    }

    public static void showpro()
    {
        string sql = "select * from product where pro_id=@pro_id";
        OleDbParameter[] param = new OleDbParameter[1];
        param[0] = new OleDbParameter("@pro_id", OleDbType.Integer);
        param[0].Value = pro_id;
        //throw new Exception("id=" + id);

        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, sql, param);
        products.columnid = Convert.ToInt32(dt.Rows[0]["columnid"].ToString());
        //throw new Exception("products.title=" + products.title);
        products.orders = Convert.ToInt32(dt.Rows[0]["order"].ToString());
        products.names = dt.Rows[0]["name"].ToString();
        products.content = dt.Rows[0]["content"].ToString();
        products.hits = Convert.ToInt32(dt.Rows[0]["hits"].ToString());
        products.times = Convert.ToDateTime(dt.Rows[0]["time"].ToString());
        products.proimg = dt.Rows[0]["pro_img"].ToString();
        products.istuijian = Convert.ToInt32(dt.Rows[0]["istuijian"].ToString());
        products.content_en = dt.Rows[0]["content_en"].ToString();
        products.Type = Convert.ToInt32(dt.Rows[0]["Type"].ToString());
    }


    public static void delpro(string ids)
    {
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from product where pro_id in(" + ids + ")", null);
        string fileName = string.Empty;
        string sql = "delete from product where pro_id in(" + ids + ")";
        int iResult = sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
        FileInfo fileInfo = null;
        FileInfo s_fileInfo = null;
        FileInfo sy_fileInfo = null;
        FileInfo syp_fileInfo = null;

        if (iResult > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                fileName = dr["pro_img"].ToString().TrimStart('|');
                if (!string.IsNullOrEmpty(fileName))
                {
                    fileInfo = new FileInfo(HttpContext.Current.Server.MapPath("file/" + fileName));
                    fileInfo.Delete();
                    s_fileInfo = new FileInfo(HttpContext.Current.Server.MapPath("file/s_" + fileName)); // 缩略图文件名称
                    s_fileInfo.Delete();
                    sy_fileInfo = new FileInfo(HttpContext.Current.Server.MapPath("file/sy_" + fileName));// 水印图文件名称（文字）
                    sy_fileInfo.Delete();
                    syp_fileInfo = new FileInfo(HttpContext.Current.Server.MapPath("file/syp_" + fileName));// 水印图文件名称（图片）
                    syp_fileInfo.Delete();
                }
            }
        }

    }

    public static void changhits(string zhi)
    {
        string sql = "update product set hits=hits+" + zhi;
        sqlhelper.ExecuteNonQuery(CommandType.Text, sql, null);
    }

    /// <summary>
    /// 根据产品id和和版本取出产品名称
    /// </summary>
    /// <param name="YX_ID"></param>
    /// <param name="yuyan"></param>
    /// <returns></returns>
    public static string Ret_name(int YX_ID, string yuyan)
    {
        string namestr = "";
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select * from products where id=" + YX_ID, null);
        if (dt.Rows.Count > 0)
        {
            if (yuyan == "ch")
            {
                namestr = sqlhelper.ExecuteScalar(CommandType.Text, "select title from products where id=" + YX_ID, null).ToString();
            }
            else
            {
                namestr = sqlhelper.ExecuteScalar(CommandType.Text, "select title_en from products where id=" + YX_ID, null).ToString();

            }
            return namestr;
        }
        else
        {
            return namestr;
        }
    }

    /// <summary>
    /// 获取上下页 产品ID
    /// </summary>
    /// <param name="currentNo">产品编号</param>
    /// <param name="UpOrNext">“0”上页，“1”下页</param>
    /// <returns></returns>
    public static string GetProductsUpOrNext(string currentNo, string UpOrNext)
    {
        string sResutl = string.Empty;
        string orderNo = string.Empty;
        string sizeIdentified = ">";
        string order = "asc";
        if (UpOrNext == "1")
        {
            sizeIdentified = "<";
            order = "desc";
        }
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "Select top 1 order from product where [pro_id]=" + currentNo, null);
        if (dt == null || dt.Rows.Count == 0)
        {
            return sResutl;
        }
        orderNo = dt.Rows[0]["order"].ToString();

        dt = sqlhelper.GetDataTable(CommandType.Text, "Select top 1 pro_id from product where  Type=0 and [order] " + sizeIdentified + " " + orderNo + "  order by [order] " + order, null);
        if (dt == null || dt.Rows.Count == 0)
        {
            return sResutl;
        }
        sResutl = dt.Rows[0]["pro_id"].ToString();
        return sResutl;
    }

}

public static class productclass //产品类别
{
    public static DataSet GetClassList(string strWhere)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("select * from p_Class ");
        if (strWhere.Trim() != "")
        {
            strSql.Append(" where " + strWhere);
        }
        return sqlhelper.GetDataSet(CommandType.Text, strSql.ToString(), null);
    }
}

public static class Email
{
    /// <summary>        
    /// <param name="smtp">发邮件服务器</param> 
    /// <param name="FromEmail">发件人邮箱地址</param> 
    /// <param name="usrpsw">发件人邮箱密码</param> 
    /// <param name="ToEmail">收件人邮箱地址</param> 
    /// <param name="Subject">邮件标题</param> 
    /// <param name="body">邮件内容</param> 
    /// </summary> 
    public static bool send(string stmp, string FromEmail, string usrpsw, string ToEmail, string Subject, string body)
    {
        jmail.Message Jmail = new jmail.MessageClass();
        try
        {
            //DateTime t = DateTime.Now; 
            //Silent属性：如果设置为true,JMail不会抛出例外错误. JMail. Send( () 会根据操作结果返回true或false 
            Jmail.Silent = true;
            //Jmail创建的日志，前提loging属性设置为true 
            Jmail.Logging = true;
            //字符集，缺省为"US-ASCII" 
            Jmail.Charset = "GB2312";
            //信件的contentype. 缺省是"text/plain"） : 字符串如果你以HTML格式发送邮件, 改为"text/html"即可。 
            Jmail.ContentType = "text/html";


            //添加收件人 

            if (ToEmail.IndexOf(",") != -1)
            {
                string[] ToEmailDr = ToEmail.Split(',');
                for (int i = 0; i < ToEmailDr.Length; i++)
                {
                    Jmail.AddRecipient(ToEmailDr[i].ToString(), "", "");
                }
            }
            else
                Jmail.AddRecipient(ToEmail, "", "");

            Jmail.From = FromEmail;
            //发件人邮件用户名 
            Jmail.MailServerUserName = FromEmail;
            //发件人邮件密码 
            Jmail.MailServerPassWord = usrpsw;
            //设置邮件标题 
            Jmail.Subject = Subject;
            //邮件添加附件,(多附件的话，可以再加一条Jmail.AddAttachment( "c:\\test.jpg",true,null);)就可以搞定了。〔注〕：加了附件，讲把上面的Jmail.ContentType="text/html";删掉。否则会在邮件里出现乱码。 
            //Jmail.AddAttachment( "c:\\test.jpg",true,null); 
            //邮件内容 
            Jmail.Body = body;
            //Jmail发送的方法 
            if (Jmail.Send(stmp, false))
                // Label1.Text = "发送成功"; 
                return true;
            else
                // Label1.Text = "发送不成功"; 
                return false;
        }
        //catch (Exception)
        //{
        //    return false;
        //}
        finally
        {
            Jmail.Close();
        }
    }
}   //发送邮件

public class CreateImage
{

    public static void DrawImage()
    {
        CreateImage img = new CreateImage();
        HttpContext.Current.Session["CheckCode"] = img.RndNum(4);
        img.CreateImages(HttpContext.Current.Session["CheckCode"].ToString());
    }
    /// <summary>
    /// 生成验证图片
    /// </summary>
    /// <param name="checkCode">验证字符</param>
    private void CreateImages(string checkCode)
    {
        int iwidth = (int)(checkCode.Length * 13);
        System.Drawing.Bitmap image = new System.Drawing.Bitmap(iwidth, 25);
        Graphics g = Graphics.FromImage(image);
        g.Clear(Color.White);
        //定义颜色
        Color[] c = { Color.Black, Color.Red, Color.DarkBlue, Color.Green, Color.Orange, Color.Brown, Color.DarkCyan, Color.Purple };
        //定义字体 
        string[] font = { "Verdana", "Microsoft Sans Serif", "Comic Sans MS", "Arial", "宋体" };
        Random rand = new Random();
        //随机输出噪点
        for (int i = 0; i < 50; i++)
        {
            int x = rand.Next(image.Width);
            int y = rand.Next(image.Height);
            g.DrawRectangle(new Pen(Color.LightGray, 0), x, y, 1, 1);
        }

        //输出不同字体和颜色的验证码字符
        for (int i = 0; i < checkCode.Length; i++)
        {
            int cindex = rand.Next(7);
            int findex = rand.Next(5);

            Font f = new System.Drawing.Font(font[findex], 10, System.Drawing.FontStyle.Bold);
            Brush b = new System.Drawing.SolidBrush(c[cindex]);
            int ii = 4;
            if ((i + 1) % 2 == 0)
            {
                ii = 2;
            }
            g.DrawString(checkCode.Substring(i, 1), f, b, 3 + (i * 12), ii);
        }
        //画一个边框
        g.DrawRectangle(new Pen(Color.Black, 0), 0, 0, image.Width - 1, image.Height - 1);

        //输出到浏览器
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
        HttpContext.Current.Response.ClearContent();
        //Response.ClearContent();
        HttpContext.Current.Response.ContentType = "image/Jpeg";
        HttpContext.Current.Response.BinaryWrite(ms.ToArray());
        g.Dispose();
        image.Dispose();
    }

    /// <summary>
    /// 生成随机的字母
    /// </summary>
    /// <param name="VcodeNum">生成字母的个数</param>
    /// <returns>string</returns>
    private string RndNum(int VcodeNum)
    {
        string Vchar = "0,1,2,3,4,5,6,7,8,9";
        string[] VcArray = Vchar.Split(',');
        string VNum = ""; //由于字符串很短，就不用StringBuilder了
        int temp = -1; //记录上次随机数值，尽量避免生产几个一样的随机数

        //采用一个简单的算法以保证生成随机数的不同
        Random rand = new Random();
        for (int i = 1; i < VcodeNum + 1; i++)
        {
            if (temp != -1)
            {
                rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
            }
            int t = rand.Next(VcArray.Length);
            if (temp != -1 && temp == t)
            {
                return RndNum(VcodeNum);
            }
            temp = t;
            VNum += VcArray[t];
        }
        return VNum;
    }

}
