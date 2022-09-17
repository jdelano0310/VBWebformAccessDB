<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="VBWebformApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h2>Webform Access DB Example</h2>
        <p class="lead">Jobs</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <p><asp:Label ID="Label1" runat="server" Text="Select Job"></asp:Label></p>
            <p><asp:DropDownList ID="drpJobs" runat="server" Width="150px" AutoPostBack="True"></asp:DropDownList></p>
        </div>
        <div class="col-md-4">
            <p><asp:Label ID="Label2" runat="server" Text="Start Date"></asp:Label></p>
            <p><asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox></p>
        </div>
        <div class="col-md-4">
            <p><asp:Label ID="Label3" runat="server" Text="End Date"></asp:Label></p>
            <p><asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox></p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" style="width: 100%; text-align: end">
            <asp:Label ID="Label4" runat="server" Text="Comments"></asp:Label>
            <asp:TextBox ID="txtcomments" runat="server" TextMode="MultiLine" Height="80px" Width="243px"></asp:TextBox>
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
