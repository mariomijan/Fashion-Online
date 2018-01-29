using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Svendeproeve.Models;

namespace Svendeproeve
{
    public partial class CollectionDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


                BindCollection();
            
        }
        private void BindCollection()
        {


                using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
                {

                    int ID = Convert.ToInt32(Page.Request.QueryString["id"].ToString());

                    lblInfo.Text = db.Collection.Find(ID).CollectionName;

                    lsCollection.DataSource = db.Product.Where(x => x.CollectionID == ID).OrderByDescending(x => x.ProductID).ToList();
                    lsCollection.DataBind();
                   
            }
               
        }

        protected void lsCollection_PagePropertiesChanged(object sender, EventArgs e)
        {
            BindCollection();

        }
    }
}
