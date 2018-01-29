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
namespace Svendeproeve.Admin.Retailer
{
    public partial class Edit : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Update methd to update the selected Retailer item
        // USAGE: <asp:FormView UpdateMethod="UpdateItem">
        public void UpdateItem(int RetailerID)
        {
            using (_db)
            {
                Guid random = Guid.NewGuid();
                var item = _db.Retailer.Find(RetailerID);
                FileUpload fileup = (FileUpload)fvUpload.FindControl("FileUploader");
                item.Logo = fileup.FileName;

                TryUpdateModel(item);

                if (fileup.HasFile)
                {
                    string FilePath = Server.MapPath("~/UploadedImages/" + item.Logo);
                    fileup.SaveAs(FilePath);

                    var Item = _db.Retailer.Find(RetailerID);

                    if (item == null)
                    {
                        // The item wasn't found
                        ModelState.AddModelError("", String.Format("Item with id {0} was not found", RetailerID));
                        return;
                    }

                    TryUpdateModel(Item);

                    if (ModelState.IsValid)
                    {
                        // Save changes here
                        _db.SaveChanges();
                        Response.Redirect("../Default");
                    }

                }
            }
        }

        // This is the Select method to selects a single Retailer item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Svendeproeve.Models.Retailer GetItem([FriendlyUrlSegmentsAttribute(0)]int? RetailerID)
        {
            if (RetailerID == null)
            {
                return null;
            }

            using (_db)
            {
                return _db.Retailer.Find(RetailerID);
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
