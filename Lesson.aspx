﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="Lesson.aspx.cs" Inherits="DatabaseCW.Lesson" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                <div class="row mb-1">
                    <div class="col-6">
                        LESSON_ID:
                <asp:TextBox ID="LESSON_IDTextBox" runat="server" Text='<%# Bind("LESSON_ID") %>' CssClass="form-control form-control-sm" />
                        <br />
                    </div>

                    <div class="col-6">
                        COURSE_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="dropdown btn btn-outline-secondary btn-sm dropdown-toggle m-2">
                </asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        <br />
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col-6">
                        LESSON_NO:
                <asp:TextBox ID="LESSON_NOTextBox" runat="server" Text='<%# Bind("LESSON_NO") %>' CssClass="form-control form-control-sm" />
                        <br />
                    </div>
                    <div class="col-6">
                        LESSON_TITLE:
                <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' CssClass="form-control form-control-sm" />
                        <br />
                    </div>
                </div>
                <div class="mb-2">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-primary" />
                    
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-secondary" />
            </div>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Lesson" CssClass="btn btn-primary mb-2" />
            </ItemTemplate>
        </asp:FormView>
        


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="LESSON_ID" HeaderText="LESSON_ID" ReadOnly="True" SortExpression="LESSON_ID" />
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" />
                <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" SortExpression="LESSON_NO" />
                <asp:BoundField DataField="LESSON_TITLE" HeaderText="LESSON_TITLE" SortExpression="LESSON_TITLE" />
                <asp:CommandField ShowEditButton="True" HeaderText="UPDATE">
                    <ControlStyle CssClass="btn btn-success" />
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True" HeaderText="DELETE">
                    <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON&quot; WHERE &quot;LESSON_ID&quot; = :LESSON_ID" InsertCommand="INSERT INTO &quot;LESSON&quot; (&quot;LESSON_ID&quot;, &quot;COURSE_ID&quot;, &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot;) VALUES (:LESSON_ID, :COURSE_ID, :LESSON_NO, :LESSON_TITLE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LESSON&quot;" UpdateCommand="UPDATE &quot;LESSON&quot; SET &quot;COURSE_ID&quot; = :COURSE_ID, &quot;LESSON_NO&quot; = :LESSON_NO, &quot;LESSON_TITLE&quot; = :LESSON_TITLE WHERE &quot;LESSON_ID&quot; = :LESSON_ID">
            <DeleteParameters>
                <asp:Parameter Name="LESSON_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LESSON_ID" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                <asp:Parameter Name="LESSON_TITLE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                <asp:Parameter Name="LESSON_TITLE" Type="String" />
                <asp:Parameter Name="LESSON_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    </div>
</asp:Content>
