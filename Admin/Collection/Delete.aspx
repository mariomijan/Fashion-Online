<%@ Page Title="CollectionDelete" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Delete.aspx.cs" Inherits="Svendeproeve.Admin.Collection.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this Collection?</h3>
        <asp:FormView runat="server"
            ItemType="Svendeproeve.Models.Collection" DataKeyNames="CollectionID"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Collection with CollectionID <%: Request.QueryString["CollectionID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete Collection</legend>
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
							<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

