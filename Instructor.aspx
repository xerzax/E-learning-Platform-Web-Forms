<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="Instructor.aspx.cs" Inherits="DatabaseCW.Instructor" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1">

            <InsertItemTemplate>
                <div class="row">
                    <div class="col-6">
                        INSTRUCTOR_ID:
                <asp:TextBox ID="INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_ID") %>' CssClass="form-control form-control-sm" />
                    </div>
                    <br />
                    <div class="col-6">
                        INSTRUCTOR_NAME:
                <asp:TextBox ID="INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("INSTRUCTOR_NAME") %>' CssClass="form-control form-control-sm" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-6">
                        INSTRUCTOR_EMAIL:
                <asp:TextBox ID="INSTRUCTOR_EMAILTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_EMAIL") %>' CssClass="form-control form-control-sm" />
                    </div>
                    <br />
                    <div class="col-6">
                        CONTACT_NO:
                <asp:TextBox ID="CONTACT_NOTextBox" runat="server" Text='<%# Bind("CONTACT_NO") %>' CssClass="form-control form-control-sm" />
                    </div>
                    <br />

                    COURSE_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="dropdown btn btn-outline-secondary btn-sm dropdown-toggle m-2">
                </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    <br />
                    <div class="row">
                        <div class="col-1">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-primary btn-sm" />
                        </div>
                        <div class="col-1">
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-secondary mb-2 btn-sm" />
                        </div>
                    </div>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Instructor" CssClass="btn btn-primary mb-2" />
            </ItemTemplate>
        </asp:FormView>
        <%--  <asp:FormView ID="FormView1" runat="server" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="form-group">
                        <label for="INSTRUCTOR_IDTextBox">INSTRUCTOR ID:</label>
                        <asp:TextBox ID="INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_ID") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="INSTRUCTOR_NAMETextBox">INSTRUCTOR NAME:</label>
                        <asp:TextBox ID="INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("INSTRUCTOR_NAME") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="INSTRUCTOR_EMAILTextBox">INSTRUCTOR EMAIL:</label>
                        <asp:TextBox ID="INSTRUCTOR_EMAILTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_EMAIL") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="CONTACT_NOTextBox">CONTACT NO:</label>
                        <asp:TextBox ID="CONTACT_NOTextBox" runat="server" Text='<%# Bind("CONTACT_NO") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="DropDownList1">COURSE ID:</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary mb-2" />
                </ItemTemplate>
            </asp:FormView>--%>


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                <asp:BoundField DataField="INSTRUCTOR_EMAIL" HeaderText="INSTRUCTOR_EMAIL" SortExpression="INSTRUCTOR_EMAIL" />
                <asp:BoundField DataField="CONTACT_NO" HeaderText="CONTACT_NO" SortExpression="CONTACT_NO" />
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" />
                <asp:CommandField ShowEditButton="True" HeaderText="UPDATE">
                    <ControlStyle CssClass="btn btn-success" />
                    <ControlStyle CssClass="btn btn-success" />
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True" HeaderText="DELETE">
                    <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;INSTRUCTOR_EMAIL&quot;, &quot;CONTACT_NO&quot;, &quot;COURSE_ID&quot;) VALUES (:INSTRUCTOR_ID, :INSTRUCTOR_NAME, :INSTRUCTOR_EMAIL, :CONTACT_NO, :COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;INSTRUCTOR&quot;" UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;INSTRUCTOR_NAME&quot; = :INSTRUCTOR_NAME, &quot;INSTRUCTOR_EMAIL&quot; = :INSTRUCTOR_EMAIL, &quot;CONTACT_NO&quot; = :CONTACT_NO, &quot;COURSE_ID&quot; = :COURSE_ID WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID">
            <DeleteParameters>
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="INSTRUCTOR_EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT_NO" Type="Decimal" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="INSTRUCTOR_EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT_NO" Type="Decimal" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
