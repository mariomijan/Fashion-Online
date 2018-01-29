<%@ Page Title="Role Details" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Details.aspx.cs" Inherits="Svendeproeve.Admin.Role.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="Svendeproeve.Models.Role" DataKeyNames="RoleID"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Role with RoleID <%: Request.QueryString["RoleID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Role Details</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>RoleID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="RoleID" ID="RoleID" Mode="ReadOnly" />
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

