using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserLogin;

namespace Svendeproeve.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!UserLogin.User.IsInRole(UserLogin.Role.Admin))
                {


                    if (IsPostBack)
                    {
                        Response.Redirect("/");

                    }

                    if (UserLogin.User.IsInRole(UserLogin.Role.User))
                    {

                        Response.Redirect("~/Default.aspx");


                    }
                }

                else

                    lblUsername.Text = "Welcome " + CurrentUser.GetUser().Username;
            }
        }

        protected void btnLogOff_Click(object sender, EventArgs e)
        {
            CurrentUser.LogOff();
        }
    }
}