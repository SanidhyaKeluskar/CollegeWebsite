<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pgDownloadEntry.aspx.cs" Inherits="pgDownloadEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Social : Download Entry</title>
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
   <style> td{padding:5px;} </style>
   
</head>
<body>
<form id="Form1" runat="server">
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Admin Home</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="pgAdminHome.aspx">Admin Home</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="pgAdminLogin.aspx" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a class="active-menu"  href="pgAdminHome.aspx"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a  href="pgApproveTeacher.aspx"><i class=""></i>Approve Teacher</a>
                    </li>
                     <li>
                        <a  href="pgApproveStud.aspx"><i class=""></i>Approve Student</a>
                    </li>
                     <li>
                        <a  href="pgApproveProduct.aspx"><i class=""></i>Approve Product</a>
                    </li>
                   
                   
                      <li  >
                        <a  href="pgDownloadEntry.aspx"><i class=""></i>Download</a>
                    </li>
                    
                    
                 </ul>
               
            </div>
            
        </nav>  
        
         <!-- /. PAGE WRAPPER  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h5>Welcome Admin, </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
                 <h3>Download Entry</h3>
                 <hr />
                    <table>
                       <tr>
                       <td>
                           <asp:TextBox ID="txtId" class="form-control" Visible="false" runat="server"></asp:TextBox>
                       </td>
                       </tr>

                       
                       <tr>
                       <td>File Name</td>
                       <td><asp:TextBox ID="txtFileName" class="form-control" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter File Name" Display="Dynamic" ControlToValidate="txtFileName"></asp:RequiredFieldValidator></td>
                       <td>File Type</td>
                       <td><asp:TextBox ID="txtFileType" class="form-control" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter File Type" Display="Dynamic" ControlToValidate="txtFileType"></asp:RequiredFieldValidator></td>
                       </tr>
                      
                       <tr>
                       <td>Select File</td>
                       <td><asp:FileUpload ID="File" runat="server" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select File" Display="Dynamic" ForeColor="Red" ControlToValidate="File"></asp:RequiredFieldValidator>
                       </td>
                       <td>Description</td>
                       <td><asp:TextBox ID="txtDesc" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox></td>
                       </tr>
                       
                       </table>
                       <br />
                <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary btn-sm" runat="server" Text="Save Data" />
                <br /><br />
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
               
                     <!-- End Form Elements -->
                </div>
            </div>
               
                <!-- /. ROW  -->
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
        </form>
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
    
   
</body>
</html>
