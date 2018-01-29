using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Svendeproeve.Models;

namespace Svendeproeve
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
                {

                    int ID = Convert.ToInt32(Page.Request.QueryString["id"].ToString());

                    lblTopProductName.Text = db.Product.Find(ID).ProductName;
                    lblProductName.Text = db.Product.Find(ID).ProductName;
                    lblDescription.Text = db.Product.Find(ID).Description;
                    Image.ImageUrl = "~/UploadedImages/" + db.Product.Find(ID).Image;
                    lblBottomDescription.Text = db.Product.Find(ID).Description;

                }
            }

        }
    }
}