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

namespace Svendeproeve.Admin.Userlogin
{
    public partial class Delete : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected Userlogin item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int UserID)
        {
            using (_db)
            {
                var item = _db.Userlogin.Find(UserID);

                if (item != null)
                {
                    _db.Userlogin.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single Userlogin item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Svendeproeve.Models.Userlogin GetItem([FriendlyUrlSegmentsAttribute(0)]int? UserID)
        {
            if (UserID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Userlogin.Where(m => m.UserID == UserID).Include(m => m.Role).FirstOrDefault();
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

