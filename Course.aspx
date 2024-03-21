<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="DatabaseCW.Course" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
      
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" CssClass="mb-2 container-fluid">
    <InsertItemTemplate>
        <div class="mb-3">
            <label for="COURSE_IDTextBox" class="form-label">COURSE_ID:</label>
            <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' CssClass="form-control form-control-sm" />
        </div>
        <div class="mb-3">
            <label for="COURSE_TITLETextBox" class="form-label">COURSE_TITLE:</label>
            <asp:TextBox ID="COURSE_TITLETextBox" runat="server" Text='<%# Bind("COURSE_TITLE") %>' CssClass="form-control form-control-sm" />
        </div>
        <div class="mb-3">
            <label for="COURSE_DESCRIPTIONTextBox" class="form-label">COURSE_DESCRIPTION:</label>
            <asp:TextBox ID="COURSE_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("COURSE_DESCRIPTION") %>' CssClass="form-control form-control-sm" />
        </div>
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-primary" />
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-secondary" />
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Course" CssClass="btn btn-primary" />
    </ItemTemplate>
</asp:FormView>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" CssClass="container-fluid table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="COURSE_DESCRIPTION" HeaderText="COURSE_DESCRIPTION" SortExpression="COURSE_DESCRIPTION" />
                    <asp:CommandField ShowEditButton="True" HeaderText="UPDATE">
    <ControlStyle CssClass="btn btn-success" />
</asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="DELETE">
    <ControlStyle CssClass="btn btn-danger" />
</asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;, &quot;COURSE_DESCRIPTION&quot;) VALUES (:COURSE_ID, :COURSE_TITLE, :COURSE_DESCRIPTION)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;, &quot;COURSE_DESCRIPTION&quot; FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSE_TITLE&quot; = :COURSE_TITLE, &quot;COURSE_DESCRIPTION&quot; = :COURSE_DESCRIPTION WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                    <asp:Parameter Name="COURSE_TITLE" Type="String" />
                    <asp:Parameter Name="COURSE_DESCRIPTION" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COURSE_TITLE" Type="String" />
                    <asp:Parameter Name="COURSE_DESCRIPTION" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </div>
</asp:Content>
