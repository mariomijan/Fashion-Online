<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Retailer.aspx.cs" Inherits="Svendeproeve.Retailer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Retailer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
    <section>
        <div class="Section-top">
            <img class="Section-top-bottom-banner" src="Content/images/ret.gif" />
            <h1 class="Top-product-name">RETAILER NAME</h1>

            <article class="Retailer-section-left">
                <asp:Repeater ID="RpRetailer" runat="server">
                    <ItemTemplate>
                        <asp:Image ImageUrl='<%# string.Format("~/UploadedImages/{0}", Eval("Logo")) %>' Height="354" Width="400" runat="server" /><br />

                        <article class="Retailer-section-right">
                            <asp:Label ID="lblRetailerName" CssClass="Retailer-heading" Text='<%#Eval ("Name") %>' runat="server" /><br /><br />
                            <asp:Label Text="ADDRESS:" CssClass="Address-labels" runat="server" /> &nbsp <asp:Label ID="lblAddress" CssClass="Retailer-information" Text='<%#Eval ("Address") %>' runat="server" /><br />
                            <asp:Label Text="ZIPCODE:" CssClass="Address-labels" runat="server" /> &nbsp<asp:Label ID="lblZipCode" CssClass="Retailer-information" Text='<%#Eval ("Zipcode") %>' runat="server" />
                            <asp:Label ID="lblCity" CssClass="Retailer-information" Text='<%#Eval ("City") %>' runat="server" /><br />
                            <asp:Label Text="COUNTRY:" CssClass="Address-labels" runat="server" /> &nbsp <asp:Label Text='<%#Eval ("Country") %>' CssClass="Retailer-information" runat="server" /><br />
                            <asp:Label Text="PHONE:" CssClass="Address-labels" runat="server" /> &nbsp <asp:Label ID="lblPhone" CssClass="Retailer-information" Text='<%#Eval ("Phone") %>' runat="server" />
                            <img class="Map" src="Content/images/Maps.PNG" />
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </article>


            <div class="Bottom-section">
                <br />
                Lorem ipsum dolor sit amet, at sea reque saperet. Admodum denique an sed, 
            omittam posidonium at vim. Veri salutandi pro ea. Simul veniam id has, veniam senserit nec te,
            quot voluptaria id eos. Bonorum accumsan ad ius, pro ad velit libris qualisque. Sit an quidam audiam, 
            ut iracundia adolescens has, assum munere eu sea.<p />
                <p />
                Usu ut quem ludus aliquando.

            </div>
        </div>
    </section>
</asp:Content>
