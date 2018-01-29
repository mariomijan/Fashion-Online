<%@ Page Title="" Language="C#" MasterPageFile="~/Layout-right-content.Master" AutoEventWireup="true" CodeBehind="Collections.aspx.cs" Inherits="Svendeproeve.Collections" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Men-Women.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
        <section>
        <h1>COLLECTIONS</h1><br />
        <h6 class="Men-subtitle">Check our all collections in this section</h6><br />
        <div id="Men-underline">_______________________________________________________________________________________</div><br /><br />
        
 
           <asp:Repeater ID="RpCollection" runat="server">
            <ItemTemplate>
                <table class="col-lg-4">
                    <tr>
                        <td>
                            <asp:ImageButton ImageUrl='<%# string.Format("~/UploadedImages/{0}", Eval("Image")) %>' Height="145" Width="225" runat="server" PostBackUrl='<%#"~/CollectionDetails.aspx?Id="+Eval("CollectionID")%>' />
                        </td>
                        <tr>
                            <td>
                                <%# Eval("CollectionName") %><br />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" Text="More >" CssClass="Read-more" NavigateUrl='<%#"~/CollectionDetails.aspx?Id="+Eval("CollectionID")%>' /></div>
                            </td>
                        </tr>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </section>
</asp:Content>

