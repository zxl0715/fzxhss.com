﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class prob : System.Web.UI.Page
{
    public string aa = "";
    public string name2 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        aa = Convert.ToString(Request["id"]);
        name2 = Convert.ToString(Request["name"]);
        this.btnClose.Attributes.Add("onclick", "window.close()");
    }
    
}
