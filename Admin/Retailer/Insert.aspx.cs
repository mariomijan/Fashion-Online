﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Svendeproeve.Models;

namespace Svendeproeve.Admin.Retailer
{
    public partial class Insert : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // This is the Insert method to insert the entered Retailer item
        // USAGE: <asp:FormView InsertMethod="InsertItem">
        public void InsertItem()
        {
            using (_db)
            {
                Guid random = Guid.NewGuid();
                var item = new Svendeproeve.Models.Retailer();
                FileUpload fileup = (FileUpload)fvUpload.FindControl("FileUploader");
                item.Logo = fileup.FileName;

                TryUpdateModel(item);

                if (fileup.HasFile)
                {
                    string FilePath = Server.MapPath("~/UploadedImages/" + item.Logo);
                    fileup.SaveAs(FilePath);
                    if (ModelState.IsValid)
                    {
                        // Save changes
                        _db.Retailer.Add(item);
                        _db.SaveChanges();

                        Response.Redirect("Default");
                    }
                }

            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("Default");
            }
        }
    }
}
