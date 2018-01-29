<%@ Page Title="" Language="C#" MasterPageFile="~/Layout-right-content.Master" AutoEventWireup="true" CodeBehind="Women.aspx.cs" Inherits="Svendeproeve.Women" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Men-Women.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
     <section>
        <h1>WOMEN &nbsp LATEST</h1><br />
        <h6 class="Women-subtitle">Check our latest women stuff in this section</h6><br />
        <div id="Women-underline">_______________________________________________________________________________________</div><br /><br />


           <asp:ListView ID="lsWomen" runat="server">
            <ItemTemplate>
                <table class="col-lg-4">
                    <tr>
                        <td>
                            <asp:ImageButton CssClass="Images" ImageUrl='<%# string.Format("~/UploadedImages/{0}", Eval("Image")) %>' Height="145" Width="225" runat="server" PostBackUrl='<%#"~/Details.aspx?Id="+Eval("ProductID")%>' />
                        </td>
                        <tr>
                            <td>
                                <asp:Label ID="lblProductName" Text='<%# Eval("ProductName") %>' runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" Text="More >" CssClass="Read-more" NavigateUrl='<%#"~/Details.aspx?Id="+Eval("ProductID")%>' /></div>
                            </td>
                        </tr>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:ListView>
    </section>
</asp:Content>


