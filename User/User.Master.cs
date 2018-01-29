using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserLogin;

namespace Svendeproeve.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (!UserLogin.User.IsInRole(UserLogin.Role.User))
                {

                    if (IsPostBack)
                    {
                        Response.Redirect("/");

                    }
                }

                else
                {
                    lblUsername.Text = "Welcome " + CurrentUser.GetUser().Username;

                }


                if (UserLogin.User.IsInRole(UserLogin.Role.Admin))
                {
                    lblUsername.Text = "Welcome " + CurrentUser.GetUser().Username;

                }
            }
        }

        protected void btnLogOff_Click(object sender, EventArgs e)
        {
            CurrentUser.LogOff();

        }
    }
}