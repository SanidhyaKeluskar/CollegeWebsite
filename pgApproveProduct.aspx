<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pgApproveProduct.aspx.cs" Inherits="pgApproveProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Social : Approve Product</title>
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
   <style>td{padding:5px}</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                1
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
                    <h3>Product Approval</h3>
                       <hr />
                       <table>
                        <tr><td><asp:TextBox ID="txtId" Visible="false" runat="server"></asp:TextBox></td></tr>

                        <tr>
                        <td>Student ID</td>
                        <td><asp:TextBox ID="txtSId" ReadOnly="true" class="form-control" runat="server"></asp:TextBox></td>
                        <td>Status</td>
                        <td><asp:DropDownList class="form-control" ID="cmbApprove" runat="server">
                        <asp:ListItem>--Select Status--</asp:ListItem>
                        <asp:ListItem>ON</asp:ListItem>
                        <asp:ListItem>OFF</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ReadOnly="true" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Status" InitialValue="--Select Status--" Display="Dynamic" ForeColor="Red" ControlToValidate="cmbApprove"></asp:RequiredFieldValidator></td>
                        </tr>

                        <tr>
                        <td>Product Name</td>
                        <td><asp:TextBox ID="txtPName" ReadOnly="true" class="form-control" runat="server"></asp:TextBox></td>
                        <td>Product Cost</td>
                        <td><asp:TextBox ID="txtPCost" ReadOnly="true" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>

                        <tr>
                        <td>Product Type</td>
                        <td><asp:TextBox ID="txtPType" ReadOnly="true" class="form-control" runat="server"></asp:TextBox></td>
                        <td>Details</td>
                        <td><asp:TextBox ID="txtDesc" ReadOnly="true" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>

                        </table>
                <asp:Button ID="btnSave" class="btn btn-primary btn-sm" OnClick="btnSave_Click" runat="server" Text="Update" />
                <br /><br />
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                <br /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" EmptyDataText="No Record Found" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                        <asp:BoundField DataField="StudID" HeaderText="StudID" 
                            SortExpression="StudID" />
                        <asp:BoundField DataField="PType" HeaderText="PType" SortExpression="PType" />
                        <asp:BoundField DataField="PName" HeaderText="PName" SortExpression="PName" />
                        <asp:BoundField DataField="PCost" HeaderText="PCost" SortExpression="PCost" />
                        <asp:BoundField DataField="Details" HeaderText="Details" 
                            SortExpression="Details" />
                        <asp:BoundField DataField="PStatus" HeaderText="PStatus" 
                            SortExpression="PStatus" />
                    </Columns>
                </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CollegeSocialConnectionString %>" 
                    SelectCommand="SELECT [Id], [StudID], [PType], [PName], [PCost], [Details], [PStatus] FROM [StudentProduct]">
                </asp:SqlDataSource>
                     <!-- End Form Elements -->
                </div>
            </div>
               
                <!-- /. ROW  -->
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
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
