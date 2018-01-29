<%@ Page Title="" Language="C#" MasterPageFile="~/Layout-right-content.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Svendeproeve.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Head" runat="server">
    <link href="Content/css/Men-Women.css" rel="stylesheet" />
    <link href="Content/css/News.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Section" runat="server">
    <section>
        <h1>NEWS</h1>
        <br />
        <h6 class="News-subtitle">Check out our latest news in this section</h6>
        <br />
        <div id="News-underline">_______________________________________________________________________________________</div>
        <br />
        <br />


        <asp:ListView ID="lsNews" runat="server" OnPagePropertiesChanged="lsNews_PagePropertiesChanged">
            <ItemTemplate>
                <table class="col-lg-4">
                    <tr>
                        <td>
                            <asp:Image ImageUrl='<%# string.Format("~/UploadedImages/{0}", Eval("NewsImage")) %>' Height="145" Width="225" runat="server" /><br />

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%# Eval("NewsName") %><br />

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%# Eval("NewsDescription") %><br />

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%# Eval("DateCreated") %><br />

                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:ListView>

        <div class="col-lg-12 paging">
        <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="lsNews">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="<img src='/Content/images/left.gif'" ShowNextPageButton="false" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="Listview-nextpage-button" NextPageText="<img src='/Content/images/right.gif'" ShowNextPageButton="true"
                    ShowPreviousPageButton="false" />
            </Fields>
        </asp:DataPager></div>



    </section>
</asp:Content>
