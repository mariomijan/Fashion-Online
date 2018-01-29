<%@ Page Title="ProductInsert" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Insert.aspx.cs" Inherits="Svendeproeve.Admin.Product.Insert" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView ID="fvUpload" runat="server"
            ItemType="Svendeproeve.Models.Product" DefaultMode="Insert"
            InsertItemPosition="FirstItem" InsertMethod="InsertItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <InsertItemTemplate>
                <fieldset class="form-horizontal">
				<legend>Insert Product</legend>
		        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
						    <asp:DynamicControl Mode="Insert" DataField="ProductName" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="Description" runat="server" />
							<asp:DynamicControl Mode="Insert" 
								DataField="RetailerID" 
								DataTypeName="Svendeproeve.Models.Retailer" 
								DataTextField="Name" 
								DataValueField="RetailerID" 
								UIHint="ForeignKey" runat="server" />
							<asp:DynamicControl Mode="Insert" 
								DataField="UserID" 
								DataTypeName="Svendeproeve.Models.Userlogin" 
								DataTextField="LoginName" 
								DataValueField="UserID" 
								UIHint="ForeignKey" runat="server" />
							<asp:DynamicControl Mode="Insert" 
								DataField="GenderID" 
								DataTypeName="Svendeproeve.Models.Gender" 
								DataTextField="GenderName" 
								DataValueField="GenderID" 
								UIHint="ForeignKey" runat="server" />
							<asp:DynamicControl Mode="Insert" 
								DataField="CollectionID" 
								DataTypeName="Svendeproeve.Models.Collection" 
								DataTextField="CollectionName" 
								DataValueField="CollectionID" 
								UIHint="ForeignKey" runat="server" />
                            <asp:FileUpload ID="FileUploader" CssClass="Uploads" runat="server" required="required" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button runat="server" ID="InsertButton" CommandName="Insert" Text="Insert" CssClass="btn btn-primary Insert-cancel-buttons" />
                        </div>
					</div>
                </fieldset>
            </InsertItemTemplate>
        </asp:FormView>
    </div>
    <link href="../Content/StyleSheet-back.css" rel="stylesheet" />

</asp:Content>
