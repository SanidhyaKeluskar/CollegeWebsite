<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pgTeacherReg.aspx.cs" Inherits="pgTeacherReg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Social : Teacher Registration</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<style>
td{padding:5px;}
</style>
</head>
<body>
<form id="Form1" runat="server">
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="pgTeacherReg.aspx">Registration</a> 
            </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
                      <li>
                        <a  href="pgTeacherReg.aspx"><i class=""></i> Teacher Registration</a>
                    </li>
                    <li>
                        <a  href="pgStudReg.aspx"><i class=""></i> Student Registration</a>
                    </li>
				
                    <li>
                        <a  href="pgStudLogin.aspx"><i class=""></i> Login Page</a>
                    </li>
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h5>Welcome Teacher, </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Teacher Registration
                        </div>
                        <div class="panel-body">
                        <table>
                       
                            <asp:TextBox ID="txtId" Visible="false" class="form-control" runat="server"></asp:TextBox>
                            
                            <tr>
                            <td>Name : </td>
                            <td><asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  ForeColor="Red" runat="server" ErrorMessage="Invalid Details" Display="Dynamic" ControlToValidate="txtName" ValidationExpression="^[a-zA-Z\S]*$"></asp:RegularExpressionValidator>
                             </td>
                            <td>Address : </td>
                            <td><asp:TextBox ID="txtAddress" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Address " ControlToValidate="txtAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            </tr>

                            <tr>
                            <td>Mobile No. : </td>
                            <td><asp:TextBox ID="txtMobile" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Contact No." ControlToValidate="txtMobile" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" runat="server" ErrorMessage="Invalid Number" Display="Dynamic" ControlToValidate="txtMobile" ValidationExpression="\d{10}"></asp:RegularExpressionValidator> 
                             </td>
                            <td>Email-ID : </td>
                            <td><asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            </tr>

                            <tr>
                            <td>Password : </td>
                            <td><asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            <td>Re-Password : </td>
                            <td><asp:TextBox ID="txtRPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Re-Password" ControlToValidate="txtRPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Missmatch" Display="Dynamic" ForeColor="Red" ControlToValidate="txtRPassword" ControlToCompare="txtPassword"></asp:CompareValidator> 
                            </td>
                            </tr>       

                            <tr>
                            <td>Department : </td>
                            <td><asp:TextBox ID="txtDepartment" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Department" ControlToValidate="txtDepartment" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            <td>Designation : </td>
                            <td><asp:TextBox ID="txtDesignation" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter Designation" ControlToValidate="txtDesignation" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            </tr>

                            <tr>
                            <td>Password Hint : </td>
                            <td><asp:TextBox ID="txtHint" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Password Hint" ControlToValidate="txtHint" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            <td>Photo : </td>
                            <td>
                            <asp:FileUpload ID="file" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Select File" Display="Dynamic" ForeColor="Red" ControlToValidate="file"></asp:RequiredFieldValidator>
                            </td>
                            </tr>

                            
                            <tr>
                            <td>
                                <asp:Button ID="btnSave" class="btn btn-primary" OnClick="btnSave_Click" runat="server" Text="Save Data" />
                            </td>
                            </tr>
                            </table>
                            <asp:Label ID="lblMessage" runat="server" text=""></asp:Label>
                        </div>
                    </div>
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
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
