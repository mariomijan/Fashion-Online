using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Svendeproeve.Models;
using UserLogin;

namespace Svendeproeve.Admin.Userlogin
{
    public partial class Insert : System.Web.UI.Page
    {
        protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // This is the Insert method to insert the entered Userlogin item
        // USAGE: <asp:FormView InsertMethod="InsertItem">
        public void InsertItem()
        {

            TextBox txtUsername = (TextBox)fvUpload.FindControl("txtUserName");
            TextBox txtLoginName = (TextBox)fvUpload.FindControl("txtLoginName");
            TextBox txtPassword = (TextBox)fvUpload.FindControl("txtLoginPass");
            TextBox txtEmail = (TextBox)fvUpload.FindControl("txtUserEmail");
            Literal ltStatus = (Literal)fvUpload.FindControl("ltStatus");

            using (_db)
            {

                // Overfører værdierne fra tekstboksene til Users objektet
                Svendeproeve.Models.Userlogin NewUser = new Svendeproeve.Models.Userlogin();
                NewUser.LoginName = txtLoginName.Text;
                NewUser.Password = txtPassword.Text;
                NewUser.Username = txtUsername.Text;
                NewUser.Email = txtEmail.Text;

                if (!string.IsNullOrEmpty(txtLoginName.Text) && !string.IsNullOrEmpty(txtPassword.Text) && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(txtUsername.Text))
                {
                    // Forsøger at opretteUserlogin
                    UserLogin.CreateStatus GetStatus = UserLogin.User.Insert(NewUser);

                    // Behandler tilbagesvar
                    switch (GetStatus)
                    {
                        case CreateStatus.Error:
                            ltStatus.Text = "Der er sket en fejl !";
                            break;
                        case CreateStatus.OK:
                            Response.Redirect("/Admin/Userlogin");
                            break;
                        case CreateStatus.UserNameExist:
                            ltStatus.Text = "Denne bruger eksisterer allerede !";
                            break;


                    }
                    var item = new Svendeproeve.Models.Userlogin();

                    TryUpdateModel(item);

                    if (ModelState.IsValid)
                    {
                        // Save changes
                        _db.Userlogin.Add(item);
                        _db.SaveChanges();

                        Response.Redirect("Default");

                }
                
                }
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("Default");
            }
        }
    }
}
