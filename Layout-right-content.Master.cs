﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Svendeproeve.Models;

namespace Svendeproeve
{
    public partial class Layout_right_content : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Remove postback
            ImgLeft.Attributes.Add("onclick", "return false;");
            ImgRight.Attributes.Add("onclick", "return false;");
        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            // Henter de 2 tekstbokse op i variabler
            string LoginName = txtLoginName.Text;
            string LoginPass = txtLoginPass.Text;

            // Tjekker der er indhold i begge
            if (!string.IsNullOrEmpty(LoginName) && !string.IsNullOrEmpty(LoginPass))
            {
                // Forsøger at logge ind, og modtager svar fra login systemet
                UserLogin.LoginStatus GetResponse = UserLogin.User.Login(LoginName, LoginPass);

                if (!UserLogin.User.IsInRole(UserLogin.Role.Admin))
                {

                    switch (GetResponse)
                    {

                        case UserLogin.LoginStatus.WrongPass:
                            txtLoginName.Text = String.Empty;
                            txtLoginPass.Text = String.Empty;
                            break;

                        case UserLogin.LoginStatus.NotFound:
                            txtLoginName.Text = String.Empty;
                            txtLoginPass.Text = String.Empty;
                            break;

                        case UserLogin.LoginStatus.Error:
                            txtLoginName.Text = String.Empty;
                            txtLoginPass.Text = String.Empty;
                            break;

                    }
                }

                else
                {

                    switch (GetResponse)
                    {

                        case UserLogin.LoginStatus.OK:
                            Response.Redirect("/Admin");
                            break;
                    }
                }

                if (!UserLogin.User.IsInRole(UserLogin.Role.User))
                {

                    switch (GetResponse)
                    {
                        case UserLogin.LoginStatus.Error:
                            txtLoginName.Text = String.Empty;
                            txtLoginPass.Text = String.Empty;
                            break;

                        case UserLogin.LoginStatus.WrongPass:
                            txtLoginName.Text = String.Empty;
                            txtLoginPass.Text = String.Empty;
                            break;

                        case UserLogin.LoginStatus.NotFound:
                            txtLoginName.Text = String.Empty;
                            txtLoginPass.Text = String.Empty;
                            break;
                    }
                }
                else
                {
                    switch (GetResponse)
                    {

                        case UserLogin.LoginStatus.OK:
                            Response.Redirect("/User");
                            break;

                    }
                }
            }

        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            
            Tools tool = new Tools();

            string subject = txtName.Text;
            string body = "You are now subscribed";
            string email = txtEmail.Text;

            if (!string.IsNullOrEmpty(subject) && !string.IsNullOrEmpty(email) && tool.IsValidEmail(email))
            {
                using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
                {

                    Newsletter news = new Newsletter();
                    news.Email = txtEmail.Text;
                    news.Name = txtName.Text;

                    db.Newsletter.Add(news);
                    db.SaveChanges();

                    string to = "mm66035@elev.mediacollege.dk";
                    string SMTP = "10.138.22.47";

                    tool.SendMail(to, email, subject, body, SMTP);

                    txtName.Text = String.Empty;
                    txtEmail.Text = String.Empty;
                    
                    ltStatus.Text = "You are now subscribed!";

                }
            }
            else
            {
                ltStatus.Text = "Please fill out your email";
            }
        }


        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            if (txtSearch.Value != "")
            {

                string SearchWord = txtSearch.Value.ToLower().Trim();

                Response.Redirect("~/SearchResult.aspx?query=" + Server.HtmlEncode(SearchWord));

            }
        }
    }
}

