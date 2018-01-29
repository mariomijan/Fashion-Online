<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Svendeproeve.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Details.css" rel="stylesheet" />
    <link href="Content/css/Retailer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
    <section>
        <div class="Section-top">
            <img class="Section-top-bottom-banner" src="Content/images/detail.gif" />
            <asp:Label ID="lblTopProductName" CssClass="Top-product-name" runat="server" />

        </div>

        <table>
            <tr>
                <td>
                    <asp:Image ID="Image" runat="server" Width="425" Height="280" />
                </td>

                <td>
                    <h1>
                        <asp:Label ID="lblProductName" CssClass="Product-name-label" runat="server" /></h1> 
                </td>

                <td>
                    <asp:Label ID="lblDescription" CssClass="Description-label" runat="server" />
                </td>
            </tr>

        </table>

        <article>
            <div id="Description"><span>DESCRIPTION</span></div>
            <div id="Review"><span>REVIEWS(0)</span></div>

            <asp:Label ID="lblBottomDescription" CssClass="Bottom-description" runat="server" />

        </article>
    </section>
</asp:Content>


