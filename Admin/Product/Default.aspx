<%@ Page Title="ProductList" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Default.aspx.cs" Inherits="Svendeproeve.Admin.Product.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <h2>Product List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="ProductID" 
			ItemType="Svendeproeve.Models.Product"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Product
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="ProductID" CommandName="Sort" CommandArgument="ProductID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="ProductName" CommandName="Sort" CommandArgument="ProductName" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Description" CommandName="Sort" CommandArgument="Description" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Image" CommandName="Sort" CommandArgument="Image" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="RetailerID" CommandName="Sort" CommandArgument="RetailerID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="UserID" CommandName="Sort" CommandArgument="UserID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="GenderID" CommandName="Sort" CommandArgument="GenderID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="CollectionID" CommandName="Sort" CommandArgument="CollectionID" runat="Server" />
							</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
				<asp:DataPager PageSize="5"  runat="server">
					<Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                        <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                    </Fields>
				</asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
							<td>
								<asp:DynamicControl runat="server" DataField="ProductID" ID="ProductID" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="ProductName" ID="ProductName" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Description" ID="Description" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Image" ID="Image" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.Retailer != null ? Item.Retailer.Name : "" %>
							</td>
							<td>
								<%#: Item.Userlogin != null ? Item.Userlogin.LoginName : "" %>
							</td>
							<td>
								<%#: Item.Gender != null ? Item.Gender.GenderName : "" %>
							</td>
							<td>
								<%#: Item.Collection != null ? Item.Collection.CollectionName : "" %>
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Product/Details", Item.ProductID) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Product/Edit", Item.ProductID) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Product/Delete", Item.ProductID) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

