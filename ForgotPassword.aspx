<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">

      <div class="form-signin">
        <h2 class="form-signin-heading">Please Enter Email</h2>
        <label for="inputEmail" class="sr-only">Email address</label>

        <asp:TextBox ID="tbxEmail" runat="server" type="email" class="form-control" placeholder="Email address" required autofocus />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxEmail" ErrorMessage="Email cannot be blank">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxEmail" ErrorMessage="Email is not valid" ValidationExpression="^\w+@\w+.\w{2,}$"></asp:RegularExpressionValidator>
          <asp:LinkButton ID="btnSend" runat="server" OnClick="btnSend_Click">Send Email</asp:LinkButton>
        <asp:Label ID="lblOutput" runat="server" Text="Label"></asp:Label>

      </div>

    </div>
</asp:Content>

