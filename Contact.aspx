<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Svendeproeve.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
    <section>
        <div class="Section-top">
            <img src="Content/images/contact.gif" width="960" height="80" />
        </div>

        <article class="Contact-section-left">
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtName" CssClass="Contact-textboxes" Height="35" placeholder="NAME" runat="server" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtEmail" CssClass="Contact-textboxes" Height="35" placeholder="EMAIL" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea id="txtMessage" class="Contact-textboxes" placeholder="MESSAGE" runat="server"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSend" CssClass="Send-button" Text="SEND US THE MESSAGE" runat="server" OnClick="btnSend_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" CssClass="Contact-status-labels" runat="server" />                        
                        <asp:Label ID="lblFillout" CssClass="Contact-status-labels" runat="server" />

                    </td>
                </tr>
            </table>
        </article>

        <article class="Contact-section-right">
            <h1>FASHION &nbsp ONLINE</h1><p />
            <p>ADDRESS:&nbsp LINDHOLM &nbsp BRYGGE &nbsp 9<br />
                ZIPCODE:&nbsp 9400 &nbsp NORRESUNDBY<br />
                PHONE: &nbsp +4512345678
            </p>

            <img class="Map" src="Content/images/Maps.PNG" />
        </article>

        <div class="Bottom-section"><br />
            Lorem ipsum dolor sit amet, at sea reque saperet. Admodum denique an sed, 
            omittam posidonium at vim. Veri salutandi pro ea. Simul veniam id has, veniam senserit nec te,
            quot voluptaria id eos. Bonorum accumsan ad ius, pro ad velit libris qualisque. Sit an quidam audiam, 
            ut iracundia adolescens has, assum munere eu sea.<p /><p /> Usu ut quem ludus aliquando.

        </div>
    </section>
</asp:Content>


    