using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;


public partial class ShoppingCartForm : System.Web.UI.Page
{
    
    //declare total 
    double total;
    protected void Page_Load(object sender, EventArgs e)
    {
        //session of user is null
        if (Session["user"] == null)
        {
            //redirect to the loginform.aspx
            Response.Redirect("LoginForm.aspx");
        }
        //session of cart is not null
        if (Session["cart"] != null)
        {
            ShoppingCart sc = (ShoppingCart)Session["cart"];
            tbxId.Text = sc.Seminar.Id;
            tbxCategoryName.Text = sc.Seminar.CategoryName;
            tbxTitle.Text = sc.Seminar.Name;
            tbxSpeakerName.Text = sc.Seminar.Speaker.Name;
            tbxDesc.Text = sc.Seminar.Description;
            tbxDuration.Text = sc.Seminar.Duration.ToString();
            tbxDate.Text = sc.Seminar.Schedule.Date.ToShortDateString();
            lblAmount.Text = sc.Seminar.Price.ToString("C");
            lblDate.Text = DateTime.Now.ToShortDateString();
        }
        else
        {
            lblOutput0.Text = "No seminar selected";
        }

    }
    //when confirm button are clicked
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        //payment details can not be null
        if (tbxName.Text != null && tbxCC.Text != null && ddlCCType.Text != null && tbxExpDate.Text != null)
        {
            ShoppingCart sc = (ShoppingCart)Session["cart"];
            sc.Name = tbxName.Text;
            if (rdbCash.Checked == true)
            {
                sc.OptionPay = rdbCash.Text;

            }
            else
            {
                sc.OptionPay = rdbCC.Text;
            }
            sc.CreditCard = tbxCC.Text;
            sc.CreditCardType = ddlCCType.Text;
            sc.SecurityCode = tbxCode.Text;
            sc.CCExpiryDate = tbxExpDate.Text;
            string a = lblAmount.Text;
            string b = a.Substring(1);
            lblAmount.Text = b;
            sc.TotalAmount = Convert.ToDecimal(lblAmount.Text);
            Review r = new Review()
            {
                Rating = 0,
                Remarks = " ",
                Seminar = sc.Seminar,
                Member = sc.Member
            };
            int id = ReviewDBMgr.insertReview(r);
            int Id = ShoppingCartDBMgr.purchaseSeminar(sc);
            lblOutput.Text = "Confirm. order id is " + Id;
            //display output for payment successfully
            //lblOutput.Text = "Payment Successfully!";
            //make it null for amount, date and session of cart after transaction are being successful
            lblAmount.Text = null;
            lblDate.Text = null;
            Session["cart"] = null;
            //send an email for confirmation
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.EnableSsl = true;
            client.Credentials = new NetworkCredential("inft3050@gmail.com", "inft.3050");

            MailMessage msg = new MailMessage("inft3050@gmail.com", sc.Member.Email);
            msg.Subject = "Payment confirmation";
            msg.Body = "Thanks for joining our seminar!";
            client.Send(msg);
        }
        else
        {
            //display an output if payment is not valid
            lblOutput.Text = "Payment is not valid!";
        }
    }
    //when cash radio button are being checked
    protected void rdbCash_CheckedChanged(object sender, EventArgs e)
    {
        //credit card no, type and expiry date cannot be entered
        if (rdbCash.Checked == true)
        {
            tbxCC.Text = "NA";
            tbxCode.Text = "NA";
            tbxExpDate.Text = "NA";
            tbxCC.Enabled = false;
            ddlCCType.Enabled = false;
            tbxCode.Enabled = false;
            tbxExpDate.Enabled = false;
            //display a discount 
            lblDiscount.Text = "0%";
        }
        //display an output if payment by cash
        lblOutput.Text = "Payment later will be present at the seminar";
    }

    //when credit card radio button are being checked
    protected void rdbCC_CheckedChanged(object sender, EventArgs e)
    {
        //must fill in credit card no, type and expiry date
        if (rdbCC.Checked == true)
        {
            tbxCC.Enabled = true;
            ddlCCType.Enabled = true;
            tbxCode.Enabled = true;
            tbxExpDate.Enabled = true;
            //display a discount
            lblDiscount.Text = "10%";
        }
        //converting an amount
        string a = lblAmount.Text.ToString();
        //substring an amount by using currency format
        string b = a.Substring(1, a.Length - 1);
        //convert to the double
        double total = Convert.ToDouble(b);
        //calculate the discount
        total = total * 0.9;
        //display an amount by using currency format
        lblAmount.Text = "$" + Convert.ToString(total);
        //display an output to key-in your bank card details
        lblOutput.Text = "Please key-in your debit/credit card details";
    }

    protected void gvSeminar_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        lblOutput0.Text = "Purchased Cancelled";
        Session["cart"] = null;
    }
}