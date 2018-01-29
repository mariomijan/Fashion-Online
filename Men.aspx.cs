using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Svendeproeve.Models;

namespace Svendeproeve
{
    public partial class Men : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {       
                using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
                {

                    lsMen.DataSource = db.Product.OrderByDescending(x => x.ProductID).ToList().Where(x => x.GenderID == 1).Take(9);
                    lsMen.DataBind();

                }
            }
        }
    }
}