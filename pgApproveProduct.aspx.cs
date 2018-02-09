using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class pgApproveProduct : System.Web.UI.Page
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
        cmd.CommandText = "update StudentProduct set PStatus='" + cmbApprove.Text + "' where id='" + txtId.Text + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        txtId.Text = "";
        txtDesc.Text = "";
        txtPCost.Text = "";
        txtPName.Text = "";
        txtPType.Text = "";
        txtSId.Text = "";
        cmbApprove.SelectedIndex = 0;
        lblMessage.Text = "Status Updated Successfully";
        SqlDataSource1.SelectCommand = "SELECT Id, StudID, PType, PName, PCost, Details, PStatus FROM StudentProduct";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        txtId.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtSId.Text = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtPType.Text = GridView1.SelectedRow.Cells[3].Text.ToString();
        txtPName.Text = GridView1.SelectedRow.Cells[4].Text.ToString();
        txtPCost.Text = GridView1.SelectedRow.Cells[5].Text.ToString();
        txtDesc.Text = GridView1.SelectedRow.Cells[6].Text.ToString();
        //cmbApprove.Text = GridView1.SelectedRow.Cells[9].Text.ToString();
        cmbApprove.SelectedIndex = cmbApprove.Items.IndexOf(cmbApprove.Items.FindByText(GridView1.SelectedRow.Cells[7].Text.ToString()));
    }
}