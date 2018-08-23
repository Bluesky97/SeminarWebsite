<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListSeminar.aspx.cs" Inherits="ListSeminar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="nav-justified">
        <tr>
            <td>
                <asp:TextBox ID="tbxSearch" runat="server" Width="240px"></asp:TextBox>
                <asp:DropDownList ID="ddlSearch" runat="server" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Category" />
                    <asp:ListItem Text="Title" />
                    <asp:ListItem Text="Speaker" />

                </asp:DropDownList>

                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvSeminar" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvSeminars_PageIndexChanging" OnSelectedIndexChanged="gvSeminar_SelectedIndexChanged" PageSize="4">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
                        <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="True" />
                        <asp:BoundField DataField="Duration" HeaderText="Duration" ReadOnly="True" />
                        <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" ReadOnly="True" />
                        <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <asp:GridView ID="gvSchedule" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" OnSelectedIndexChanged="gvSchedule_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                            <asp:BoundField DataField="Speaker.Name" HeaderText="Speaker" ReadOnly="True" />
                            <asp:BoundField DataField="Capacity" HeaderText="Capacity" ReadOnly="True" />
                            <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>

                <table class="nav-justified">
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
                            <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />
                        </td>
                    </tr>
        </tr>
    </table>
    </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

