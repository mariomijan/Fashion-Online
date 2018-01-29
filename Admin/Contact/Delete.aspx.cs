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

namespace Svendeproeve.Admin.Contact
{
    public partial class Delete : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected Contact item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int ContactID)
        {
            using (_db)
            {
                var item = _db.Contact.Find(ContactID);

                if (item != null)
                {
                    _db.Contact.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single Contact item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Svendeproeve.Models.Contact GetItem([FriendlyUrlSegmentsAttribute(0)]int? ContactID)
        {
            if (ContactID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Contact.Where(m => m.ContactID == ContactID).FirstOrDefault();
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

