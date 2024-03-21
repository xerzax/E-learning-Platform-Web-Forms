<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="CourseInstructor.aspx.cs" Inherits="DatabaseCW.CourseInstructor" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;INSTRUCTOR_EMAIL&quot;, &quot;CONTACT_NO&quot;, &quot;COURSE_ID&quot;) VALUES (:INSTRUCTOR_ID, :INSTRUCTOR_NAME, :INSTRUCTOR_EMAIL, :CONTACT_NO, :COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    c.course_id,
    c.course_title,
    c.course_description,
    i.instructor_id,
    i.instructor_name,
    i.instructor_email,
    i.contact_no
FROM 
    course c
JOIN 
    instructor i ON c.course_id = i.course_id
WHERE i.course_id = :course_id
  "
            UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;INSTRUCTOR_NAME&quot; = :INSTRUCTOR_NAME, &quot;INSTRUCTOR_EMAIL&quot; = :INSTRUCTOR_EMAIL, &quot;CONTACT_NO&quot; = :CONTACT_NO, &quot;COURSE_ID&quot; = :COURSE_ID WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID">
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
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="course_id" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="INSTRUCTOR_EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT_NO" Type="Decimal" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" AutoPostBack="True" CssClass="dropdown btn btn-outline-dark btn-sm mb-2">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,INSTRUCTOR_ID" DataSourceID="SqlDataSource1" CssClass="table table-sm table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                <asp:BoundField DataField="COURSE_DESCRIPTION" HeaderText="COURSE_DESCRIPTION" SortExpression="COURSE_DESCRIPTION" />
                <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" SortExpression="INSTRUCTOR_ID" ReadOnly="True" />
                <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                <asp:BoundField DataField="INSTRUCTOR_EMAIL" HeaderText="INSTRUCTOR_EMAIL" SortExpression="INSTRUCTOR_EMAIL" />
                <asp:BoundField DataField="CONTACT_NO" HeaderText="CONTACT_NO" SortExpression="CONTACT_NO" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>

    </div>
</asp:Content>
