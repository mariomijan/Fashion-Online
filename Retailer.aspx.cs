using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Svendeproeve.Models;

namespace Svendeproeve
{
    public partial class Retailer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                RpRetailer.DataSource = db.Retailer.ToList();
                RpRetailer.DataBind();
                
              
            }

        }
    }
}