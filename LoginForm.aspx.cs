using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginForm : System.Web.UI.Page
{
    public static string conStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignUp_Click1(object sender, EventArgs e)
    {
        //redirect to the registration web form 
        Response.Redirect("RegistrationForm.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //create an admin account 
        if (tbxEmail.Text == "admin@admin.com" && tbxPassword.Text == "admin")
        {
            //create a session for admin
            Session["admin"] = tbxEmail.Text;
            //redirect to AdminView page
            Server.Transfer("AdminView.aspx");
        }
        //check the boolean is true
        bool found = true;
        //call participant database to the member login
        Member m = ParticipantMgr.getParticipantByEmail(tbxEmail.Text, tbxPassword.Text);
        if (m != null)
        {
            if (m.Email == tbxEmail.Text)
            {
                found = true;
                if (m.Password == tbxPassword.Text)
                {
                    //create session for user
                    Session["user"] = m;
                    //redirect to the default page
                    Server.Transfer("Default.aspx");
                }
                else
                {
                    lblOutput.Text = "Incorrect password";
                }

            }
            //if boolean is false
            //user have not register yet
            if (found == false)
            {
                //to show invalid email and password
                lblOutput.Text = "Invalid email and password!";
            }
        }
    }
    //when forgot button are clicked
    protected void btnForgot_Click(object sender, EventArgs e)
    {
        //redirect to the forgot password web form
        Response.Redirect("ForgotPassword.aspx");
    }
}