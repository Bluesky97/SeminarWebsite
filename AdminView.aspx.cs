using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if session of user is null
        if (Session["user"] == null)
        {
            //if session of admin is not null
            if(Session["admin"] != null)
            {
                //list the gridview from database
                List<Member> members = ParticipantMgr.getAllParticipant();
                gvMember.DataSource = members;
                gvMember.DataBind();
            }
            else
            {
                //redirect to the invalid page
                Response.Redirect("InvalidPage.aspx");
            }
        }
        else
        {
            //redirect to the invalid page
            Response.Redirect("InvalidPage.aspx");
        }
        
    }

    protected void gvMember_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        List < Member> members = ParticipantMgr.getAllParticipant();
        Member m = members[gvMember.SelectedIndex];
        List<ShoppingCart> shoppingcarts = ShoppingCartDBMgr.getAllShoppingCartByAdmin(m.Email);
        gvShoppingCart.DataSource = shoppingcarts;
        gvShoppingCart.DataBind();
    }

    protected void gvShoppingCart_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Seminar> seminars = SeminarMgr.getAllSeminar();
        List<Schedule> schedules = ScheduleMgr.getAllSchedule();
        Seminar a = seminars[gvShoppingCart.PageSize * gvShoppingCart.PageIndex + gvShoppingCart.SelectedIndex];
        Schedule b = schedules[gvShoppingCart.SelectedIndex];
        lblSeminarId.Text = a.Id;
        lblName.Text = a.Name;
        lblDate.Text = b.Date.ToShortDateString();
    }
}