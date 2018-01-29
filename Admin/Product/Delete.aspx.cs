using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using Svendeproeve.Models;

namespace Svendeproeve.Admin.Product
{
    public partial class Delete : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected Product item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int ProductID)
        {
            using (_db)
            {
                var item = _db.Product.Find(ProductID);

                if (item != null)
                {
                    _db.Product.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single Product item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Svendeproeve.Models.Product GetItem([FriendlyUrlSegmentsAttribute(0)]int? ProductID)
        {
            if (ProductID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Product.Where(m => m.ProductID == ProductID).Include(m => m.Collection).Include(m => m.Gender).Include(m => m.Retailer).Include(m => m.Userlogin).FirstOrDefault();
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("../Default");
            }
        }
    }
}

