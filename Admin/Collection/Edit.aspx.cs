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
namespace Svendeproeve.Admin.Collection
{
    public partial class Edit : System.Web.UI.Page
    {
		protected Svendeproeve.Models.Sv_Eksamen_Entities _db = new Svendeproeve.Models.Sv_Eksamen_Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Update methd to update the selected Collection item
        // USAGE: <asp:FormView UpdateMethod="UpdateItem">
        public void UpdateItem(int CollectionID)
        {
            using (_db)
            {
                Guid random = Guid.NewGuid();
                var item = _db.Collection.Find(CollectionID);
                FileUpload fileup = (FileUpload)fvUpload.FindControl("FileUploader");
                item.Image = fileup.FileName;

                TryUpdateModel(item);

                if (fileup.HasFile)
                {
                    string FilePath = Server.MapPath("~/UploadedImages/" + item.Image);
                    fileup.SaveAs(FilePath);

                    var Item = _db.Collection.Find(CollectionID);

                    if (item == null)
                    {
                        // The item wasn't found
                        ModelState.AddModelError("", String.Format("Item with id {0} was not found", CollectionID));
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

        // This is the Select method to selects a single Collection item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public Svendeproeve.Models.Collection GetItem([FriendlyUrlSegmentsAttribute(0)]int? CollectionID)
        {
            if (CollectionID == null)
            {
                return null;
            }

            using (_db)
            {
                return _db.Collection.Find(CollectionID);
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
