<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="StudentProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Social : Student Home</title>
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
</head>
<body>
<form id="form1" runat="server">
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
               <h5>Buddy Profile</h5>
               <br /><br /><br />
               <table>
                <tr>
                    <td>Enter Hobiies</td>
                    <td><asp:TextBox ID="txtHobbies" runat="server"></asp:TextBox></td>
                </tr>
               </table>
               <br />
               <asp:Button ID="btnSubmit" runat="server" Text="Save Details" OnClick="btnSubmit_Click" />
                     <!-- End Form Elements -->
                     <br />
                     <asp:Label ID="Label1" runat="server" Text="Your Buddy is:" Font-Bold="true" ForeColor="Black"></asp:Label><br />
                     <asp:Label ID="lblName" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label><br />
                     <asp:Label ID="lblEmail" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label>
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
