<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminView.aspx.cs" Inherits="AdminView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 579px;
        }
        .auto-style2 {
            width: 135px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <tr>
        <td>
            <asp:GridView ID="gvMember" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" OnSelectedIndexChanged="gvMember_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" />
                    <asp:BoundField DataField="Password" HeaderText="Password" ReadOnly="True" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="Phone" ReadOnly="True" />
                    <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" />
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
                <asp:GridView ID="gvShoppingCart" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" AutoGenerateColumns="False" OnSelectedIndexChanged="gvShoppingCart_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
                        <asp:BoundField DataField="OptionPay" HeaderText="Option Pay" ReadOnly="True" />
                        <asp:BoundField DataField="CreditCard" HeaderText="Credit Card No" ReadOnly="True" />
                        <asp:BoundField DataField="CreditCardType" HeaderText="Credit Card Type" ReadOnly="True" />
                        <asp:BoundField DataField="SecurityCode" HeaderText="Security Code" ReadOnly="True" />
                        <asp:BoundField DataField="CCExpiryDate" HeaderText="CC Expiry Date" ReadOnly="True" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" ReadOnly="True" DataFormatString="{0:c}" />
                        <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" />
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
    <table class="nav-justified">
                        <tr>
                            <td class="auto-style2">Id</td>
                            <td class="auto-style1">
                                <p />
                                <asp:Label ID="lblSeminarId" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
        <tr>
                            <td class="auto-style2">Seminar Name</td>
                            <td class="auto-style1">
                                <p />
                                <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                <tr>
                            <td class="auto-style2">Date</td>
                            <td class="auto-style1">
                                <p />
                                <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
    </asp:Panel>
</asp:Content>

