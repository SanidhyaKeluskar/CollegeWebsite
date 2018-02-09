<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pgStudentProduct.aspx.cs" Inherits="pgStudentProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Social :Student Product</title>
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
                        <h5>Student Product</h5>
                        <br />
                        <table>
                        <tr><td><asp:TextBox ID="txtId" Visible="false" runat="server"></asp:TextBox></td></tr>

                        <tr>
                        <td>Student ID</td>
                        <td><asp:TextBox ID="txtSId" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Visible="true" runat="server" ErrorMessage="Student ID" ForeColor="Red" Display="Dynamic" ControlToValidate="txtSID"></asp:RequiredFieldValidator></td>
                        <td>Product Type</td>
                        <td><asp:TextBox ID="txtPType" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Product Type" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPType"></asp:RequiredFieldValidator></td>
                        </tr>

                        <tr>
                        <td>Product Name</td>
                        <td><asp:TextBox ID="txtPName" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Product Name" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPName"></asp:RequiredFieldValidator></td>
                        <td>Product Cost</td>
                        <td><asp:TextBox ID="txtPCost" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Product Cost" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPCost"></asp:RequiredFieldValidator></td>
                        </tr>

                        <tr>
                        <td>Details</td>
                        <td><asp:TextBox ID="txtDesc" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>

                        

                        </table>
                <asp:Button ID="btnSave" class="btn btn-primary btn-sm" OnClick="btnSave_Click" runat="server" Text="Save Data" /> &nbsp;<asp:Button ID="Button2" class="btn btn-primary btn-sm" OnClick="Button2_Click" runat="server" Text="Change Status to Off" />
                <br /><br />
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                <br /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" EmptyDataText="No Record Found" onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="StudID" HeaderText="StudID" 
                            SortExpression="StudID" />
                        <asp:BoundField DataField="PType" HeaderText="PType" SortExpression="PType" />
                        <asp:BoundField DataField="PName" HeaderText="PName" SortExpression="PName" />
                        <asp:BoundField DataField="PCost" HeaderText="PCost" SortExpression="PCost" />
                        <asp:BoundField DataField="Details" HeaderText="Details" 
                            SortExpression="Details" />
                        <asp:BoundField DataField="PStatus" HeaderText="PStatus" 
                            SortExpression="PStatus" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                    </Columns>
                </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CollegeSocialConnectionString %>" 
                    SelectCommand="SELECT [PType], [StudID], [PName], [PCost], [Details], [PStatus], [Id] FROM [StudentProduct]">
                </asp:SqlDataSource>
             
                <br />
                <br />
                <table>
                    <tr>
                        <td><asp:Label ID="Label1" runat="server" Text="Search Product By Name to Buy"></asp:Label></td>
                        <td><asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtSearch" ValidationGroup="Search"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Button ID="Button1" ValidationGroup="Search" runat="server" Text="Search" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
                
                <br />
                <br />
                
                <!-- End Form Elements -->
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="PType" HeaderText="PType" SortExpression="PType" />
                        <asp:BoundField DataField="PName" HeaderText="PName" SortExpression="PName" />
                        <asp:BoundField DataField="PCost" HeaderText="PCost" SortExpression="PCost" />
                        <asp:BoundField DataField="Details" HeaderText="Details" 
                            SortExpression="Details" />
                        <asp:BoundField DataField="StudName" HeaderText="StudName" 
                            SortExpression="StudName" />
                        <asp:BoundField DataField="StudMobile" HeaderText="StudMobile" 
                            SortExpression="StudMobile" />
                        <asp:BoundField DataField="StudMail" HeaderText="StudMail" 
                            SortExpression="StudMail" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CollegeSocialConnectionString %>" 
                    SelectCommand="SELECT StudentProduct.PType, StudentProduct.PName, StudentProduct.PCost, StudentProduct.Details, StudReg.StudName, StudReg.StudMobile, StudReg.StudMail FROM StudentProduct INNER JOIN StudReg ON StudentProduct.StudID = StudReg.Id">
                </asp:SqlDataSource>
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
