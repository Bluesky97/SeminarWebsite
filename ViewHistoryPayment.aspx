<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewHistoryPayment.aspx.cs" Inherits="ViewHistoryPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 131px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="nav-justified">
        <tr>
            <td>
                <asp:GridView ID="gvSeminar" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" OnSelectedIndexChanged="gvSeminar_SelectedIndexChanged" AutoGenerateColumns="False" OnRowDeleting="gvSeminar_RowDeleting">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
                        <asp:BoundField DataField="Date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date" ReadOnly="True" />
                        <asp:BoundField DataField="OptionPay" HeaderText="Option to pay" ReadOnly="True" />
                        <asp:CommandField HeaderText="Review" ShowSelectButton="True" />
                        <asp:CommandField HeaderText="Cancellation" ShowDeleteButton="True" />
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
                    <table class="nav-justified">
                        <tr>
                            <td class="auto-style1"></td>
                            <td class="auto-style1">
                                <p />
                                <asp:Label ID="lblDetails" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Id</td>
                            <td>
                                <asp:TextBox ID="tbxId" runat="server" Width="240px"></asp:TextBox>
                                <p />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Name</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="tbxName" runat="server" Width="237px"></asp:TextBox><p />
                            </td>
                        </tr>


                        <tr>
                            <td class="auto-style2">Date</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="tbxDate" runat="server" Width="237px"></asp:TextBox><p />
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style2">Price</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="tbxPrice" runat="server" Width="239px"></asp:TextBox>
                                <p />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Rating 1-5</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="tbxRating" runat="server" Width="239px"></asp:TextBox>
                                <p />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Remarks</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="tbxRemarks" runat="server" Height="85px" TextMode="MultiLine" Width="237px"></asp:TextBox>
                                <p />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                <p />
                                <asp:Label ID="lblOutput" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <p />
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
        </tr>
    </table>
    </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

