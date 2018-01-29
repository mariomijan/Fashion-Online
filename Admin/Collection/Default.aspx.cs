﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Svendeproeve.Models;

namespace Svendeproeve.Admin.Collection
{
    public partial class Default : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Model binding method to get List of Collection entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<Svendeproeve.Models.Collection> GetData()
        {
            return _db.Collection;
        }
    }
}

