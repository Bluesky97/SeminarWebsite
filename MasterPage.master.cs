using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if session user is not null
        if (Session["user"] != null)
        {
            //username can appear in navbar
            lblUser.Text = ((Member)Session["user"]).Email;
            btnLogin.Text = "Logout";
            //if session of admin is not null
        }
        else if (Session["admin"] != null)
        {
            //show admin is login
            lblUser.Text = Session["admin"].ToString();
            btnLogin.Text = "Logout";
        }
        else
        {
            lblUser.Text = "";
            btnLogin.Text = "Login";
        }
    }
    //when login button clicked
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //transfer page to the login form
        if (btnLogin.Text == "Login")
            Server.Transfer("LoginForm.aspx");
        else
        {
            //session of user is null
            Session["user"] = null;
            Session["admin"] = null;
            //button of login changed back to login
            lblUser.Text = "";
            btnLogin.Text = "Login";
        }
    }


}
