<%@ Page Title="ProductEdit" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Edit.aspx.cs" Inherits="Svendeproeve.Admin.Product.Edit" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
        <p>&nbsp;</p>
        <asp:FormView ID="fvUpload" runat="server"
            ItemType="Svendeproeve.Models.Product" DefaultMode="Edit" DataKeyNames="ProductID"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Product with ProductID <%: Request.QueryString["ProductID"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit Product</legend>
                    <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                    <asp:DynamicControl Mode="Edit" DataField="ProductName" runat="server" />
                    <asp:DynamicControl Mode="Edit" DataField="Description" runat="server" />
                    <asp:DynamicControl Mode="Edit"
                        DataField="RetailerID"
                        DataTypeName="Svendeproeve.Models.Retailer"
                        DataTextField="Name"
                        DataValueField="RetailerID"
                        UIHint="ForeignKey" runat="server" />
                    <asp:DynamicControl Mode="Edit"
                        DataField="UserID"
                        DataTypeName="Svendeproeve.Models.Userlogin"
                        DataTextField="LoginName"
                        DataValueField="UserID"
                        UIHint="ForeignKey" runat="server" />
                    <asp:DynamicControl Mode="Edit"
                        DataField="GenderID"
                        DataTypeName="Svendeproeve.Models.Gender"
                        DataTextField="GenderName"
                        DataValueField="GenderID"
                        UIHint="ForeignKey" runat="server" />
                    <asp:DynamicControl Mode="Edit"
                        DataField="CollectionID"
                        DataTypeName="Svendeproeve.Models.Collection"
                        DataTextField="CollectionName"
                        DataValueField="CollectionID"
                        UIHint="ForeignKey" runat="server" />
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

