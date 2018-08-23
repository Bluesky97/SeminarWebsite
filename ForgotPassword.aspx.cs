using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    public static string conStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //when send button is clicked
    //to send an email for user to checked the password
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string email = string.Empty;
        string password = string.Empty;
        using (SqlConnection con = new SqlConnection(conStr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT participant_email, participant_password FROM Participant WHERE participant_email = @participant_email", con))
            {
                cmd.Parameters.AddWithValue("@participant_email", tbxEmail.Text);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    if (sdr.Read())
                    {
                        email = sdr["participant_email"].ToString();
                        password = sdr["participant_password"].ToString();
                    }
                }
            }
            con.Close();
        }
        if (!string.IsNullOrEmpty(password))
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("inft3050@gmail.com");
            mm.To.Add(tbxEmail.Text);
            mm.Subject = "Password Recovery";
            mm.Body = string.Format("Your email is: " + email + "<br/><br/>" + "Your password is: " + password);
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            System.Net.NetworkCredential ntwd = new NetworkCredential();
            ntwd.UserName = tbxEmail.Text;
            ntwd.Password = "";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = ntwd;
            smtp.Port = 587;
            smtp.Send(mm);
            lblOutput.Text = "Password has been sent to your email address.";
        }
    }
}