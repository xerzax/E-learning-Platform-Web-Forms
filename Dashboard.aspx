<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DatabaseCW.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <h2>Welcome to E-Learn Verse</h2>
        <div class="row mt-4">
            <div class="col-lg-3 mb-4">
                <div class="card bg-primary text-white shadow">
                    <div class="card-body">

                        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource1" Height="50px" Width="125px" CssClass="border-0" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField DataField="TOTALSTUDENTS" HeaderText="STUDENTS" SortExpression="TOTALSTUDENTS" />
                            </Fields>
                        </asp:DetailsView>


                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TotalStudents
FROM student
"></asp:SqlDataSource>

                    </div>
                </div>
            </div>
            <div class="col-lg-3 mb-4">
                <div class="card bg-success text-white shadow">
                    <div class="card-body">
                        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Height="50px" Width="125px" CssClass="border-0">
                            <Fields>
                                <asp:BoundField DataField="TOTALCOURSE" HeaderText="COURSES" SortExpression="TOTALCOURSE" />
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TotalCourse
FROM course
"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 mb-4">
                <div class="card bg-warning text-black shadow">
                    <div class="card-body">
                        <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3" Height="50px" Width="125px" CssClass="border-0">
                            <Fields>
                                <asp:BoundField DataField="INSTRUCTORS" HeaderText="INSTRUCTORS" SortExpression="INSTRUCTORS" />
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Instructors
FROM instructor
"></asp:SqlDataSource>


                    </div>
                </div>
            </div>
            <div class="col-lg-3 mb-4">
                <div class="card text-white shadow bg-danger">
                    <div class="card-body">
                        <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource4" Height="50px" Width="125px" CssClass="border-0">
                            <Fields>
                                <asp:BoundField DataField="CONTENTS" HeaderText="CONTENTS" SortExpression="CONTENTS" />
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS Contents
FROM content
"></asp:SqlDataSource>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mb-4 d-flex">
        <div class="justify-content-center">
            <h2 class="text-center">Enrollments</h2>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource5" Height="396px" Width="850px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="COURSE_ID" YValueMembers="TOTALSTUDENTSENROLLED">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Students Enrolled" TitleAlignment="Center"></AxisY>
                        <AxisX Title="Courses" TitleAlignment="Center"></AxisX>
                        <AxisX Interval="1"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    course_id,
    COUNT(DISTINCT student_id) AS TotalStudentsEnrolled
FROM 
    enrollment
GROUP BY 
    course_id
"></asp:SqlDataSource>
    </div>
    <div class="justify-content-center">
        <h2 class="text-center">Instructors and QA Sessions Held</h2>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource6" Height="396px" Width="855px">
            <Series>
                <asp:Series Name="Series1" XValueMember="INSTRUCTOR_NAME" YValueMembers="TOTALQASESSIONS">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisX Interval="1"></AxisX>
                    <AxisX Title="Instructors" TitleAlignment="Center"></AxisX>
                    <AxisY Title="No. of QA Sessions" TitleAlignment="Center"></AxisY>
                    <AxisX Interval="1"></AxisX>
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </div>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT I.INSTRUCTOR_ID, I.INSTRUCTOR_NAME, COUNT(Q.QA_ID) AS TotalQASessions FROM QA Q, INSTRUCTOR I WHERE Q.INSTRUCTOR_ID = I.INSTRUCTOR_ID GROUP BY I.INSTRUCTOR_ID, I.INSTRUCTOR_NAME" OnSelecting="SqlDataSource6_Selecting"></asp:SqlDataSource>
    <br />
</asp:Content>
