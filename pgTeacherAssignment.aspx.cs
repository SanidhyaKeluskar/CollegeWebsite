using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class pgTeacherAssignment : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        if(!IsPostBack)
        {
            Auto_Gen();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save Data")
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "insert into TeacherAssignment values('" + txtId.Text + "','" + txtSubject.Text + "','" + txtAssignment.Text + "','" + txtAssignmentDate.Text + "','" + txtSubmissionDate.Text + "','" + txtAssignmentMarks.Text + "','" + txtDesc.Text + "','ON')";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();
            lblMessage.Text = "Data Saved Successfully";
        }
        else
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "Update TeacherAssignment set ASubject='" + txtSubject.Text + "',AssignmentName='" + txtAssignment.Text + "',AssignmentDate='" + txtAssignmentDate.Text + "',SubmissionDate='" + txtSubmissionDate.Text + "',AssignmentMarks='" + txtAssignmentMarks.Text + "',ADesc='" + txtDesc.Text + "' where id='" + txtId.Text + "'";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();
            lblMessage.Text = "Data Updated Successfully";
            
        }
        txtAssignment.Text = "";
        txtAssignmentDate.Text = "";
        txtAssignmentMarks.Text = "";
        txtDesc.Text = "";
        txtSubject.Text = "";
        txtSubmissionDate.Text = "";
        Auto_Gen();
        btnSave.Text = "Save Data";
        btnDelete.Visible = false;
        Button1.Visible = false;
        SqlDataSource1.SelectCommand = "SELECT Id, ASubject, AssignmentName, AssignmentDate, SubmissionDate, AssignmentMarks, ADesc,Status FROM TeacherAssignment";

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "Update TeacherAssignment set ASubject='" + txtSubject.Text + "',AssignmentName='" + txtAssignment.Text + "',AssignmentDate='" + txtAssignmentDate.Text + "',SubmissionDate='" + txtSubmissionDate.Text + "',AssignmentMarks='" + txtAssignmentMarks.Text + "',ADesc='" + txtDesc.Text + "',Status='OFF' where id='" + txtId.Text + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        lblMessage.Text = "Data Updated Successfully";
        txtAssignment.Text = "";
        txtAssignmentDate.Text = "";
        txtAssignmentMarks.Text = "";
        txtDesc.Text = "";
        txtSubject.Text = "";
        txtSubmissionDate.Text = "";
        Auto_Gen();
        btnSave.Text = "Save Data";
        btnDelete.Visible = false;
        Button1.Visible = false;
        SqlDataSource1.SelectCommand = "SELECT Id, ASubject, AssignmentName, AssignmentDate, SubmissionDate, AssignmentMarks, ADesc,Status FROM TeacherAssignment";
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (txtId.Text != "")
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "delete from TeacherAssignment where id='" + txtId.Text + "'";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();
            btnDelete.Visible = false;
        }
        else
        {
            lblMessage.Text = "Select data from table";
        }    
        lblMessage.Text = "Data Deleted Successfully";
        txtAssignment.Text = "";
        txtAssignmentDate.Text = "";
        txtAssignmentMarks.Text = "";
        txtDesc.Text = "";
        txtSubject.Text = "";
        txtSubmissionDate.Text = "";
        btnSave.Text = "Save Data";
        Auto_Gen();
        SqlDataSource1.SelectCommand = "SELECT Id, ASubject, AssignmentName, AssignmentDate, SubmissionDate, AssignmentMarks, ADesc FROM TeacherAssignment";

    }
    protected void GridView1_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        txtId.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtSubject.Text = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtAssignment.Text = GridView1.SelectedRow.Cells[3].Text.ToString();
        txtAssignmentDate.Text = GridView1.SelectedRow.Cells[4].Text.ToString();
        txtSubmissionDate.Text = GridView1.SelectedRow.Cells[5].Text.ToString();
        txtAssignmentMarks.Text = GridView1.SelectedRow.Cells[6].Text.ToString();
        txtDesc.Text = GridView1.SelectedRow.Cells[7].Text.ToString();
        btnSave.Text = "Edit Data";
        Button1.Visible = true;
        btnDelete.Visible = true;
    }
    private void Auto_Gen()
    {
        int cnt;
        string id;
        int temp;
        temp = 0;
        cnt = 0;
        id = "";
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from TeacherAssignment";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            cnt = int.Parse(rs.GetValue(0).ToString());
        }
        rs.Close();
        cmd.Dispose();
        cn.Close();
        if (cnt > 0)
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select max(id) from TeacherAssignment";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                id = rs.GetValue(0).ToString();
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();
            temp = int.Parse(id.Substring(1, 9));
            temp++;
            id = "";
            id = temp.ToString();
            if (id.Length == 1)
            {
                id = "E00000000" + id;
            }
            else if (id.Length == 2)
            {
                id = "E0000000" + id;
            }
            else if (id.Length == 3)
            {
                id = "E000000" + id;
            }
            else if (id.Length == 4)
            {
                id = "E00000" + id;
            }
            else if (id.Length == 5)
            {
                id = "E0000" + id;
            }
            else if (id.Length == 6)
            {
                id = "E000" + id;
            }
            else if (id.Length == 7)
            {
                id = "E00" + id;
            }
            else if (id.Length == 8)
            {
                id = "E0" + id;
            }
            else if (id.Length == 9)
            {
                id = "E" + id;
            }
            txtId.Text = id;
        }
        else
        {
            txtId.Text = "E000000001";
        }
    }
}

