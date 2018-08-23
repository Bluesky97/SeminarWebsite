using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewHistoryPayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if session of user is null
        if (Session["user"] == null)
        {
            //redirect to the login form
            Response.Redirect("LoginForm.aspx");
        }
        //calling shopping cart list from global.asax to the appllication called shoppingcarts
        Member m = (Member)Session["user"];
        List<ShoppingCart> shoppingcarts = ShoppingCartDBMgr.getAllShoppingCart(m.Email);
        gvSeminar.DataSource = shoppingcarts;
        gvSeminar.DataBind();
    }

    //when grid view of seminar is selected
    protected void gvSeminar_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Member m = (Member)Session["user"];
        List<ShoppingCart> shoppingcarts = ShoppingCartDBMgr.getAllShoppingCart(m.Email);
        gvSeminar.DataSource = shoppingcarts;
        gvSeminar.DataBind();
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        List<Schedule> schedules = ScheduleMgr.getAllSchedule();
        List<Review> reviews = ReviewDBMgr.getAllReviewById(m.Email);
        Seminar a = seminars[gvSeminar.PageSize * gvSeminar.PageIndex + gvSeminar.SelectedIndex];
        Schedule b = schedules[gvSeminar.SelectedIndex];
        if (reviews == null)
        {
            tbxRating.Text = "0";
            tbxRemarks.Text = " ";
        }
        else
        {
            Review c = reviews[gvSeminar.SelectedIndex];
            tbxRating.Text = c.Rating.ToString();
            tbxRemarks.Text = c.Remarks;
        }
        tbxId.Text = a.Id;
        tbxName.Text = a.Name;
        tbxPrice.Text = a.Price.ToString();
        tbxDate.Text = b.Date.ToShortDateString();
    }
    //databind method
    public void databind()
    {
        //calling shopping cart list from global.asax to the appllication called shoppingcarts
        Member m = (Member)Session["user"];
        List<ShoppingCart> shoppingcarts = ShoppingCartDBMgr.getAllShoppingCart(m.Email);
        gvSeminar.DataSource = shoppingcarts;
        gvSeminar.DataBind();
    }
    protected void gvSeminar_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //calling shopping cart list from global.asax to the appllication called shoppingcarts
        Member m = (Member)Session["user"];
        List<ShoppingCart> shoppingcarts = ShoppingCartDBMgr.getAllShoppingCart(m.Email);
        ShoppingCart sc = shoppingcarts[e.RowIndex];
        //payment by cash can be removed
        if (sc.OptionPay == "Cash")
        {
            ShoppingCartDBMgr.deleteSeminar(sc.Id);
            shoppingcarts.Remove(sc);
            databind();
            //send an email by using smpt client of gmail.com
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.EnableSsl = true;
            client.Credentials = new NetworkCredential("inft3050@gmail.com", "inft.3050");

            MailMessage message = new MailMessage("inft3050@gmail.com", m.Email);
            message.Subject = "Cancellation";
            message.Body = "Cancellation successful!";
            client.Send(message);
            lblDetails.Text = "Please check your email for cancellation of seminar";
        }
        else
        {
            //display an output if payment by credit card cannot be deleted
            lblDetails.Text = "Pay using credit card cannot be deleted!";
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Member m = (Member)Session["user"];
        List<ShoppingCart> shoppingcarts = ShoppingCartDBMgr.getAllShoppingCart(m.Email);
        gvSeminar.DataSource = shoppingcarts;
        gvSeminar.DataBind();
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        Seminar a = seminars[gvSeminar.SelectedIndex];
        List<Review> reviews = ReviewDBMgr.getAllReviewById(m.Email);
        //Review c = reviews[gvSeminar.SelectedIndex];
        //tbxRating.Text = c.Rating.ToString();
        //tbxRemarks.Text = c.Remarks;
        Review r = new Review()
        {
            Rating = Convert.ToInt32(tbxRating.Text),
            Remarks = tbxRemarks.Text,
            Seminar = a,
            Member = m
        };
        int row = ReviewDBMgr.updateReview(r);
        lblOutput.Text = row + " Updated!";
    }
}
