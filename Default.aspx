<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <div class="row row-offcanvas row-offcanvas-right">

            <div class="col-xs-12 col-sm-9">
                <p class="pull-right visible-xs">
                    <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
                </p>
                <div class="jumbotron">
                    <h1>Hello everyone!</h1>
                    <p>Now you can explore on what we have launch of activities in PSB Academy, Singapore</p>
                </div>

                <asp:TextBox ID="tbxSearch" runat="server"></asp:TextBox>
                <asp:DropDownList ID="ddlSearch" runat="server" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Category" />
                    <asp:ListItem Text="Title" />
                    <asp:ListItem Text="Speaker" />

                </asp:DropDownList>

                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Button" />


                    <table class="nav-justified">
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataList ID="dlSeminar" runat="server" CellPadding="4" ForeColor="#333333" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="table table-nonfluid  .table-striped  .table-condensed table-responsive" OnSelectedIndexChanged="dlSeminar_SelectedIndexChanged">
                                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <ItemTemplate>
                                        <table class="nav-justified">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# "../images/"+Eval("ImageFile") %>' Width="100px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# String.Format("{0:c}",Eval("Price") ) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="btnDetails" runat="server" CommandName="Select" OnClick="btnDetails_Click">Select</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                </asp:DataList>
                            </td>

                        </tr>

                    </table>

                    <footer>
                        <p>&copy; 2017 PSB Academy, Inc.</p>
                    </footer>
</asp:Content>

