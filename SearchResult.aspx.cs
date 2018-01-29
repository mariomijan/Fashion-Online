using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Svendeproeve.Models;

namespace Svendeproeve
{
    public partial class SearchResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindSearchResults();

            }

        }
        private void BindSearchResults()
        {
            //Search
            if (Request.QueryString["query"] != null)
            {
                string SearchWord = Server.HtmlDecode(Request.QueryString["query"]);

                using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
                {
                    List<Svendeproeve.Models.Product> Product = db.Product.ToList();

                    Product = db.Product.Where(i => i.ProductName.ToLower().Contains(SearchWord) ||
                    i.Description.ToLower().Contains(SearchWord) ||
                    i.Retailer.Name.ToLower().Contains(SearchWord)).ToList();


                    if (Product != null && Product.Count > 0)
                    {

                        lsSearchResults.DataSource = Product;
                        lsSearchResults.DataBind();

                        lsSearchResults.Visible = true;
                    }
                    else
                    {

                        int x = 400;
                        int y = 110;

                        Response.Write("<div style='float:left;position:relative;z-index:2;top:286px;margin-top:20px;margin-left:-90px;font-family:Arial;font-size:15px;color:#52423B" + y.ToString() + "px;left:" + x.ToString() + "px'>No match found</div>");

                        lsSearchResults.Visible = false;
                    }
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
          

        }

        protected void lsSearchResults_PagePropertiesChanged(object sender, EventArgs e)
        {
            BindSearchResults();
        }
    }
}
