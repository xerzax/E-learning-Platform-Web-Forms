<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="StudentEnrollment.aspx.cs" Inherits="DatabaseCW.StudentEnrollment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div>
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    s.student_id,
    s.student_name,
    s.contact_no,
    s.dob,
    s.email_address,
    s.country,
    c.course_id,
    c.course_title,
    c.course_description,
    e.enroll_date
FROM 
    student s
JOIN 
    enrollment e ON s.student_id = e.student_id
JOIN 
    course c ON e.course_id = c.course_id WHERE s.student_id = :student">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="student" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="STUDENT_ID||'-'||&quot;STUDENT_NAME&quot;" DataValueField="STUDENT_ID" CssClass="dropdown btn btn-outline-dark dropdown-toggle m-2">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, student_id ||'-'|| &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource1" CssClass=" table table-sm table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                    <asp:BoundField DataField="CONTACT_NO" HeaderText="CONTACT_NO" SortExpression="CONTACT_NO" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL_ADDRESS" SortExpression="EMAIL_ADDRESS" />
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="COURSE_DESCRIPTION" HeaderText="COURSE_DESCRIPTION" SortExpression="COURSE_DESCRIPTION" />
                    <asp:BoundField DataField="ENROLL_DATE" HeaderText="ENROLL_DATE" SortExpression="ENROLL_DATE" />
                </Columns>
            </asp:GridView>
            </div>
        </div>
  </asp:Content>