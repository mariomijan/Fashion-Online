<%@ Page Title="UserloginEdit" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Edit.aspx.cs" Inherits="Svendeproeve.Admin.Userlogin.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="Svendeproeve.Models.Userlogin" DefaultMode="Edit" DataKeyNames="UserID"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Userlogin with UserID <%: Request.QueryString["UserID"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit Userlogin</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
							<asp:DynamicControl Mode="Edit" 
								DataField="RoleID" 
								DataTypeName="Svendeproeve.Models.Role" 
								DataTextField="Name" 
								DataValueField="RoleID" 
								UIHint="ForeignKey" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="LoginName" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Username" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Password" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Email" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Status" runat="server" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
							<asp:Button runat="server" ID="UpdateButton" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
							<asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </EditItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

