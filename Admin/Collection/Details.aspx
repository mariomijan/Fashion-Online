<%@ Page Title="Collection Details" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Details.aspx.cs" Inherits="Svendeproeve.Admin.Collection.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="Svendeproeve.Models.Collection" DataKeyNames="CollectionID"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Collection with CollectionID <%: Request.QueryString["CollectionID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Collection Details</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>CollectionID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="CollectionID" ID="CollectionID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>CollectionName</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="CollectionName" ID="CollectionName" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Image</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Image" ID="Image" Mode="ReadOnly" />
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

