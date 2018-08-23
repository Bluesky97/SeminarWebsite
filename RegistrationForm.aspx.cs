using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
    }

    //when register button are clicked
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Member m = new Member()
        {
            Email = tbxEmail.Text,
            Name = tbxName.Text,
            Password = tbxPw.Text,
            PhoneNo = Convert.ToInt32(tbxPhone.Text),
            Address = tbxAddress.Text
        };
        int id = ParticipantMgr.insertParticipant(m);
        lblOutput.Text = id + " Added!";

        //send an email by using smpt client of gmail.com
        SmtpClient client = new SmtpClient("smtp.gmail.com");
        client.EnableSsl = true;
        client.Credentials = new NetworkCredential("inft3050@gmail.com", "inft.3050");

        MailMessage message = new MailMessage("inft3050@gmail.com", tbxEmail.Text);
        message.Subject = "Registration";
        message.Body = "Registration successful!";
        client.Send(message);
        lblOutput.Text = "Please check email for username and password";
    }
}