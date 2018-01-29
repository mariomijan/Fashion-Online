<%@ Page Title="" Language="C#" MasterPageFile="~/Layout-right-content.Master" AutoEventWireup="true" CodeBehind="CollectionDetails.aspx.cs" Inherits="Svendeproeve.CollectionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Details.css" rel="stylesheet" />
    <link href="Content/css/Retailer.css" rel="stylesheet" />
    <link href="Content/css/Men-Women.css" rel="stylesheet" />
    <link href="Content/css/News.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
    <section>
         <h1>
             <asp:Label ID="lblInfo" runat="server" /></h1><br />
        <div>_______________________________________________________________________________________</div><br /><br />
        <div id="lsCollectionDetails">
        <asp:ListView ID="lsCollection" runat="server" OnPagePropertiesChanged="lsCollection_PagePropertiesChanged">
            <ItemTemplate>
                <table class="col-lg-4">
                    <tr>
                        <td>
                           <asp:ImageButton ImageUrl='<%# string.Format("~/UploadedImages/{0}", Eval("Image")) %>' Height="145" Width="225" runat="server" PostBackUrl='<%#"~/Details.aspx?Id="+Eval("ProductID")%>' />
                        </td>
                        </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProductName" Text='<%# Eval("ProductName") %>' runat="server" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                         <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" Text="More >" CssClass="Read-more" NavigateUrl='<%#"~/Details.aspx?Id="+Eval("ProductID")%>' /></div>
                            </td>
                        </tr>
                </table>
            </ItemTemplate>
        </asp:ListView>
            </div>

         <div class="col-lg-12 paging">
        <asp:DataPager ID="DataPager1" runat="server" PageSize="9" PagedControlID="lsCollection">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="<img src='/Content/images/left.gif'" ShowNextPageButton="false" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="Listview-nextpage-button" NextPageText="<img src='/Content/images/right.gif'" ShowNextPageButton="true"
                    ShowPreviousPageButton="false" />
            </Fields>
        </asp:DataPager></div>


    </section>
</asp:Content>
