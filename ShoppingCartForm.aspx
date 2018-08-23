<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCartForm.aspx.cs" Inherits="ShoppingCartForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 131px;
        }

        .auto-style2 {
            width: 131px;
            height: 20px;
        }

        .auto-style3 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="nav-justified">
        <tr>
            <td>
                <%--      <asp:GridView ID="gvSeminar" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-nonfluid .table-striped .table-condensed table-responsive" OnRowDeleting="gvSeminar_RowDeleting" OnSelectedIndexChanged="gvSeminar_SelectedIndexChanged" AutoGenerateColumns="False" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
                    <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="True" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" ReadOnly="True" />
                    <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" />
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
            </asp:GridView>--%>

                <table class="nav-justified">
                    <tr>
                        <td class="auto-style1">ID</td>
                        <td>
                            <asp:TextBox ID="tbxId" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Category Name</td>
                        <td>
                            <asp:TextBox ID="tbxCategoryName" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Title</td>
                        <td>
                            <asp:TextBox ID="tbxTitle" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Speaker Name</td>
                        <td>
                            <asp:TextBox ID="tbxSpeakerName" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Description</td>
                        <td>
                            <asp:TextBox ID="tbxDesc" runat="server" Height="99px" ReadOnly="True" Width="277px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Duration</td>
                        <td>
                            <asp:TextBox ID="tbxDuration" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
        </tr>
        <tr>
            <td class="auto-style1">Date</td>
            <td>
                <asp:TextBox ID="tbxDate" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1"></td>
            <td>
                <asp:Button ID="btnAccept" runat="server" Text="Accept" OnClick="btnAccept_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>
                <asp:Label ID="lblOutput0" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Panel ID="Panel1" Visible="false" runat="server">
                <table class="nav-justified">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Total Amount</td>
                        <td class="auto-style3">
                            <asp:Label ID="lblAmount" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Discount</td>
                        <td>
                            <asp:Label ID="lblDiscount" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Date of purchase</td>
                        <td>
                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1">Option to Pay</td>
                        <td>
                            <asp:RadioButton ID="rdbCash" runat="server" Text="Cash" AutoPostBack="True" GroupName="PaymentMethod" OnCheckedChanged="rdbCash_CheckedChanged" />
                            <asp:RadioButton ID="rdbCC" runat="server" Text="Credit Card" AutoPostBack="True" GroupName="PaymentMethod" OnCheckedChanged="rdbCC_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Name</td>
                        <td>
                            <asp:TextBox ID="tbxName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name cannot be blank" ControlToValidate="tbxName">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Credit Card No</td>
                        <td>
                            <asp:TextBox ID="tbxCC" runat="server" type="number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Credit card no cannot be blank" ControlToValidate="tbxCC">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Credit Card Type</td>
                        <td>
                            <asp:DropDownList ID="ddlCCType" runat="server" Height="45px" Width="128px">
                                <asp:ListItem Text="Visa" />
                                <asp:ListItem Text="Master Card" />
                                <asp:ListItem Text="American Express" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCCType" ErrorMessage="Credit card type must be selected">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Security Code</td>
                        <td>
                            <asp:TextBox ID="tbxCode" runat="server" type="number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Security code cannot be blank" ControlToValidate="tbxCode">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Expiry Date</td>
                        <td>
                            <asp:TextBox ID="tbxExpDate" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Expiry date cannot be blank" ControlToValidate="tbxExpDate">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
                            <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" CausesValidation="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
                            <asp:Label ID="lblOutput" runat="server"></asp:Label>
                        </td>
                    </tr>

                </table>
            </asp:Panel>


        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    </table>
</asp:Content>

