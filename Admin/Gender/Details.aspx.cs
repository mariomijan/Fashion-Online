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

namespace Svendeproeve.Admin.Gender
{
    public partial class Details : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Select methd to selects a single Gender item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Svendeproeve.Models.Gender GetItem([FriendlyUrlSegmentsAttribute(0)]int? GenderID)
        {
            if (GenderID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Gender.Where(m => m.GenderID == GenderID).FirstOrDefault();
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

