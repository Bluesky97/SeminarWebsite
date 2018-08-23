using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //get the data from global.asax
        dlSeminar.DataSource = SeminarMgr.getAllSeminar();
        dlSeminar.DataBind();
    }

    protected void dlSeminar_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnDetails_Click(object sender, EventArgs e)
    {
        //go to another page ListSeminar.aspx
        Response.Redirect("ListSeminar.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}