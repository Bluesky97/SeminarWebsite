<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateProfile.aspx.cs" Inherits="UpdateProfile" %>

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
        <p class="help-block">&nbsp;</p>
      </div>
    </div>

    <div class="control-group">
      <!-- E-mail -->
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
        <asp:TextBox ID="tbxEmail" runat="server" type="text" name="email" placeholder="" class="input-xlarge"></asp:TextBox>
        <p class="help-block">&nbsp;</p>
      </div>
    </div>

    <div class="control-group">
      <!-- Phone Number -->
      <label class="control-label"  for="phonenumber">Phone Number</label>
      <div class="controls">
        <asp:TextBox ID="tbxPhone" runat="server" type="text" name="phonenumber" placeholder="" class="input-xlarge"></asp:TextBox>
        <p class="help-block">&nbsp;</p>
      </div>
    </div>

    <div class="control-group">
      <!-- Address -->
      <label class="control-label"  for="address">Address</label>
      <div class="controls">
        <asp:TextBox ID="tbxAddress" runat="server" type="text" name="address" placeholder="" class="input-xlarge"></asp:TextBox>
        <p class="help-block">&nbsp;</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password-->
      <label class="control-label" for="password">Password</label>
      <div class="controls">
        <asp:TextBox ID="tbxPw" runat="server" type="password" name="password" placeholder="" class="input-xlarge"></asp:TextBox>
        <p class="help-block">&nbsp;</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Password -->
      <label class="control-label"  for="password_confirm">Password (Confirm)</label>
      <div class="controls">
        <asp:TextBox ID="tbxCpw" runat="server" type="password" name="password_confirm" placeholder="" class="input-xlarge"></asp:TextBox>
        <p class="help-block">&nbsp;</p>
      </div>
    </div>
 
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <asp:Button ID="btnUpdate" runat="server" text="Update" class="btn btn-success" OnClick="btnUpdate_Click"></asp:Button>
          <asp:Label ID="lblOutput" runat="server"></asp:Label>
      </div>
    </div>
  </fieldset>
</form>
</asp:Content>
