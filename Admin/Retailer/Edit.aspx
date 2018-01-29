<%@ Page Title="RetailerEdit" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Edit.aspx.cs" Inherits="Svendeproeve.Admin.Retailer.Edit" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
        <p>&nbsp;</p>
        <asp:FormView ID="fvUpload" runat="server"
            ItemType="Svendeproeve.Models.Retailer" DefaultMode="Edit" DataKeyNames="RetailerID"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Retailer with RetailerID <%: Request.QueryString["RetailerID"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit Retailer</legend>
                    <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                    <asp:DynamicControl Mode="Edit" DataField="Name" runat="server" />
                    <asp:DynamicControl Mode="Edit" DataField="Address" runat="server" />
                    <asp:DynamicControl Mode="Edit" DataField="Zipcode" runat="server" />
                    <asp:DynamicControl Mode="Edit" DataField="City" runat="server" />
                    <asp:DynamicControl Mode="Edit" DataField="Country" runat="server" />
                    <asp:DynamicControl Mode="Edit" DataField="Phone" runat="server" />
                    <asp:DynamicControl Mode="Edit" DataField="Logo" runat="server" />
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

