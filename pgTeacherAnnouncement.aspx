<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pgTeacherAnnouncement.aspx.cs" Inherits="pgTeacherAnnouncement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Social : Announcement</title>
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
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Teacher Home</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="pgTeacherHome.aspx">Teacher Home</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="pgTeacherLogin.aspx" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a class="active-menu"  href="pgTeacherHome.aspx"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                    
						  
                      <li >
                        <a  href="pgTeacherDownload.aspx"><i class=""></i>Download</a>
                    </li>	
                      <li >
                        <a  href="pgTeacherAnnouncement.aspx"><i class=""></i>Announcement</a>
                    </li>	
                      <li >
                        <a  href="pgTeacherAssignment.aspx"><i class=""></i>Assignment</a>
                    </li>	
                      <li>
                        <a  href="pgTeacherViewSubmission.aspx"><i class=""></i>View Submission</a>
                    </li>	
                   
                    
                 </ul>
               
            </div>
            
        </nav>  
        
         <!-- /. PAGE WRAPPER  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h5>Welcome Teacher </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
                        <h5>Announcement </h5>
                        <br /><br /><br />

                        <table>
                        
                        <tr>
                        <td><asp:TextBox ID="txtId" Visible="false" runat="server"></asp:TextBox></td>
                        </tr>

                        <tr>
                        <td>Information</td>
                        <td><asp:TextBox ID="txtInfo" class="form-control" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Information" ForeColor="Red" Display="Dynamic" ControlToValidate="txtInfo"></asp:RequiredFieldValidator></td>
                        </tr>

                        <tr>
                        <td>Date</td>
                        <td><asp:TextBox ID="txtDate" class="form-control" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Date" ForeColor="Red" Display="Dynamic" ControlToValidate="txtDate"></asp:RequiredFieldValidator></td>
                        </tr>
                        
                        <tr>
                        <td>Status</td>
                        <td><asp:DropDownList ID="cmbStatus" class="form-control" runat="server">
                        <asp:ListItem>--Select Status--</asp:ListItem>
                        <asp:ListItem>ON</asp:ListItem>
                        <asp:ListItem>OFF</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select Status" ForeColor="Red" Display="Dynamic" ControlToValidate="cmbStatus" InitialValue="--Select Status--"></asp:RequiredFieldValidator></td>
                        </tr>
                        
                        <tr>
                        <td>Subject Name</td>
                        <td>
                            <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="Enter Subject Name" ForeColor="Red" ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        
                        </table>
                <asp:Button ID="btnSave" class="btn btn-primary btn-sm" OnClick="btnSave_Click" runat="server" Text="Save Data" />
                <br /><br />
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                <br /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource2" EmptyDataText="No Record Found" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                        <asp:BoundField DataField="info" HeaderText="info" SortExpression="info" />
                        <asp:BoundField DataField="AStatus" HeaderText="AStatus" 
                            SortExpression="AStatus" />
                        <asp:BoundField DataField="ADate" HeaderText="ADate" SortExpression="ADate" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" 
                            SortExpression="Subject" />
                    </Columns>
                </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CollegeSocialConnectionString %>" 
                    
                    SelectCommand="SELECT [Id], [info], [AStatus], [ADate], [Subject] FROM [TeacherAnnouncement]">
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
