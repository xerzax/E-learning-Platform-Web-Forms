<%@ Page Title="Best Course Page" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="BestCourse.aspx.cs" Inherits="DatabaseCW.BestCourse" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" CssClass="dropdown btn btn-outline-dark mb-2">
                <asp:ListItem Value="1">Jan</asp:ListItem>
                <asp:ListItem Value="2">Feb</asp:ListItem>
                <asp:ListItem Value="3">Mar</asp:ListItem>
                <asp:ListItem Value="4">Apr</asp:ListItem>
                <asp:ListItem Value="5">May</asp:ListItem>
                <asp:ListItem Value="6">June</asp:ListItem>
                <asp:ListItem Value="7">July</asp:ListItem>
                <asp:ListItem Value="8">Aug</asp:ListItem>
                <asp:ListItem Value="9">Sept</asp:ListItem>
                <asp:ListItem Value="10">Oct</asp:ListItem>
                <asp:ListItem Value="11">Nov</asp:ListItem>
                <asp:ListItem Value="12">Dec</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT course_id, course_title, course_description, enroll_count FROM ( SELECT c.course_id, c.course_title, c.course_description, COUNT(e.student_id) AS enroll_count, ROW_NUMBER() OVER (ORDER BY COUNT(e.student_id) DESC) AS rn FROM course c JOIN enrollment e ON c.course_id = e.course_id WHERE EXTRACT(MONTH FROM e.enroll_date) = :month GROUP BY c.course_id, c.course_title, c.course_description ) WHERE rn &lt;= 3">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="month" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-sm table-striped table-bordered">
        </asp:GridView>
        </div>
</asp:Content>

