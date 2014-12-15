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
using System.Text.RegularExpressions;

public partial class admin_n_class : manage_c
{
    public static string connstr = ConfigurationManager.AppSettings["accessConnStr"].ToString() + HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["accessdbPath"].ToString()) + ";";
    protected OleDbConnection conn = new OleDbConnection(connstr);
    protected OleDbCommand comm = new OleDbCommand();
    string ErrMsg = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        string Action = Request["action"];
        if (!IsPostBack)
        {
            if (Action == "add")
                editBox(0);
            else
                getList();
        }
    }
    private void editBox(int id)
    {
        plEdit.Visible = true;
        plList.Visible = false;
        string idd = "0" + Request["id"];
        if (IsNumeric(idd))//如果是数字
            id = Convert.ToInt32(idd);
        hfColumnId.Value = id.ToString();
        string code, type, style, isReview, isPost, isTop;
        code = "0000";
        type = style = "0";
        isReview = isPost = isTop = "1";

        DataTable dt;

        if (id > 0)
        {
            dt = sqlhelper.GetDataTable(CommandType.Text, "select Title,Code,Type,Info,OutURL,StyleId,IsReview,IsPost,IsTop from [n_class] where id=" + id.ToString(), null);
            if (dt.Rows.Count > 0)
            {
                txtColumnName.Text = dt.Rows[0][0].ToString();
                code = dt.Rows[0][1].ToString();
                type = dt.Rows[0][2].ToString();
                txtColumnInfo.Text = dt.Rows[0][3].ToString();
                txtColumnOuturl.Text = dt.Rows[0][4].ToString();
                style = dt.Rows[0][5].ToString();
                isReview = dt.Rows[0][6].ToString();
                isPost = dt.Rows[0][7].ToString();
                isTop = dt.Rows[0][8].ToString();
            }
        }

        dt = sqlhelper.GetDataTable(CommandType.Text, "select id,title,code from [n_class] order by code", null);
        ListItem li;
        li = new ListItem();
        li.Text = "根目录";
        li.Value = "0000";
        lbColumnCode.Items.Add(li);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (id.ToString() != dt.Rows[i][0].ToString().Trim())
            {
                if (dt.Rows[i][2].ToString().Length < code.Length || dt.Rows[i][2].ToString().Substring(0, code.Length) != code)
                {
                    li = new ListItem();
                    li.Value = dt.Rows[i][2].ToString();

                    li.Text = getColumnListName(dt.Rows[i][1].ToString(), dt.Rows[i][2].ToString());
                    lbColumnCode.Items.Add(li);

                }
            }
        }

        code = code.Length > 4 ? code.Substring(0, code.Length - 4) : "0000";
        if (lbColumnCode.Items.FindByValue(code) != null)
            lbColumnCode.Items.FindByValue(code).Selected = true;
        else
            lbColumnCode.Items.FindByValue("0000").Selected = true;
        rblType.Items.FindByValue(type).Selected = true;
        ddlStyle.Items.FindByValue(style).Selected = true;
        rbtnColumnIsReview.Items.FindByValue(isReview).Selected = true;
        rbtnColumnIsPost.Items.FindByValue(isPost).Selected = true;
        rblTop.Items.FindByValue(isTop).Selected = true;
    }

    private void getList()
    {
        plEdit.Visible = false;
        plList.Visible = true;
        DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select id,title,code,countNum,mangerNum,iif(type=0,null,'[专题]') as type,iif(istop=0,null,'[导航]') as istop from [n_class] order by code", null);
        gvList.DataSource = dt;
        gvList.DataKeyNames = new string[] { "id" };
        gvList.DataBind();
    }
    protected void gvList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (Convert.ToInt32(GetValueByKey("count(*)", "news", "ColumnId='" + gvList.DataKeys[e.RowIndex].Value + "'")) > 0)
        {
            ErrMsg = "此栏目还有文章，不能删除！";
            ShowErr(0, ErrMsg);
        }
        else
        {
            string sCode = GetValueByKey("code", "n_class", "id=" + gvList.DataKeys[e.RowIndex].Value);
            if (Convert.ToInt32(GetValueByKey("count(*)", "n_class", "left(code," + sCode.Length.ToString() + ")='" + sCode + "' and len(code)>" + sCode.Length.ToString())) > 0)
            {
                ErrMsg = "此栏目还有下级栏目，不能删除！";
                ShowErr(0, ErrMsg);
            }
            else
            {
                ExecuteSql("delete from [n_class] where id=" + gvList.DataKeys[e.RowIndex].Value);
                getList();
            }
        }
    }
    protected void btnSaveColumn_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            int id = Convert.ToInt32(hfColumnId.Value);

            string parentCode = lbColumnCode.SelectedValue;


            Response.Write(lbColumnCode.SelectedValue);
            //Response.Write("parentCode:" + parentCode + "end");
            string leftCode = string.Empty;
            string selfCode = string.Empty;
            string oldCode = string.Empty;
            string sourceCode = string.Empty;

            bool isEditCode = true;
            if (parentCode == "0000")
                parentCode = "";
            string isOut = "0";
            if (txtColumnOuturl.Text.Length > 0)
                isOut = "1";

            if (id > 0)
            {
                oldCode = GetValueByKey("code", "n_class", "id=" + hfColumnId.Value);

                sourceCode = oldCode;
                oldCode = oldCode.Substring(0, oldCode.Length - 4);
                if (oldCode == parentCode)
                    isEditCode = false;
            }

            if (isEditCode)
            {

                leftCode = GetValueByKey("code", "n_class", "left(code," + parentCode.Length.ToString() + ")='" + parentCode + "' and len(code)=" + Convert.ToString(parentCode.Length + 4) + " order by code desc");
                if (leftCode.Length > 0)
                    selfCode = Convert.ToString(Convert.ToInt32(leftCode.Substring(leftCode.Length - 4, 4)) + 1).PadLeft(4, '0');
                else
                    selfCode = "0001";

                selfCode = parentCode + selfCode;


                if (id == 0)
                {
                    ExecuteSql("insert into [n_class] (title,code,info,isout,outurl,StyleId,IsReview,IsPost,IsTop,Type) values ('" + SafeRequest(txtColumnName.Text) + "','" + selfCode + "','" + SafeRequest(txtColumnInfo.Text) + "'," + isOut + ",'" + SafeRequest(txtColumnOuturl.Text) + "'," + ddlStyle.SelectedValue + "," + rbtnColumnIsReview.SelectedValue + "," + rbtnColumnIsPost.SelectedValue + "," + rblTop.SelectedValue + "," + rblType.SelectedValue + ")");

                }
                else
                {

                    ExecuteSql("update [n_class] set title='" + SafeRequest(txtColumnName.Text) + "',code='" + selfCode + "',info='" + SafeRequest(txtColumnInfo.Text) + "',isOut=" + isOut + ",outUrl='" + SafeRequest(txtColumnOuturl.Text) + "',StyleId=" + ddlStyle.SelectedValue + ",isReview=" + rbtnColumnIsReview.SelectedValue + ",isPost=" + rbtnColumnIsPost.SelectedValue + ",isTop=" + rblTop.SelectedValue + ",type=" + rblType.SelectedValue + " where id=" + id.ToString());
                    ExecuteSql("update [n_class] Set code='" + selfCode + "'+Right(code,len(code)-" + sourceCode.Length.ToString() + ") where code like '" + sourceCode + "%'");

                }

            }
            else
            {

                ExecuteSql("update [n_class] set title='" + SafeRequest(txtColumnName.Text) + "',info='" + SafeRequest(txtColumnInfo.Text) + "',isOut=" + isOut + ",outUrl='" + SafeRequest(txtColumnOuturl.Text) + "',StyleId=" + ddlStyle.SelectedValue + ",isReview=" + rbtnColumnIsReview.SelectedValue + ",isPost=" + rbtnColumnIsPost.SelectedValue + ",isTop=" + rblTop.SelectedValue + ",type=" + rblType.SelectedValue + " where id=" + id.ToString());

            }
            getList();

        }
    }
    protected void gvList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        gvRowAddFun(ref e, 4, 3);
    }
    protected void gvList_RowEditing(object sender, GridViewEditEventArgs e)
    {
        editBox(Convert.ToInt32(gvList.DataKeys[e.NewEditIndex].Value));
    }
    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        string countNum = GetValueByKey("count(id)", "news", "columnId=" + e.CommandArgument + " and isdel=0");
        string managerNum = GetValueByKey("count(id)", "news", "columnId=" + e.CommandArgument + " and ispass=0 and isdel=0");
        ExecuteSql("update [n_class] set countNum=" + countNum + ",mangerNum=" + managerNum + " where id=" + e.CommandArgument);
        ErrMsg = "一个栏目更新完成!";
        ShowErr(0, ErrMsg);
    }
    protected void upColumn(object sender, CommandEventArgs e)
    {
        moveColumn(Convert.ToInt32(e.CommandArgument), 1);
    }
    protected void downColumn(object sender, CommandEventArgs e)
    {
        moveColumn(Convert.ToInt32(e.CommandArgument), -1);
    }

    protected void gvRowAddFun(ref GridViewRowEventArgs e, int c, int w)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='E4E8EF'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=''");
            if (w > 0)
                ((LinkButton)(e.Row.Cells[c].Controls[w])).Attributes.Add("onclick", "return confirm('确定要删除吗?')");
        }
    }
    private void moveColumn(int id, int isUp)
    {
        if (id == 0) return;
        string oldCode = GetValueByKey("code", "n_class", "id=" + id.ToString());
        int codeLen = oldCode.Length;
        if (codeLen > 1)
        {
            string temp = string.Empty;
            string wStr = "";
            string newStr = "";
            for (int i = 0; i < codeLen; i++)
                newStr += "-";
            if (codeLen > 4)
                wStr = " and left(code," + Convert.ToString(codeLen - 4) + ")='" + oldCode.Substring(0, codeLen - 4) + "'";
            if (isUp == 1)
                temp = GetValueByKey("top 1 code", "n_class", "len(code)=" + codeLen.ToString() + " and code<'" + oldCode + "'" + wStr + " order by code desc");
            else
                temp = GetValueByKey("top 1 code", "n_class", "len(code)=" + codeLen.ToString() + " and code>'" + oldCode + "'" + wStr + " order by code");

            if (temp.Length > 1)
            {
                //Move Under Column
                ExecuteSql("update [n_class] set code='" + newStr + "'+mid(code," + Convert.ToString(codeLen + 1) + ",len(code)) where left(code," + codeLen.ToString() + ")='" + temp + "'");

                //Update Target Column
                ExecuteSql("update [n_class] set code='" + temp + "'+mid(code," + Convert.ToString(codeLen + 1) + ",len(code)) where left(code," + codeLen.ToString() + ")='" + oldCode + "'");

                //Update Under Column
                ExecuteSql("update [n_class] set code='" + oldCode + "'+mid(code," + Convert.ToString(newStr.Length + 1) + ",len(code)) where left(code," + newStr.Length.ToString() + ")='" + newStr + "'");


            }
        }
        getList();
    }
}

