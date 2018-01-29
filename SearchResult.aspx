<%@ Page Title="" Language="C#" MasterPageFile="~/Layout-right-content.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="Svendeproeve.SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Men-Women.css" rel="stylesheet" />
    <link href="Content/css/SearchResult.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
    <section>
        <h1>SEARCH &nbsp RESULT</h1>
        <br />
        <div id="Search-underline">_______________________________________________________________________________________</div>
        <br />
        <br />



        <div id="Searchresult-repeater">
            <asp:ListView ID="lsSearchResults" runat="server" OnPagePropertiesChanged="lsSearchResults_PagePropertiesChanged">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:ImageButton runat="server" ImageUrl='<%# string.Format("~/UploadedImages/{0}", Eval("Image")) %>' Height="130" Width="170" PostBackUrl='<%#"~/Details.aspx?Id="+Eval("ProductID")%>' />
                                <td>&nbsp
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("ProductName") %>'
                            NavigateUrl='<%#"~/Details.aspx?Id="+Eval("ProductID")%>' /></td>
                                    &nbsp   
                      
                    <td>&nbsp
                        <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("Description").ToString().Substring(0, Math.Min(Eval("Description").ToString().Length, 100)) + "..." %>'
                            NavigateUrl='<%#"~/Details.aspx?Id="+Eval("ProductID")%>' /></td>
                                    <br />
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:ListView>

            <div class="col-lg-12 paging">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="lsSearchResults">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="<img src='/Content/images/left.gif'" ShowNextPageButton="false" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="Listview-nextpage-button" NextPageText="<img src='/Content/images/right.gif'" ShowNextPageButton="true"
                        ShowPreviousPageButton="false" />
                </Fields>
            </asp:DataPager>
        </div>
            </div>

        
    </section>
</asp:Content>
