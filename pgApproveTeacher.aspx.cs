using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class pgApproveTeacher : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
       
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "update TeacherReg set teacherstatus='"+ cmbApprove.Text +"' where id='"+ txtId.Text +"'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        txtId.Text = "";
        txtName.Text = "";
        txtAddress.Text = "";
        txtMobile.Text = "";
        txtEmail.Text = "";
        txtDepartment.Text ="";
        txtDesignation.Text = "";
        cmbApprove.SelectedIndex = 0;
        lblMessage.Text = "Status Updated Successfully";
        SqlDataSource1.SelectCommand = "SELECT id, teachername, teacheraddress, teachermobile, teachermail, teacherDepartment, teacherDesignation, teacherphoto, teacherstatus FROM TeacherReg";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        txtId.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtName.Text = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtAddress.Text = GridView1.SelectedRow.Cells[3].Text.ToString();
        txtMobile.Text = GridView1.SelectedRow.Cells[4].Text.ToString();
        txtEmail.Text = GridView1.SelectedRow.Cells[5].Text.ToString();
        txtDepartment.Text = GridView1.SelectedRow.Cells[6].Text.ToString();
        txtDesignation.Text = GridView1.SelectedRow.Cells[7].Text.ToString();
        //cmbApprove.Text = GridView1.SelectedRow.Cells[9].Text.ToString();
        cmbApprove.SelectedIndex = cmbApprove.Items.IndexOf(cmbApprove.Items.FindByText(GridView1.SelectedRow.Cells[9].Text.ToString()));
    }

}