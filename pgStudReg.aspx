<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pgStudReg.aspx.cs" Inherits="pgStudReg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Social : Student Registration</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   <style>td{padding:5px;}
       .auto-style1 {
           height: 79px;
       }
       .auto-style4 {
           width: 227px;
       }
       .auto-style5 {
           height: 79px;
           width: 227px;
       }
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
                <a class="navbar-brand" href="pgStudReg.aspx">Registration</a> 
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
                        <a  href="pgStudLogin.aspx"><i class=""></i> Login</a>
                    </li>
                    
				
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h5>Welcome Student, </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Student Registration
                        </div>
                        <div class="panel-body">
                        <table>
                       
                            <asp:TextBox ID="txtId" Visible="false" class="form-control" runat="server"></asp:TextBox>
                            
                            <tr>
                            <td>Name : </td>
                            <td class="auto-style4"><asp:TextBox ID="txtName" class="form-control" runat="server" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            <td>Address : </td>
                            <td class="auto-style4"><asp:TextBox ID="txtAddress" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Address " ControlToValidate="txtAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            </tr>
                            
                            <tr>
                            <td>Mobile No. : </td>
                            <td class="auto-style4"><asp:TextBox ID="txtMobile" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Contact No." ControlToValidate="txtMobile" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            <td>Email-ID : </td>
                            <td class="auto-style4"><asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            </tr>

                            <tr>
                            <td class="auto-style1">Password : </td>
                            <td class="auto-style5"><asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            <td class="auto-style1">Re-Password : </td>
                            <td class="auto-style5"><asp:TextBox ID="txtRPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Re-Password" ControlToValidate="txtRPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Missmatch" Display="Dynamic" ForeColor="Red" ControlToValidate="txtRPassword" ControlToCompare="txtPassword"></asp:CompareValidator> 
                            </td>
                            </tr>       

                            <tr>
                            <td>Branch : </td>
                            <td class="auto-style4">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="200px">
                                    <asp:ListItem>Select Branch</asp:ListItem>
                                    <asp:ListItem>IT</asp:ListItem>
                                    <asp:ListItem>computer</asp:ListItem>
                                    <asp:ListItem>EXTC</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="Enter Branch" ForeColor="Red" InitialValue="Select Branch"></asp:RequiredFieldValidator>
                             </td>
                            <td>Div : </td>
                            <td class="auto-style4">
                                <asp:DropDownList ID="DropDownList2" runat="server" Width="200px">
                                    <asp:ListItem>Select Div</asp:ListItem>
                                    <asp:ListItem>Div 1</asp:ListItem>
                                    <asp:ListItem>Div 2</asp:ListItem>
                                    <asp:ListItem>Div 3</asp:ListItem>
                                </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Div" ControlToValidate="DropDownList2" ForeColor="Red" EnableTheming="True" InitialValue="Select Div"></asp:RequiredFieldValidator>
                             </td>
                            </tr>

                            <tr>
                            <td>Year : </td>
                            <td class="auto-style4">
                                <asp:DropDownList ID="DropDownList3" runat="server" Width="200px">
                                    <asp:ListItem>Select Year</asp:ListItem>
                                    <asp:ListItem>F.E</asp:ListItem>
                                    <asp:ListItem>S.E</asp:ListItem>
                                    <asp:ListItem>T.E</asp:ListItem>
                                    <asp:ListItem>B.E</asp:ListItem>
                                </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Year" ControlToValidate="DropDownList3" ForeColor="Red" InitialValue="Select Year"></asp:RequiredFieldValidator>
                             </td>
                            <td>GR No. :</td>
                            <td class="auto-style4">
                                <asp:DropDownList ID="DropDownList4" runat="server" Width="200px">
                                    <asp:ListItem>Select Group</asp:ListItem>
                                    <asp:ListItem>GR1</asp:ListItem>
                                    <asp:ListItem>GR2</asp:ListItem>
                                    <asp:ListItem>GR3</asp:ListItem>
                                </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Enter GR No." ControlToValidate="DropDownList4" ForeColor="Red" InitialValue="Select Group"></asp:RequiredFieldValidator>
                             </td>
                            </tr>

                            <tr>
                            <td>Password Hint : </td>
                            <td class="auto-style4"><asp:TextBox ID="txtHint" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter Password Hint" ControlToValidate="txtHint" ForeColor="Red"></asp:RequiredFieldValidator>
                             </td>
                            <td>Photo : </td>
                            <td class="auto-style4">
                            <asp:FileUpload ID="file" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Select File" Display="Dynamic" ForeColor="Red" ControlToValidate="file"></asp:RequiredFieldValidator>
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
