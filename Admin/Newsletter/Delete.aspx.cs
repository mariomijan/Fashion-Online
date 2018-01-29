﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using Svendeproeve.Models;

namespace Svendeproeve.Admin.Newsletter
{
    public partial class Delete : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected Newsletter item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int NewsletterID)
        {
            using (_db)
            {
                var item = _db.Newsletter.Find(NewsletterID);

                if (item != null)
                {
                    _db.Newsletter.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single Newsletter item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Svendeproeve.Models.Newsletter GetItem([FriendlyUrlSegmentsAttribute(0)]int? NewsletterID)
        {
            if (NewsletterID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Newsletter.Where(m => m.NewsletterID == NewsletterID).FirstOrDefault();
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

