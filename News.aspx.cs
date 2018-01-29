using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Svendeproeve.Models;

namespace Svendeproeve
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            BindNews();


        }
        private void BindNews()
        {
           
                using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
                {
                    lsNews.DataSource = db.News.OrderByDescending(x => x.NewsID).ToList();
                    lsNews.DataBind();

                
            }

        }

        protected void lsNews_PagePropertiesChanged(object sender, EventArgs e)
        {
            BindNews();
        }
    }
}