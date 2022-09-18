<%@ Page Title="CRUD" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUD.aspx.vb" Inherits="VBWebformApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:Label class="lead" ID="lblJobCRUDMode" runat="server" Text="Jobs View"></asp:Label>
        <asp:Button ID="btnSave" runat="server" Text="Save" />
        <asp:Label ID="lblSaveResult" runat="server" Text=""></asp:Label>
    </div>

    <div class="row">
        <div class="col-md-2">
            <p><asp:Label ID="Label1" runat="server" Text="Job Name"></asp:Label></p>
             <p><asp:TextBox ID="txtJobName" runat="server"></asp:TextBox></p>
        </div>
        <div class="col-md-2">
            <p><asp:Label ID="Label2" runat="server" Text="Start Date"></asp:Label></p>
            <p><asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox></p>
        </div>
        <div class="col-md-2">
            <p><asp:Label ID="Label3" runat="server" Text="End Date"></asp:Label></p>
            <p><asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox></p>
        </div>
        <div class="col-md-6">
            <p><asp:Label ID="Label6" runat="server" Text="Comments"></asp:Label></p>
            <p><asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Height="80px" Width="350px"></asp:TextBox></p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="Label5" runat="server" Text="Job Items"></asp:Label>
            <asp:GridView ID="grdJobitems" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ItemName" HeaderText="Item" ReadOnly="True">
                    <HeaderStyle Font-Bold="True" />
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ItemDescription" HeaderText="Description" ReadOnly="True">
                    <HeaderStyle Font-Bold="True" />
                    <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DateAssigned" HeaderText="Date Assigned" ReadOnly="True">
                    <HeaderStyle Font-Bold="True" />
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
