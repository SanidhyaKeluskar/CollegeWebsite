using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class pgStudentAssignment : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        SqlDataSource1.SelectCommand = "SELECT Id, ASubject, AssignmentName, AssignmentDate, SubmissionDate, AssignmentMarks, ADesc FROM TeacherAssignment where status='ON'";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["AssignmentId"] = GridView1.SelectedRow.Cells[1].Text.ToString();
        Response.Redirect("pgStudAssignmentSubmit.aspx");
    }
}