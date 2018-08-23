using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //session of user is null
        if (Session["user"] == null)
        {
            //redirect to the loginform.aspx
            Response.Redirect("LoginForm.aspx");
        }
        //get the list seminar from global.asax
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        gvSeminar.DataSource = seminars;
        gvSeminar.DataBind();
    }
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        //Send email by using smpt client (gmail.com)
        SmtpClient client = new SmtpClient("smtp.gmail.com");
        client.EnableSsl = true;
        client.Credentials = new NetworkCredential("inft3050@gmail.com", "inft.3050");
        //message send from inft3050@gmail.com and to by user adding in textbox of tbxEmail.com
        MailMessage message = new MailMessage("inft3050@gmail.com", tbxEmail.Text);
        message.Subject = "Feedback";
        message.Body = "Thanks for your feedback! We will try our best on your comments to us.";
        client.Send(message);
        lblOutput.Text = "Thanks for your feedback!";
    }

    protected void gvSeminar_SelectedIndexChanged(object sender, EventArgs e)
    {
        //get the list seminar from global.asax
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        //calling data from seminars and schedule
        Seminar a = seminars[gvSeminar.PageSize * gvSeminar.PageIndex + gvSeminar.SelectedIndex];
        tbxSeminarName.Text = a.Name;
    }
    public void databind()
    {
        //get the list seminar from global.asax
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        gvSeminar.DataSource = seminars;
        gvSeminar.DataBind();
    }
    protected void gvSeminars_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //creating a new page index
        gvSeminar.PageIndex = e.NewPageIndex;
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        databind();
    }
}