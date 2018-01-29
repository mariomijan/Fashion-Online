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

namespace Svendeproeve.Admin.News
{
    public partial class Delete : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected News item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int NewsID)
        {
            using (_db)
            {
                var item = _db.News.Find(NewsID);

                if (item != null)
                {
                    _db.News.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single News item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Svendeproeve.Models.News GetItem([FriendlyUrlSegmentsAttribute(0)]int? NewsID)
        {
            if (NewsID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.News.Where(m => m.NewsID == NewsID).FirstOrDefault();
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
