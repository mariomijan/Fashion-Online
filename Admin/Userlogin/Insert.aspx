<%@ Page Title="UserloginInsert" Language="C#" MasterPageFile="~/Admin\Admin.Master" CodeBehind="Insert.aspx.cs" Inherits="Svendeproeve.Admin.Userlogin.Insert" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminContent">
    <div>
        <p>&nbsp;</p>
        <asp:FormView ID="fvUpload" runat="server"
            ItemType="Svendeproeve.Models.Userlogin" DefaultMode="Insert"
            InsertItemPosition="FirstItem" InsertMethod="InsertItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <InsertItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Create User</legend>
                    <table class="col-lg-4">
                        <tr>
                            <td>
                                <asp:Label Text="Name" CssClass="control-label col-lg-10" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtUserName" CssClass="form-control col-lg-10" runat="server" required="required" /><br /><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Username" CssClass="control-label col-lg-10" runat="server" />

                            </td>
                            <td>
                                <asp:TextBox ID="txtLoginName" CssClass="form-control col-lg-10" runat="server" required="required" /><br /><br />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Password" CssClass="control-label col-lg-10" runat="server" />

                            </td>
                            <td>
                                <asp:TextBox ID="txtLoginPass" CssClass="form-control col-lg-10" runat="server" required="required" /><br /><br />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Email" CssClass="control-label col-lg-10" runat="server" />

                            </td>
                            <td>
                                <asp:TextBox ID="txtUserEmail" CssClass="form-control col-lg-10" runat="server" required="required" /><br /><br />
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-6">
                                <asp:Button Text="Create User" CommandName="Insert" CssClass="btn btn-primary btnCreate" runat="server" />  
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="ltStatus" runat="server" />
                            </td>
                        </tr>
                    </table>
            </InsertItemTemplate>
        </asp:FormView>


    </div>
    <link href="../../User/Content/StyleSheet-back.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
