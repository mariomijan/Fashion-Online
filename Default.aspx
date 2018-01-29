<%@ Page Title="" Language="C#" MasterPageFile="~/Layout-right-content.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Svendeproeve.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
    <section>
        <a href="Collections.aspx"><img class="top-image" src="Content/images/top.gif" /></a>
        <h1>LATEST &nbsp ARRIVALS</h1>
        <h6>Check our all latest products in this section</h6><br />
        <div id="latest-underline">_______________________________________________________________________________________</div><br /><br />
        
        <div id="latest-repeater">
         <asp:Repeater ID="RpLatest" runat="server">
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
        </asp:Repeater></div>
    </section>
</asp:Content>
