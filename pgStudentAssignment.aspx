<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pgStudentAssignment.aspx.cs" Inherits="pgStudentAssignment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Social :Student Assignment</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />    
     <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   <style>td{padding:5px;}</style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="Scriptmanager1" runat="server"></asp:ScriptManager>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Student Home</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="pgStudHome.aspx">Student Home</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="pgStudLogin.aspx" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a class="active-menu"  href="pgStudHome.aspx"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                    <li>
                        <a  href="StudentProfile.aspx"><i class=""></i>Buddy Profile</a>
                    </li>
                    <li>
                        <a  href="pgStudAnnouncement.aspx"><i class=""></i>Announcement</a>
                    </li>
                  
							
                      <li  >
                        <a  href="pgStudDownload.aspx"><i class=""></i>Download</a>
                    </li>	
                      <li  >
                        <a  href="pgStudentProduct.aspx"><i class=""></i>Product</a>
                    </li>	
                      <li>
                        <a  href="pgStudentAssignment.aspx"><i class=""></i>Assignment</a>
                    </li>
                      
                    
                      
                 </ul>
               
            </div>
            
        </nav>  
        
         <!-- /. PAGE WRAPPER  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h5>Welcome Student </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
                        <h5>Student Assignment</h5>
                        <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" EmptyDataText="No Record Found" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                        <asp:BoundField DataField="ASubject" HeaderText="ASubject" 
                            SortExpression="ASubject" />
                        <asp:BoundField DataField="AssignmentName" HeaderText="AssignmentName" 
                            SortExpression="AssignmentName" />
                        <asp:BoundField DataField="AssignmentDate" HeaderText="AssignmentDate" 
                            SortExpression="AssignmentDate" />
                        <asp:BoundField DataField="SubmissionDate" HeaderText="SubmissionDate" 
                            SortExpression="SubmissionDate" />
                        <asp:BoundField DataField="AssignmentMarks" HeaderText="AssignmentMarks" 
                            SortExpression="AssignmentMarks" />
                        <asp:BoundField DataField="ADesc" HeaderText="ADesc" SortExpression="ADesc" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CollegeSocialConnectionString %>" 
                    SelectCommand="SELECT [Id], [ASubject], [AssignmentName], [AssignmentDate], [SubmissionDate], [AssignmentMarks], [ADesc] FROM [TeacherAssignment]">
                </asp:SqlDataSource>
                <!-- End Form Elements -->
                </div>
            </div>
               
                <!-- /. ROW  -->
    </div>
             <!-- /. PAGE INNER  -->
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
    </form>
    
   
</body>
</html>
