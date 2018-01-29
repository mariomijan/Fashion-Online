<%@ Page Title="" Language="C#" MasterPageFile="~/Layout-right-content.Master" AutoEventWireup="true" CodeBehind="Men.aspx.cs" Inherits="Svendeproeve.Men" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Men-Women.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
    <section>
        <h1>MEN &nbsp LATEST</h1><br />
        <h6 class="Men-subtitle">Check our latest men stuff in this section</h6><br />
        <div id="Men-underline">_______________________________________________________________________________________</div><br /><br />
        
 
           <asp:ListView ID="lsMen" runat="server">
            <ItemTemplate>
                <table class="col-lg-4">
                    <tr>
                        <td>
                            <asp:ImageButton ImageUrl='<%# string.Format("~/UploadedImages/{0}", Eval("Image")) %>' Height="145" Width="225" runat="server" PostBackUrl='<%#"~/Details.aspx?Id="+Eval("ProductID")%>' />
                        </td>
                        <tr>
                            <td>
                                <%# Eval("ProductName") %><br />

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
