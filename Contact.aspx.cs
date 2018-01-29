using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Svendeproeve.Models;

namespace Svendeproeve
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

            Tools tool = new Tools();

            string from = txtEmail.Text;
            string subject = txtName.Text;
            string email = txtEmail.Text;
            string body = txtMessage.Value;

            if (!string.IsNullOrEmpty(subject) && !string.IsNullOrEmpty(from) && !string.IsNullOrEmpty(body) && tool.IsValidEmail(email))
            {

                using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
                {

                    Svendeproeve.Models.Contact contact = new Svendeproeve.Models.Contact();

                    contact.Name= txtName.Text;
                    contact.Email = txtEmail.Text;
                    contact.Message = txtMessage.Value;

                    db.Contact.Add(contact);
                    db.SaveChanges();

                    string to = "mm66035@elev.mediacollege.dk";
                    string SMTP = "10.138.22.47";

                    tool.SendMail(to, from, subject, body, SMTP);

                    txtEmail.Text = "";
                    txtName.Text = "";
                    txtMessage.Value = "";

                    lblMessage.Text = "Thank you for your message !";

                    lblFillout.Visible = false;
                    lblMessage.Visible = true;

                }
            }

            else
            {
                lblFillout.Text = "Please fill out all fields !";
                lblMessage.Visible = false;
                lblFillout.Visible = true;
            }

        }
    }
}