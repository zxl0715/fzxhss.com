using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;
using System.Drawing;
using System.Text.RegularExpressions;
using System.IO;


namespace wzwebsite
{
    public class sqlhelper
    {
        

        public sqlhelper()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }

        public static string connstr = ConfigurationManager.AppSettings["accessConnStr"].ToString() + HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["accessdbPath"].ToString()) + ";";

        public static string cupage()
        {
            string strPath = "http://" + HttpContext.Current.Request.ServerVariables["HTTP_HOST"] + HttpContext.Current.Request.ServerVariables["PATH_INFO"] + "?" + HttpContext.Current.Request.ServerVariables["QUERY_STRING"];
            if (strPath.EndsWith("?"))
            {
                strPath = strPath.Substring(0, strPath.Length - 1);
            }
            return strPath;
        }


        public static int ExecuteNonQuery(CommandType cmdType, string cmdText, params OleDbParameter[] commandParameters)
        {
            OleDbCommand cmd = new OleDbCommand();

            using (OleDbConnection connection = new OleDbConnection(connstr))
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                int num = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return num;
            }
        }



        public static OleDbDataReader ExecuteReader(CommandType cmdType, string cmdText, params OleDbParameter[] commandParameters)
        {
            OleDbDataReader reader2;
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection conn = new OleDbConnection(connstr);
            try
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);

                OleDbDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                reader2 = reader;
            }
            catch
            {
                conn.Close();
                throw;
            }
            return reader2;
        }



        public static object ExecuteScalar(CommandType cmdType, string cmdText, params OleDbParameter[] commandParameters)
        {
            OleDbCommand cmd = new OleDbCommand();
            using (OleDbConnection connection = new OleDbConnection(connstr))
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                object obj2 = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return obj2;
            }
        }



        public static DataSet GetDataSet(CommandType cmdType, string cmdText, params OleDbParameter[] parameters)
        {
            OleDbCommand cmd = new OleDbCommand();
            DataSet dataSet = new DataSet();
            using (OleDbConnection connection = new OleDbConnection(connstr))
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, parameters);
                new OleDbDataAdapter(cmd).Fill(dataSet);

                return dataSet;
            }
        }



        public static DataTable GetDataTable(CommandType cmdType, string cmdText, params OleDbParameter[] parameters)
        {
            OleDbCommand cmd = new OleDbCommand();
            DataTable dataTable = new DataTable();
            using (OleDbConnection connection = new OleDbConnection(connstr))
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, parameters);
                new OleDbDataAdapter(cmd).Fill(dataTable);
                connection.Close();
            }
            return dataTable;
        }

        private static void PrepareCommand(OleDbCommand cmd, OleDbConnection conn, OleDbTransaction trans, CommandType cmdType, string cmdText, OleDbParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            if (trans != null)
            {
                cmd.Transaction = trans;
            }
            cmd.CommandType = cmdType;
            if (cmdParms != null)
            {
                foreach (OleDbParameter parameter in cmdParms)
                {
                    cmd.Parameters.Add(parameter);
                }
            }
        }



        public static void alert(string texts)
        {
            HttpContext.Current.Response.Write("<script>alert('" + texts + "');</script>");
        }

        public static void alert(string texts, string urls)
        {
            HttpContext.Current.Response.Write("<script>alert('" + texts + "');window.location.href='" + urls + "';</script>");
        }

        public static void locationhref(string urls)
        {
            HttpContext.Current.Response.Write("<script>window.location.href='" + urls + "';</script>");
        }



        public static int getminxu(string biao, string xu)
        {
            string sql = "select min(" + xu + ") from " + biao + "";
            string ids = ExecuteScalar(CommandType.Text, sql, null).ToString();

            if (string.IsNullOrEmpty(ids))
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(ids);
            }
        }



        public static int getmaxxu(string biao, string xu)
        {
            string sql = "select max(" + xu + ") from " + biao + "";
            string ids = ExecuteScalar(CommandType.Text, sql, null).ToString();

            if (string.IsNullOrEmpty(ids))
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(ids);
            }
        }

        public static int getmaxxu(string biao, string xu, int isjia)
        {
            string sql = "select max(" + xu + ") from " + biao + "";
            string ids = ExecuteScalar(CommandType.Text, sql, null).ToString();

            if (string.IsNullOrEmpty(ids))
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(ids) + isjia;
            }

        }

        public static void filldroplist(HtmlSelect dl, string sql)
        {
            DataTable dt = GetDataTable(CommandType.Text, sql, null);
            dl.DataSource = dt;
            dl.DataTextField = dt.Columns[0].Caption.ToString();
            dl.DataValueField = dt.Columns[1].Caption.ToString();
            dl.DataBind();
        }

        public static string getappsetting(string keys)
        {
            return ConfigurationManager.AppSettings[keys].ToString();
        }

        public static string cutstr(string strChar, int intLength)
        {
            //取得自定义长度的字符串
            if (strChar.Length > intLength)
            { return strChar.Substring(0, intLength); }
            else
            { return strChar; }
        }

        /// <summary>
        /// 设置网站标题
        /// </summary>
        /// <param name="ls"></param>
        /// <param name="yuyan"></param>
        /// <returns></returns>
        public static string getwebtitle()
        {
            string webmc= webinfor.getwebinfor().Rows[0]["sitename"].ToString();
            
            string aa = "";
            aa = webmc;
            return aa;
        }

        /// <summary>
        /// textarea中的字符转成html的格式
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string converthtml(string ss)
        {
            string s = ss;
            s = s.Replace("<", "&lt;");
            s = s.Replace(">", "&gt;");
            s = s.Replace("chr(32)", "&nbsp;");
            s = s.Replace("chr(13)", "<br>");
            s = s.Replace("'", "&#39;");
            return s;
        }

        /// <summary>
        /// html字符还原
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static string htmltotext(string ss)
        {
            string s = ss;



            s = s.Replace("&lt;", "<");
            s = s.Replace("&gt;", ">");
            s = s.Replace("&nbsp;", "chr(32)");
            s = s.Replace("<br>", "chr(13)");
            s = s.Replace("&#39;", "'");
            return s;
        }

        /// <summary>
        /// 过滤非法字符
        /// </summary>
        /// <param name="strs"></param>
        /// <returns></returns>
        public static string replacehtml(string strs)
        {
            string retVal = strs;
            retVal = retVal.Replace("'", "");
            retVal = retVal.Replace("/", "");
            retVal = retVal.Replace("#", "");
            retVal = retVal.Replace(".", "");
            retVal = retVal.Replace("*", "");
            retVal = retVal.Replace("+", "");
            retVal = retVal.Replace("-", "");
            retVal = retVal.Replace("$", "");
            retVal = retVal.Replace("@", "");
            retVal = retVal.Replace("!", "");
            retVal = retVal.Replace(";", "");
            retVal = retVal.Replace(":", "");
            retVal = retVal.Replace("\\", "");
            retVal = retVal.Replace("%", "");
            return retVal;
        }
        

    }
}
