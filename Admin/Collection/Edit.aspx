<%@ Page Title="CollectionEdit" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Edit.aspx.cs" Inherits="Svendeproeve.Admin.Collection.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView ID="fvUpload" runat="server"
            ItemType="Svendeproeve.Models.Collection" DefaultMode="Edit" DataKeyNames="CollectionID"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Collection with CollectionID <%: Request.QueryString["CollectionID"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit Collection</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
						    <asp:DynamicControl Mode="Edit" DataField="CollectionName" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Image" runat="server" />
                            <asp:FileUpload ID="FileUploader" CssClass="Uploads" runat="server" required="required" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
							<asp:Button runat="server" ID="UpdateButton" CommandName="Update" Text="Update" CssClass="btn btn-primary Insert-cancel-buttons" />
						</div>
					</div>
                </fieldset>
            </EditItemTemplate>
        </asp:FormView>
    </div>
        <link href="../Content/StyleSheet-back.css" rel="stylesheet" />
</asp:Content>

