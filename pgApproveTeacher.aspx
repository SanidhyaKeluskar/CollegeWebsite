<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pgApproveTeacher.aspx.cs" Inherits="pgApproveTeacher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Social : Approve Teacher</title>
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
   <style>
    td 
   {
       padding:5px;
   }
   </style>
</head>
<body>
                 <form runat="server" id="form1">
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Approve Teacher</span>
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
                       <h3>Approve Teacher</h3>
                       <hr />
                       <table>

                            <tr>
                            <td>ID. : </td>
                            <td><asp:TextBox ID="txtId" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                             </td>
                            <td>Status : </td>
                            <td><asp:DropDownList ID="cmbApprove" class="form-control" runat="server">
                             <asp:ListItem>--Select Status--</asp:ListItem>
                             <asp:ListItem>ON</asp:ListItem>
                             <asp:ListItem>OFF</asp:ListItem>
                            </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Select Status" InitialValue="--Select Status--" Display="Dynamic" ForeColor="Red" ControlToValidate="cmbApprove">
                                </asp:RequiredFieldValidator>
                             </td>
                            </tr>

                            <tr>
                            <td>Name : </td>
                            <td><asp:TextBox ID="txtName" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                             </td>
                            <td>Mobile No. : </td>
                            <td><asp:TextBox ID="txtMobile" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                             </td>
                            </tr>

                            <tr>
                            <td>Email-ID : </td>
                            <td><asp:TextBox ID="txtEmail" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                             </td>
                            <td>Department : </td>
                            <td><asp:TextBox ID="txtDepartment" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                             </td>
                            </tr>

                            <tr>
                            <td>Designation : </td>
                            <td><asp:TextBox ID="txtDesignation" class="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                             </td>
                            <td>Address : </td>
                            <td><asp:TextBox ID="txtAddress" ReadOnly="true" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                             </td>
                            </tr>
                            
                            </table>
                            <br />
                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Update Status"/>
                            <br /><br />
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><br /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"/>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="teachername" HeaderText="teachername" 
                            SortExpression="teachername" />
                        <asp:BoundField DataField="teacheraddress" HeaderText="teacheraddress" 
                            SortExpression="teacheraddress" />
                        <asp:BoundField DataField="teachermobile" HeaderText="teachermobile" 
                            SortExpression="teachermobile" />
                        <asp:BoundField DataField="teachermail"  HeaderText="teachermail" 
                            SortExpression="teachermail" />
                        <asp:BoundField DataField="teacherDepartment" HeaderText="teacherDepartment" 
                            SortExpression="teacherDepartment" />
                        <asp:BoundField DataField="teacherDesignation" HeaderText="teacherDesignation" 
                            SortExpression="teacherDesignation" />
                        <asp:BoundField DataField="teacherphoto" HeaderText="teacherphoto" 
                            SortExpression="teacherphoto" />
                        <asp:BoundField DataField="teacherstatus" HeaderText="teacherstatus" 
                            SortExpression="teacherstatus" />
                    </Columns>
                </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CollegeSocialConnectionString %>" 
                    SelectCommand="SELECT [id], [teachername], [teacheraddress], [teachermobile], [teachermail], [teacherDepartment], [teacherDesignation], [teacherphoto], [teacherstatus] FROM [TeacherReg]">
                </asp:SqlDataSource>
                     <!-- End Form Elements -->
                </div>
            </div>
               
                <!-- /. ROW  -->
    </div>
             <!-- /. PAGE INNER  -->
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
