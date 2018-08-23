using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class ListSeminar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Get the data from list seminars from database
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        gvSeminar.DataSource = seminars;
        gvSeminar.DataBind();

        //if session cart is not null
        if (Session["cart"] != null)
        {
            //calling shoppingcart class to the session cart
            ShoppingCart sc = (ShoppingCart)Session["cart"];
        }

    }
    public void databind()
    {
        //get the list seminar from global.asax
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        gvSeminar.DataSource = seminars;
        gvSeminar.DataBind();
        List<Schedule> schedules = ScheduleMgr.getAllScheduleById("");
        gvSchedule.DataSource = schedules;
        gvSchedule.DataBind();
        //List<Speaker> speakers = SpeakerDBMgr.getAllSpeaker();
        //gvSchedule.DataSource = speakers;
        //gvSchedule.DataBind();

        //if session of seminars are not null
        if (Session["seminars"] != null)
        {
            //calling shoppingcart class to the session cart
            ShoppingCart sc = (ShoppingCart)Session["cart"];
        }
    }
    //page index changing of grid view in list seminars
    protected void gvSeminars_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //creating a new page index
        gvSeminar.PageIndex = e.NewPageIndex;
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        databind();
    }

    //by selecting from grid view seminar list
    protected void gvSeminar_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        //calling data from seminars
        Seminar a = seminars[gvSeminar.PageSize * gvSeminar.PageIndex + gvSeminar.SelectedIndex];
        List<Schedule> schedules = ScheduleMgr.getAllScheduleById(a.Id);
        gvSchedule.DataSource = schedules;
        gvSchedule.DataBind();
        

    }

    //register button when click
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        //Panel1.Visible = true;
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        Seminar a = seminars[gvSeminar.PageSize * gvSeminar.PageIndex + gvSeminar.SelectedIndex];
        List<Schedule> schedules = ScheduleMgr.getAllScheduleById(a.Id);
        Schedule b = schedules[gvSchedule.SelectedIndex];
        List<Speaker> speakers = SpeakerDBMgr.getAllSpeaker();
        Speaker c = speakers[gvSeminar.SelectedIndex];

        if (Session["cart"] == null)
        {
            //member session of user
            ShoppingCart s = new ShoppingCart();
            s.Member = (Member)Session["user"];

            Session["cart"] = s;
        }
        //adding a seminar by user 
        ShoppingCart sc = (ShoppingCart)Session["cart"];
        sc.Seminar = a;
        sc.Seminar.Schedule = b;
        sc.Seminar.Speaker = c;

        //redirecting a new page to shoppingcartform.aspx
        Response.Redirect("ShoppingCartForm.aspx");

    }
   
    //search button click in list seminars
    protected void btnSearch_Click(object sender, EventArgs e)
    {
       
    }

    protected void gvSchedule_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        Seminar a = seminars[gvSeminar.PageSize * gvSeminar.PageIndex + gvSeminar.SelectedIndex];
        List<Schedule> schedules = ScheduleMgr.getAllScheduleById(a.Id);
        Schedule b = schedules[gvSchedule.SelectedIndex];
    }


    protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

