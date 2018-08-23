<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegistrationForm.aspx.cs" Inherits="RegistrationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form class="form-horizontal" action='' method="POST">
  <fieldset>
    <div id="legend">
      </div>
      <legend class="">Register</legend>
    </div>

    <div class="control-group">
      <!-- Name -->
      <label class="control-label"  for="name">Name</label>
      <div class="controls">
        <asp:TextBox ID="tbxName" runat="server" type="text" name="name" placeholder="" class="input-xlarge"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxName" ErrorMessage="Name cannot be blank">*</asp:RequiredFieldValidator>
        <p class="help-block">Please provide your Name</p>
      </div>
    </div>

    <div class="control-group">
      <!-- E-mail -->
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
        <asp:TextBox ID="tbxEmail" runat="server" type="text" name="email" placeholder="" class="input-xlarge"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxEmail" ErrorMessage="Email cannot be blank">*</asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxEmail" ErrorMessage="Email is not valid" ValidationExpression="^\w+@\w+.\w{2,}$"></asp:RegularExpressionValidator>
        <p class="help-block">Please provide your E-mail</p>
      </div>
    </div>

    <div class="control-group">
      <!-- Phone Number -->
      <label class="control-label"  for="phonenumber">Phone Number</label>
      <div class="controls">
        <asp:TextBox ID="tbxPhone" runat="server" type="text" name="phonenumber" placeholder="" class="input-xlarge"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxPhone" ErrorMessage="Phone no cannot be blank">*</asp:RequiredFieldValidator>
        <p class="help-block">Please provide your Phone Number</p>
      </div>
    </div>

    <div class="control-group">
      <!-- Address -->
      <label class="control-label"  for="address">Address</label>
      <div class="controls">
        <asp:TextBox ID="tbxAddress" runat="server" type="text" name="address" placeholder="" class="input-xlarge"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbxAddress" ErrorMessage="Address cannot be blank">*</asp:RequiredFieldValidator>
        <p class="help-block">Please provide your Address</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password-->
      <label class="control-label" for="password">Password</label>
      <div class="controls">
        <asp:TextBox ID="tbxPw" runat="server" type="password" name="password" placeholder="" class="input-xlarge"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbxPw" ErrorMessage="Password cannot be blank">*</asp:RequiredFieldValidator>
        <p class="help-block">Password should be at least 4 characters</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password -->
      <label class="control-label"  for="password_confirm">Password (Confirm)</label>
      <div class="controls">
        <asp:TextBox ID="tbxCpw" runat="server" type="password" name="password_confirm" placeholder="" class="input-xlarge"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbxCpw" ErrorMessage="Confirm password cannot be blank">*</asp:RequiredFieldValidator>
          <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbxPw" ControlToValidate="tbxCpw" ErrorMessage="Password must be same"></asp:CompareValidator>
        <p class="help-block">Please confirm password</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <asp:Button ID="btnRegister" runat="server" text="Register" class="btn btn-success" OnClick="btnRegister_Click"></asp:Button>
          <asp:Label ID="lblOutput" runat="server"></asp:Label>
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
      </div>
    </div>
  </fieldset>
</form>
</asp:Content>

