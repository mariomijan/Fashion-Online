﻿<%@ Page Title="NewsInsert" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Insert.aspx.cs" Inherits="Svendeproeve.Admin.News.Insert" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView ID="fvUpload" runat="server"
            ItemType="Svendeproeve.Models.News" DefaultMode="Insert"
            InsertItemPosition="FirstItem" InsertMethod="InsertItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <InsertItemTemplate>
                <fieldset class="form-horizontal">
				<legend>Insert News</legend>
		        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
						    <asp:DynamicControl Mode="Insert" DataField="NewsName" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="NewsDescription" runat="server" />
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
