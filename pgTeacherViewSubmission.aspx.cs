using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class pgTeacherViewSubmission : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        if (!IsPostBack)
        {
            SqlDataSource1.SelectCommand = "select  assignmentsubmission.id, assignmentsubmission.AssignmentId, assignmentsubmission.UserId, assignmentsubmission.Date, assignmentsubmission.AFile, assignmentsubmission.AStatus,studreg.studname from studreg right join assignmentsubmission on studreg.id=assignmentsubmission.userid;";

        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "update AssignmentSubmission set AStatus='" + cmbStatus.Text + "' where id='" + txtId.Text + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        txtId.Text = "";
        SqlDataSource1.SelectCommand = "select  assignmentsubmission.id, assignmentsubmission.AssignmentId, assignmentsubmission.UserId, assignmentsubmission.Date, assignmentsubmission.AFile, assignmentsubmission.AStatus,studreg.studname from studreg right join assignmentsubmission on studreg.id=assignmentsubmission.userid;";
        cmbStatus.SelectedIndex = 0;
        lblMessage.Text = "Status Updated Successfully";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtId.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        HyperLink1.NavigateUrl = "Assignment/" + GridView1.SelectedRow.Cells[5].Text.ToString();
        cmbStatus.SelectedIndex = cmbStatus.Items.IndexOf(cmbStatus.Items.FindByText(GridView1.SelectedRow.Cells[6].Text.ToString()));
    }
}