<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Dashboard.Master" CodeBehind="Student.aspx.cs" Inherits="DatabaseCW.Student" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div>
        <%--<asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" CssClass="mb-2 container-fluid">
           
            <InsertItemTemplate>
                STUDENT_ID:
                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' CssClass="form-label" />
                <br />
                STUDENT_NAME:
                <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' CssClass="form-label"/>
                <br />
                CONTACT_NO:
                <asp:TextBox ID="CONTACT_NOTextBox" runat="server" Text='<%# Bind("CONTACT_NO") %>' CssClass="form-label"/>
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' CssClass="form-label"/>
                <br />
                EMAIL_ADDRESS:
                <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' CssClass="form-label"/>
                <br />
                COUNTRY:
                <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' CssClass="form-label"/>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary"/>
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-secondary" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary" />
            </ItemTemplate>
        </asp:FormView>--%>
         <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" CssClass="mb-2 container">
    <InsertItemTemplate>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="STUDENT_IDTextBox" class="form-label">STUDENT ID:</label>
                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' CssClass="form-control form-control-sm" />
            </div>
            <div class="col-md-6">
                <label for="STUDENT_NAMETextBox" class="form-label">STUDENT NAME:</label>
                <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' CssClass="form-control form-control-sm" />
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="CONTACT_NOTextBox" class="form-label">CONTACT NO:</label>
                <asp:TextBox ID="CONTACT_NOTextBox" runat="server" Text='<%# Bind("CONTACT_NO") %>' CssClass="form-control form-control-sm" />
            </div>
            <div class="col-md-6">
                <label for="EMAIL_ADDRESSTextBox" class="form-label">EMAIL ADDRESS:</label>
                <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' CssClass="form-control form-control-sm" />
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="COUNTRYTextBox" class="form-label">COUNTRY:</label>
                <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' CssClass="form-control form-control-sm" />
            </div>
        </div>
            <div class="col-md-6">
                <label for="DOBTextBox" class="form-label">DOB:</label>
                <asp:Calendar ID="DOB" runat="server" SelectedDate='<%# Bind("DOB") %>' ></asp:Calendar>
            </div>
            <div class="col-md-6 mt-2">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-primary" />
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-secondary" />
            </div>
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Student" CssClass="btn btn-primary" />
    </ItemTemplate>
</asp:FormView>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" CssClass="table table-md table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField ="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                <asp:BoundField DataField="CONTACT_NO" HeaderText="CONTACT_NO" SortExpression="CONTACT_NO" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL_ADDRESS" SortExpression="EMAIL_ADDRESS" />
                <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                <asp:CommandField ShowEditButton="True" HeaderText="UPDATE">
                    <ControlStyle CssClass="btn btn-success" />
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True" HeaderText="DELETE">
                    <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID"
            InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT_NO&quot;, &quot;DOB&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;COUNTRY&quot;) VALUES (:STUDENT_ID, :STUDENT_NAME, :CONTACT_NO, :DOB, :EMAIL_ADDRESS, :COUNTRY)"
            SelectCommand="SELECT * FROM &quot;STUDENT&quot;"
            UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;CONTACT_NO&quot; = :CONTACT_NO, &quot;DOB&quot; = :DOB, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT_NO" Type="Decimal" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT_NO" Type="Decimal" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

         </div>
    </asp:Content>









