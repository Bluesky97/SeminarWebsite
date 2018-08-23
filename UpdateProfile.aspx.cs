using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if session of user is not null
        if (Session["user"] != null)
        {
            //not post back
            if (!IsPostBack)
            {
                //calling databinded method
                databinded();
            }
        }
        else
        {
            //redirect to the login form
            Response.Redirect("LoginForm.aspx");
        }
    }


    //when update button are being clicked
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //calling member class to the session of user
        Member m = (Member)Session["user"];
        m.Name = tbxName.Text;
        m.Email = tbxEmail.Text;
        m.PhoneNo = Convert.ToInt32(tbxPhone.Text);
        m.Address = tbxAddress.Text;
        m.Password = tbxPw.Text;
        m.CPassword = tbxCpw.Text;
        Session["user"] = m;
        int row = ParticipantMgr.updateParticipant(m);
        //display an output
        lblOutput.Text = "Update successfully!";
        databinded();
    }
    //databinded method
    public void databinded()
    {
        Member m = (Member)Session["user"];
        tbxName.Text = m.Name;
        tbxEmail.Text = m.Email;
        tbxPhone.Text = m.PhoneNo.ToString();
        tbxAddress.Text = m.Address;
        tbxPw.Text = m.Password;
        tbxCpw.Text = m.Password;
    }

}