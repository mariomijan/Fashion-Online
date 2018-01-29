﻿<%@ Page Title="GenderInsert" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Insert.aspx.cs" Inherits="Svendeproeve.Admin.Gender.Insert" %>
<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="Svendeproeve.Models.Gender" DefaultMode="Insert"
            InsertItemPosition="FirstItem" InsertMethod="InsertItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <InsertItemTemplate>
                <fieldset class="form-horizontal">
				<legend>Insert Gender</legend>
		        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
						    <asp:DynamicControl Mode="Insert" DataField="GenderName" runat="server" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button runat="server" ID="InsertButton" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
                        </div>
					</div>
                </fieldset>
            </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>