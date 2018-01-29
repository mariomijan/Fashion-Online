<%@ Page Title="UserloginList" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Default.aspx.cs" Inherits="Svendeproeve.Admin.Userlogin.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <h2>Userlogin List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="UserID" 
			ItemType="Svendeproeve.Models.Userlogin"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Userlogin
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="UserID" CommandName="Sort" CommandArgument="UserID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="RoleID" CommandName="Sort" CommandArgument="RoleID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="LoginName" CommandName="Sort" CommandArgument="LoginName" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Username" CommandName="Sort" CommandArgument="Username" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Password" CommandName="Sort" CommandArgument="Password" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Email" CommandName="Sort" CommandArgument="Email" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Status" CommandName="Sort" CommandArgument="Status" runat="Server" />
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
								<asp:DynamicControl runat="server" DataField="UserID" ID="UserID" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.Role != null ? Item.Role.Name : "" %>
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="LoginName" ID="LoginName" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Username" ID="Username" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Password" ID="Password" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Email" ID="Email" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Status" ID="Status" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Userlogin/Details", Item.UserID) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Userlogin/Edit", Item.UserID) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Admin/Userlogin/Delete", Item.UserID) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

