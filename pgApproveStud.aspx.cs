using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Net.Mail;

public partial class pgApproveStud : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        txtId.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtName.Text = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtAddress.Text = GridView1.SelectedRow.Cells[3].Text.ToString();
        txtMobile.Text = GridView1.SelectedRow.Cells[4].Text.ToString();
        txtEmail.Text = GridView1.SelectedRow.Cells[5].Text.ToString();
        txtBranch.Text = GridView1.SelectedRow.Cells[6].Text.ToString();
        txtDiv.Text = GridView1.SelectedRow.Cells[7].Text.ToString();
        txtYear.Text = GridView1.SelectedRow.Cells[8].Text.ToString();
        txtGR.Text = GridView1.SelectedRow.Cells[9].Text.ToString();
        //cmbApprove.Text = GridView1.SelectedRow.Cells[9].Text.ToString();
        cmbApprove.SelectedIndex = cmbApprove.Items.IndexOf(cmbApprove.Items.FindByText(GridView1.SelectedRow.Cells[11].Text.ToString()));
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "update StudReg set studstatus='" + cmbApprove.Text + "' where id='" + txtId.Text + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

      

        txtId.Text = "";
        txtName.Text = "";
        txtAddress.Text = "";
        txtMobile.Text = "";
        txtEmail.Text = "";
        txtDiv.Text = "";
        txtYear.Text = "";
        txtGR.Text = "";
        txtBranch.Text = "";
        cmbApprove.SelectedIndex = 0;
        lblMessage.Text = "Status Updated Successfully";
        SqlDataSource1.SelectCommand = "SELECT Id, StudName, StudAddress, StudMobile, StudMail, StudBranch, StudDiv, StudYear, StudGr, StudPhoto, StudStatus FROM StudReg";
    }
}