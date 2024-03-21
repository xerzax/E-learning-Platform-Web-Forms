<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Dashboard.Master" CodeBehind="StudentProgress.aspx.cs" Inherits="DatabaseCW.StudentProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        
       <%-- <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID,LESSON_ID" DataSourceID="SqlDataSource1">
           
            <InsertItemTemplate>
                STUDENT_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="STUDENTNAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    STUDENT_ID, 
    STUDENT_ID || ' ' || STUDENT_NAME AS STUDENTNAME 
FROM 
    STUDENT
"></asp:SqlDataSource>
                <br />
                LESSON_ID:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="LESSON" DataValueField="LESSON_ID" SelectedValue='<%# Bind("LESSON_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    LESSON_ID, 
    LESSON_ID || ' ' || LESSON_TITLE AS LESSON
FROM 
    LESSON
"></asp:SqlDataSource>
                <br />
                ACCESS_DATE:
                <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("ACCESS_DATE") %>'></asp:Calendar>
                <br />
                STATUS:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="STATUS" DataValueField="STATUS" SelectedValue='<%# Bind("STATUS") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT(STATUS) FROM STUDENT_PROGRESS"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary mb-2" />
            </ItemTemplate>
        </asp:FormView>--%>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID,LESSON_ID" DataSourceID="SqlDataSource1">
    <InsertItemTemplate>
        <div class="form-group">
            <label for="DropDownList1">STUDENT ID:</label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="STUDENTNAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>' CssClass="dropdown btn btn-outline-dark btn-sm dropdown-toggle m-2">
            </asp:DropDownList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
            STUDENT_ID, 
            STUDENT_ID || ' ' || STUDENT_NAME AS STUDENTNAME 
        FROM 
            STUDENT"></asp:SqlDataSource>
        <div class="form-group">
            <label for="DropDownList2">LESSON ID:</label>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="LESSON" DataValueField="LESSON_ID" SelectedValue='<%# Bind("LESSON_ID") %>' CssClass=" dropdown btn btn-outline-dark btn-sm dropdown-toggle m-2">
            </asp:DropDownList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
            LESSON_ID, 
            LESSON_ID || ' ' || LESSON_TITLE AS LESSON
        FROM 
            LESSON"></asp:SqlDataSource>
        <div class="form-group">
            <label for="Calendar1">ACCESS DATE:</label>
            <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("ACCESS_DATE") %>'></asp:Calendar>
        </div>
        <div class="form-group">
            <label for="DropDownList3">STATUS:</label>
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="STATUS" DataValueField="STATUS" SelectedValue='<%# Bind("STATUS") %>' CssClass="dropdown btn btn-outline-dark btn-sm dropdown-toggle m-2">
            </asp:DropDownList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT(STATUS) FROM STUDENT_PROGRESS"></asp:SqlDataSource>
        <div class="mb-2">
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-primary" />
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-secondary" />
            </div>
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Progress" CssClass="btn btn-primary mb-2" />
    </ItemTemplate>
</asp:FormView>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,LESSON_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="LESSON_ID" HeaderText="LESSON_ID" ReadOnly="True" SortExpression="LESSON_ID" />
                    <asp:BoundField DataField="ACCESS_DATE" HeaderText="ACCESS_DATE" SortExpression="ACCESS_DATE" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                    <asp:CommandField ShowEditButton="True" HeaderText="UPDATE">
                        <ControlStyle CssClass="btn btn-success" />
                    </asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="DELETE">
    <ControlStyle CssClass="btn btn-danger" />
</asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT_PROGRESS&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;LESSON_ID&quot; = :LESSON_ID" InsertCommand="INSERT INTO &quot;STUDENT_PROGRESS&quot; (&quot;STUDENT_ID&quot;, &quot;LESSON_ID&quot;, &quot;ACCESS_DATE&quot;, &quot;STATUS&quot;) VALUES (:STUDENT_ID, :LESSON_ID, :ACCESS_DATE, :STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT_PROGRESS&quot;" UpdateCommand="UPDATE &quot;STUDENT_PROGRESS&quot; SET &quot;ACCESS_DATE&quot; = :ACCESS_DATE, &quot;STATUS&quot; = :STATUS WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;LESSON_ID&quot; = :LESSON_ID">
                <DeleteParameters>
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="LESSON_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="LESSON_ID" Type="String" />
                    <asp:Parameter Name="ACCESS_DATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ACCESS_DATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="LESSON_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        
        </div>
    </asp:Content>