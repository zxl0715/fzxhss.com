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

public partial class admin_vote : manage_c
{
    protected void Page_Load(object sender, EventArgs e)
        {
            
            string Action = q("action");
            if (!IsPostBack)
            {
                if (Action == "add")
                    editBox(0);
                else
                    getList();
            }
        }

        private void getList()
        {
            plList.Visible = true;
            plEdit.Visible = false;
            DataTable dt = sqlhelper.GetDataTable(CommandType.Text, "select id,title,votetotal,iif(type=0,'单选','多选') as type,iif(lock =0,'正常','关闭') as status,iif(lock =0,' 锁定','解锁') as lock from vote order by id desc",null);
            gvList.DataSource = dt;
            gvList.DataKeyNames = new string[] { "id" };
            gvList.PageSize = 15;
            gvList.DataBind();
        }

        private void editBox(int id)
        {
            plList.Visible = false;
            plEdit.Visible = true;
            hfId.Value = id.ToString();
            if (id > 0)
            {
                DataTable dt = sqlhelper.GetDataTable(CommandType.Text,"select title,votetext,[type] from [vote] where id=" + id,null);
                if (dt.Rows.Count > 0)
                {
                    txtTitle.Text = dt.Rows[0][0].ToString();
                    txtContent.Text = dt.Rows[0][1].ToString();
                    rblType.Items.FindByValue(dt.Rows[0][2].ToString()).Selected = true;
                }
                else
                {
                    rblType.Items.FindByValue("0").Selected = true;
                }
            }
            else
            {
                rblType.Items.FindByValue("0").Selected = true;
            }
        }
        protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvList.PageIndex = e.NewPageIndex;
            getList();
        }
        protected void gvList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            gvRowAddFun(ref e, 5, 3);
        }
        protected void gvList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ExecuteSql("delete from [vote] where ID=" + gvList.DataKeys[e.RowIndex].Value);
            getList();
        }
        protected void gvList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            editBox(Convert.ToInt32(gvList.DataKeys[e.NewEditIndex].Value));
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(hfId.Value);
            int voteTotal = txtContent.Text.Split('|').Length;
            string voteNum = "";
            for (int i = 0; i < voteTotal; i++)
            {
                voteNum += "|0";
            }
            voteNum = voteNum.Substring(1, voteNum.Length-1);
            if (id > 0)
            {
                ExecuteSql("update vote set title='" + SafeRequest(txtTitle.Text) + "',votetext='" + SafeRequest(txtContent.Text) + "',type=" + rblType.SelectedItem.Value + " where id=" + id.ToString());
            }
            else
            {
                ExecuteSql("insert into vote (title,type,votetext,votenum) values ('" + SafeRequest(txtTitle.Text) + "'," + rblType.SelectedItem.Value + ",'" + SafeRequest(txtContent.Text) + "','" + voteNum + "')");
            }
            getList();
        }
        protected void LinkButton3_Command(object sender, CommandEventArgs e)
        {
            string isLock = GetValueByKey("lock", "vote", "id=" + e.CommandArgument.ToString()) == "1" ? "0" : "1";
            ExecuteSql("update vote set lock=" + isLock + " where id=" + e.CommandArgument.ToString());
            getList();
        }
}

