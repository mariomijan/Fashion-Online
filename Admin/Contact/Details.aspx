<%@ Page Title="Contact Details" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Details.aspx.cs" Inherits="Svendeproeve.Admin.Contact.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="Svendeproeve.Models.Contact" DataKeyNames="ContactID"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Contact with ContactID <%: Request.QueryString["ContactID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Contact Details</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ContactID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ContactID" ID="ContactID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Name</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Name" ID="Name" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Email</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Email" ID="Email" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Message</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Message" ID="Message" Mode="ReadOnly" />
								</div>
							</div>
                 	<div class="row">
					  &nbsp;
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Back" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

